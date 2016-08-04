/*
 * This file is part of the coreboot project.
 *
 * Copyright (C) 2012 The ChromiumOS Authors.  All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#if CONFIG_HAVE_ACPI_RESUME == 1
#include <arch/acpi.h>
#endif
#include <cbmem.h>
#include <console/console.h>
#if CONFIG_ARCH_X86
#include <pc80/mc146818rtc.h>
#endif
#include <bcd.h>
#include <boot_device.h>
#include <commonlib/region.h>
#include <fmap.h>
#include <rtc.h>
#include <smbios.h>
#include <spi-generic.h>
#include <spi_flash.h>
#include <stdint.h>
#include <string.h>
#include <elog.h>
#include "elog_internal.h"


#if CONFIG_ELOG_DEBUG
#define elog_debug(STR...) printk(BIOS_DEBUG, STR)
#else
#define elog_debug(STR...)
#endif

/*
 * Static variables for ELOG state
 */
static u16 total_size;
static u32 flash_base;
static u16 full_threshold;
static u16 shrink_size;

static elog_area_state area_state;
static elog_header_state header_state;
static elog_event_buffer_state event_buffer_state;

static u16 next_event_offset;
static u16 event_count;

static struct spi_flash *elog_spi;
/* Device that mirrors the eventlog in memory. */
static struct mem_region_device mirror_dev;

static enum {
	ELOG_UNINITIALIZED = 0,
	ELOG_INITIALIZED,
	ELOG_BROKEN,
} elog_initialized = ELOG_UNINITIALIZED;

static inline struct region_device *mirror_dev_get(void)
{
	return &mirror_dev.rdev;
}

static size_t elog_events_start(void)
{
	/* Events are added directly after the header. */
	return sizeof(struct elog_header);
}

static size_t elog_events_total_space(void)
{
	return total_size - elog_events_start();
}

/*
 * Pointer to an event log header in the event data area
 */
static struct event_header *elog_get_event_buffer(size_t offset, size_t size)
{
	return rdev_mmap(mirror_dev_get(), offset, size);
}

static void elog_put_event_buffer(struct event_header *event)
{
	rdev_munmap(mirror_dev_get(), event);
}

/*
 * Update the checksum at the last byte
 */
static void elog_update_checksum(struct event_header *event, u8 checksum)
{
	u8 *event_data = (u8*)event;
	event_data[event->length - 1] = checksum;
}

/*
 * Simple byte checksum for events
 */
static u8 elog_checksum_event(struct event_header *event)
{
	u8 index, checksum = 0;
	u8 *data = (u8*)event;

	for (index = 0; index < event->length; index++)
		checksum += data[index];
	return checksum;
}

/*
 * Check if mirrored buffer is filled with ELOG_TYPE_EOL byte from the
 * provided offset to the end of the mirrored buffer.
 */
static int elog_is_buffer_clear(size_t offset)
{
	size_t i;
	const struct region_device *rdev = mirror_dev_get();
	size_t size = region_device_sz(rdev) - offset;
	uint8_t *buffer = rdev_mmap(rdev, offset, size);
	int ret = 1;

	elog_debug("elog_is_buffer_clear(offset=%zu size=%zu)\n", offset, size);

	if (buffer == NULL)
		return 0;

	for (i = 0; i < size; i++) {
		if (buffer[i] != ELOG_TYPE_EOL) {
			ret = 0;
			break;
		}
	}
	rdev_munmap(rdev, buffer);
	return ret;
}

/*
 * Check that the ELOG area has been initialized and is valid.
 */
static int elog_is_area_valid(void)
{
	elog_debug("elog_is_area_valid()\n");

	if (area_state != ELOG_AREA_HAS_CONTENT)
		return 0;
	if (header_state != ELOG_HEADER_VALID)
		return 0;
	if (event_buffer_state != ELOG_EVENT_BUFFER_OK)
		return 0;
	return 1;
}

/*
 * Verify if the mirrored elog structure is valid.
 * Returns 1 if the header is valid, 0 otherwise
 */
static int elog_is_header_valid(void)
{
	struct elog_header *header;

	elog_debug("elog_is_header_valid()\n");

	header = rdev_mmap(mirror_dev_get(), 0, sizeof(*header));

	if (header == NULL) {
		printk(BIOS_ERR, "ELOG: could not map header.\n");
		return 0;
	}

	if (header->magic != ELOG_SIGNATURE) {
		printk(BIOS_ERR, "ELOG: header magic 0x%X != 0x%X\n",
		       header->magic, ELOG_SIGNATURE);
		return 0;
	}
	if (header->version != ELOG_VERSION) {
		printk(BIOS_ERR, "ELOG: header version %u != %u\n",
		       header->version, ELOG_VERSION);
		return 0;
	}
	if (header->header_size != sizeof(*header)) {
		printk(BIOS_ERR, "ELOG: header size mismatch %u != %zu\n",
		       header->header_size, sizeof(*header));
		return 0;
	}
	return 1;
}

