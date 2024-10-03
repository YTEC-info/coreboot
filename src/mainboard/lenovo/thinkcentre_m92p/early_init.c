/* SPDX-License-Identifier: GPL-2.0-only */

#include <bootblock_common.h>
#include <device/pci_ops.h>
#include <southbridge/intel/bd82x6x/pch.h>

void bootblock_mainboard_early_init(void)
{
	pci_write_config16(PCI_DEV(0, 0x1f, 0), 0x82, 0x1c01);
	pci_write_config16(PCI_DEV(0, 0x1f, 0), 0x80, 0x0000);
}