/*
 * Validate the event header and data.
 */
static size_t elog_is_event_valid(size_t offset)
{
	uint8_t checksum;
	struct event_header *event;
	uint8_t len;
	const size_t len_offset = offsetof(struct event_header, length);
	const size_t size = sizeof(len);

	/* Read and validate length. */
	if (rdev_readat(mirror_dev_get(), &len, offset + len_offset, size) < 0)
		return 0;

	/* Event length must be at least header size + checksum */
	if (len < (sizeof(*event) + sizeof(checksum)))
		return 0;

	if (len > MAX_EVENT_SIZE)
		return 0;

	event = elog_get_event_buffer(offset, len);
	if (!event)
		return 0;

	/* If event checksum is invalid the area is corrupt */
	checksum = elog_checksum_event(event);
	elog_put_event_buffer(event);

	if (checksum != 0)
		return 0;

	/* Event is valid */
	return len;
}

/*
 * Write 'size' bytes of data from provided 'offset' in the mirrored elog to
 * the flash backing store. This will not erase the flash and it assumes the
 * flash area has been erased appropriately.
 */
static void elog_flash_write(size_t offset, size_t size)
{
	void *address;
	const struct region_device *rdev = mirror_dev_get();

	if (!size || !elog_spi)
		return;

	address = rdev_mmap(rdev, offset, size);

	/* Ensure offset is absolute. */
	offset += flash_base;

	elog_debug("elog_flash_write(address=0x%p offset=0x%08x size=%u)\n",
		   address, offset, size);

	if (address == NULL)
		return;

	/* Write the data to flash */
	elog_spi->write(elog_spi, offset, size, address);

	rdev_munmap(rdev, address);
}

/*
 * Erase the first block specified in the address.
 * Only handles flash area within a single flash block.
 */
static void elog_flash_erase(void)
{
	if (!elog_spi)
		return;

	elog_debug("elog_flash_erase(offset=0x%08x size=%u)\n",
		   flash_base, total_size);

	/* Erase the sectors in this region */
	elog_spi->erase(elog_spi, flash_base, total_size);
}

/*
 * Scan the event area and validate each entry and update the ELOG state.
 */
static void elog_update_event_buffer_state(void)
{
	u32 count = 0;
	size_t offset = elog_events_start();

	elog_debug("elog_update_event_buffer_state()\n");

	/* Go through each event and validate it */
	while (1) {
		uint8_t type;
		const size_t type_offset = offsetof(struct event_header, type);
		size_t len;
		const size_t size = sizeof(type);

		if (rdev_readat(mirror_dev_get(), &type,
				offset + type_offset, size) < 0) {
			event_buffer_state = ELOG_EVENT_BUFFER_CORRUPTED;
			break;
		}

		/* The end of the event marker has been found */
		if (type == ELOG_TYPE_EOL)
			break;

		/* Validate the event */
		len = elog_is_event_valid(offset);

		if (!len) {
			event_buffer_state = ELOG_EVENT_BUFFER_CORRUPTED;
			break;
		}

		/* Move to the next event */
		count++;
		offset += len;
	}

	/* Ensure the remaining buffer is empty */
	if (!elog_is_buffer_clear(offset))
		event_buffer_state = ELOG_EVENT_BUFFER_CORRUPTED;

	/* Update ELOG state */
	event_count = count;
	next_event_offset = offset;
}

static void elog_scan_flash(void)
{
	elog_debug("elog_scan_flash()\n");
	void *mirror_buffer;
	const struct region_device *rdev = mirror_dev_get();

	area_state = ELOG_AREA_UNDEFINED;
	header_state = ELOG_HEADER_INVALID;
	event_buffer_state = ELOG_EVENT_BUFFER_OK;

	/* Fill memory buffer by reading from SPI */
	mirror_buffer = rdev_mmap_full(rdev);
	elog_spi->read(elog_spi, flash_base, total_size, mirror_buffer);
	rdev_munmap(rdev, mirror_buffer);

	next_event_offset = elog_events_start();
	event_count = 0;

	/* Check if the area is empty or not */
	if (elog_is_buffer_clear(0)) {
		area_state = ELOG_AREA_EMPTY;
		return;
	}

	area_state = ELOG_AREA_HAS_CONTENT;

	/* Validate the header */
	if (!elog_is_header_valid()) {
		header_state = ELOG_HEADER_INVALID;
		return;
	}

	header_state = ELOG_HEADER_VALID;
	elog_update_event_buffer_state();
}

static size_t elog_write_header_in_mirror(void)
{
	static const struct elog_header header = {
		.magic = ELOG_SIGNATURE,
		.version = ELOG_VERSION,
		.header_size = sizeof(struct elog_header),
		.reserved = {
			[0] = ELOG_TYPE_EOL,
			[1] = ELOG_TYPE_EOL,
		},
	};

	rdev_writeat(mirror_dev_get(), &header, 0, sizeof(header));
	return sizeof(header);
}

static void elog_prepare_empty(void)
{

	elog_debug("elog_prepare_empty()\n");

	/* Write out the header */
	size_t size = elog_write_header_in_mirror();
	elog_flash_write(0, size);

	elog_scan_flash();
}

static void elog_move_events_to_front(size_t offset, size_t size)
{
	void *src;
	void *dest;
	size_t start_offset = elog_events_start();
	const struct region_device *rdev = mirror_dev_get();

	src = rdev_mmap(rdev, offset, size);
	dest = rdev_mmap(rdev, start_offset, size);

	if (src == NULL || dest == NULL) {
		printk(BIOS_ERR, "ELOG: failure moving events!\n");
		rdev_munmap(rdev, dest);
		rdev_munmap(rdev, src);
		return;
	}

	/* Move the events to the front. */
	memmove(dest, src, size);
	rdev_munmap(rdev, dest);
	rdev_munmap(rdev, src);

	/* Mark EOL for previously used buffer until the end. */
	offset = start_offset + size;
	size = region_device_sz(rdev) - offset;
	dest = rdev_mmap(rdev, offset, size);
	if (dest == NULL) {
		printk(BIOS_ERR, "ELOG: failure filling EOL!\n");
		return;
	}
	memset(dest, ELOG_TYPE_EOL, size);
	rdev_munmap(rdev, dest);
}

/*
 * Shrink the log, deleting old entries and moving the
 * remaining ones to the front of the log.
 */
static int elog_shrink(void)
{
	const struct region_device *rdev = mirror_dev_get();
	size_t offset = elog_events_start();

	elog_debug("elog_shrink()\n");

	while (1) {
		const size_t type_offset = offsetof(struct event_header, type);
		const size_t len_offset = offsetof(struct event_header, length);
		const size_t size = sizeof(uint8_t);
		uint8_t type;
		uint8_t len;

		/* Next event has exceeded constraints */
		if (offset > shrink_size)
			break;

		if (rdev_readat(rdev, &type, offset + type_offset, size) < 0)
			break;

		/* Reached the end of the area */
		if (type == ELOG_TYPE_EOL)
			break;

		if (rdev_readat(rdev, &len, offset + len_offset, size) < 0)
			break;

		offset += len;
	}

	elog_move_events_to_front(offset, next_event_offset - offset);

	elog_flash_erase();
	elog_flash_write(0, total_size);
	elog_scan_flash();

	/* Ensure the area was successfully erased */
	if (next_event_offset >= full_threshold) {
		printk(BIOS_ERR, "ELOG: Flash area was not erased!\n");
		return -1;
	}

	/* Add clear event */
	elog_add_event_word(ELOG_TYPE_LOG_CLEAR, offset - elog_events_start());

	return 0;
}

#ifndef __SMM__
#if IS_ENABLED(CONFIG_ARCH_X86)

/*
 * Convert a flash offset into a memory mapped flash address
 */
static inline u8 *elog_flash_offset_to_address(void)
{
	/* Only support memory-mapped SPI devices. */
	if (!IS_ENABLED(CONFIG_SPI_FLASH_MEMORY_MAPPED))
		return NULL;

	if (!elog_spi)
		return NULL;

	return rdev_mmap(boot_device_ro(), flash_base, total_size);
}

/*
 * Fill out SMBIOS Type 15 table entry so the
 * event log can be discovered at runtime.
 */
int elog_smbios_write_type15(unsigned long *current, int handle)
{
	struct smbios_type15 *t = (struct smbios_type15 *)*current;
	int len = sizeof(struct smbios_type15);

#if CONFIG_ELOG_CBMEM
	/* Save event log buffer into CBMEM for the OS to read */
	void *cbmem = cbmem_add(CBMEM_ID_ELOG, total_size);
	if (!cbmem)
		return 0;
	rdev_readat(mirror_dev_get(), cbmem, 0, total_size);
#endif

	memset(t, 0, len);
	t->type = SMBIOS_EVENT_LOG;
	t->length = len - 2;
	t->handle = handle;
	t->area_length = total_size - 1;
	t->header_offset = 0;
	t->data_offset = sizeof(struct elog_header);
	t->access_method = SMBIOS_EVENTLOG_ACCESS_METHOD_MMIO32;
	t->log_status = SMBIOS_EVENTLOG_STATUS_VALID;
	t->change_token = 0;
#if CONFIG_ELOG_CBMEM
	t->address = (u32)cbmem;
#else
	t->address = (u32)elog_flash_offset_to_address();
#endif
	t->header_format = ELOG_HEADER_TYPE_OEM;
	t->log_type_descriptors = 0;
	t->log_type_descriptor_length = 2;

	*current += len;
	return len;
}
#endif
#endif

/*
 * Clear the entire event log
 */
int elog_clear(void)
{
	elog_debug("elog_clear()\n");

	/* Make sure ELOG structures are initialized */
	if (elog_init() < 0)
		return -1;

	/* Erase flash area */
	elog_flash_erase();
	elog_prepare_empty();

	if (!elog_is_area_valid())
		return -1;

	/* Log the clear event */
	elog_add_event_word(ELOG_TYPE_LOG_CLEAR, elog_events_total_space());

	return 0;
}

static void elog_find_flash(void)
{
	struct region r;
	size_t reserved_space = ELOG_MIN_AVAILABLE_ENTRIES * MAX_EVENT_SIZE;

	elog_debug("elog_find_flash()\n");

	/* Find the ELOG base and size in FMAP */
	if (fmap_locate_area("RW_ELOG", &r) < 0) {
		printk(BIOS_WARNING, "ELOG: Unable to find RW_ELOG in FMAP\n");
		flash_base = total_size = 0;
	} else {
		flash_base = region_offset(&r);
		/* Keep 4KiB max size until large malloc()s have been fixed. */
		total_size = MIN(4*KiB, region_sz(&r));
	}

	full_threshold = total_size - reserved_space;
	shrink_size = MIN(total_size * ELOG_SHRINK_PERCENTAGE / 100,
								full_threshold);
}

/*
 * Event log main entry point
 */
int elog_init(void)
{
	void *mirror_buffer;

	switch (elog_initialized) {
	case ELOG_UNINITIALIZED:
		break;
	case ELOG_INITIALIZED:
		return 0;
	case ELOG_BROKEN:
		return -1;
	}
	elog_initialized = ELOG_BROKEN;

	elog_debug("elog_init()\n");

	/* Probe SPI chip. SPI controller must already be initialized. */
	elog_spi = spi_flash_probe(CONFIG_BOOT_MEDIA_SPI_BUS, 0);
	if (!elog_spi) {
		printk(BIOS_ERR, "ELOG: Unable to find SPI flash\n");
		return -1;
	}

	/* Set up the backing store */
	elog_find_flash();
	if (flash_base == 0) {
		printk(BIOS_ERR, "ELOG: Invalid flash base\n");
		return -1;
	} else if (total_size < sizeof(struct elog_header) + MAX_EVENT_SIZE) {
		printk(BIOS_ERR, "ELOG: Region too small to hold any events\n");
		return -1;
	} else if (total_size - shrink_size >= full_threshold) {
		printk(BIOS_ERR,
			"ELOG: SHRINK_PERCENTAGE set too small for MIN_AVAILABLE_ENTRIES\n");
		return -1;
	}

	mirror_buffer = malloc(total_size);
	if (!mirror_buffer) {
		printk(BIOS_ERR, "ELOG: Unable to allocate backing store\n");
		return -1;
	}
	mem_region_device_rw_init(&mirror_dev, mirror_buffer, total_size);

	/* Load the log from flash */
	elog_scan_flash();

	/* Prepare the flash if necessary */
	if (header_state == ELOG_HEADER_INVALID ||
		event_buffer_state == ELOG_EVENT_BUFFER_CORRUPTED) {
		/* If the header is invalid or the events are corrupted,
		 * no events can be salvaged so erase the entire area. */
		printk(BIOS_ERR, "ELOG: flash area invalid\n");
		elog_flash_erase();
		elog_prepare_empty();
	}

	if (area_state == ELOG_AREA_EMPTY)
		elog_prepare_empty();

	if (!elog_is_area_valid()) {
		printk(BIOS_ERR, "ELOG: Unable to prepare flash\n");
		return -1;
	}

	printk(BIOS_INFO, "ELOG: FLASH @0x%p [SPI 0x%08x]\n",
	       mirror_buffer, flash_base);

	printk(BIOS_INFO, "ELOG: area is %d bytes, full threshold %d,"
	       " shrink size %d\n", total_size, full_threshold, shrink_size);

	elog_initialized = ELOG_INITIALIZED;

	/* Shrink the log if we are getting too full */
	if (next_event_offset >= full_threshold)
		if (elog_shrink() < 0)
			return -1;

	/* Log a clear event if necessary */
	if (event_count == 0)
		elog_add_event_word(ELOG_TYPE_LOG_CLEAR,
					elog_events_total_space());

#if !defined(__SMM__)
	/* Log boot count event except in S3 resume */
#if CONFIG_ELOG_BOOT_COUNT == 1
#if CONFIG_HAVE_ACPI_RESUME == 1
		if (!acpi_is_wakeup_s3())
#endif
		elog_add_event_dword(ELOG_TYPE_BOOT, boot_count_read());
#else
		/* If boot count is not implemented, fake it. */
		elog_add_event_dword(ELOG_TYPE_BOOT, 0);
#endif

#if CONFIG_ARCH_X86
	/* Check and log POST codes from previous boot */
	if (CONFIG_CMOS_POST)
		cmos_post_log();
#endif
#endif

	elog_initialized = ELOG_INITIALIZED;

	return 0;
}

/*
 * Populate timestamp in event header with current time
 */
static void elog_fill_timestamp(struct event_header *event)
{
#if IS_ENABLED(CONFIG_RTC)
	struct rtc_time time;

	rtc_get(&time);
	event->second = bin2bcd(time.sec);
	event->minute = bin2bcd(time.min);
	event->hour = bin2bcd(time.hour);
	event->day = bin2bcd(time.mday);
	event->month = bin2bcd(time.mon);
	event->year = bin2bcd(time.year % 100);

	/* Basic sanity check of expected ranges */
	if (event->month > 0x12 || event->day > 0x31 || event->hour > 0x23 ||
	    event->minute > 0x59 || event->second > 0x59)
#endif
	{
		event->year   = 0;
		event->month  = 0;
		event->day    = 0;
		event->hour   = 0;
		event->minute = 0;
		event->second = 0;
	}
}

/*
 * Add an event to the log
 */
void elog_add_event_raw(u8 event_type, void *data, u8 data_size)
{
	struct event_header *event;
	u8 event_size;

	elog_debug("elog_add_event_raw(type=%X)\n", event_type);

	/* Make sure ELOG structures are initialized */
	if (elog_init() < 0)
		return;

	/* Header + Data + Checksum */
	event_size = sizeof(*event) + data_size + 1;
	if (event_size > MAX_EVENT_SIZE) {
		printk(BIOS_ERR, "ELOG: Event(%X) data size too "
		       "big (%d)\n", event_type, event_size);
		return;
	}

	/* Make sure event data can fit */
	event = elog_get_event_buffer(next_event_offset, event_size);
	if (event == NULL) {
		printk(BIOS_ERR, "ELOG: Event(%X) does not fit\n",
		       event_type);
		return;
	}

	/* Fill out event data */
	event->type = event_type;
	event->length = event_size;
	elog_fill_timestamp(event);

	if (data_size)
		memcpy(&event[1], data, data_size);

	/* Zero the checksum byte and then compute checksum */
	elog_update_checksum(event, 0);
	elog_update_checksum(event, -(elog_checksum_event(event)));
	elog_put_event_buffer(event);

	/* Update the ELOG state */
	event_count++;

	elog_flash_write(next_event_offset, event_size);

	next_event_offset += event_size;

	printk(BIOS_INFO, "ELOG: Event(%X) added with size %d\n",
	       event_type, event_size);

	/* Shrink the log if we are getting too full */
	if (next_event_offset >= full_threshold)
		elog_shrink();
}

void elog_add_event(u8 event_type)
{
	elog_add_event_raw(event_type, NULL, 0);
}

void elog_add_event_byte(u8 event_type, u8 data)
{
	elog_add_event_raw(event_type, &data, sizeof(data));
}

void elog_add_event_word(u8 event_type, u16 data)
{
	elog_add_event_raw(event_type, &data, sizeof(data));
}

void elog_add_event_dword(u8 event_type, u32 data)
{
	elog_add_event_raw(event_type, &data, sizeof(data));
}

void elog_add_event_wake(u8 source, u32 instance)
{
	struct elog_event_data_wake wake = {
		.source = source,
		.instance = instance
	};
	elog_add_event_raw(ELOG_TYPE_WAKE_SOURCE, &wake, sizeof(wake));
}
