/* SPDX-License-Identifier: GPL-2.0-only */

#include <device/azalia_device.h>

const u32 cim_verb_data[] = {
	0x10ec0662,	/* Codec Vendor / Device ID: Realtek */
	0x17aa3083,	/* Subsystem ID */
	11,		/* Number of 4 dword sets */
	AZALIA_SUBVENDOR(0, 0x17aa3083),
	AZALIA_PIN_CFG(0, 0x14, 0x01014010),
	AZALIA_PIN_CFG(0, 0x15, 0x90170120),
	AZALIA_PIN_CFG(0, 0x16, 0x411111f0),
	AZALIA_PIN_CFG(0, 0x18, 0x01a19830),
	AZALIA_PIN_CFG(0, 0x19, 0x02a19831),
	AZALIA_PIN_CFG(0, 0x1a, 0x0181303f),
	AZALIA_PIN_CFG(0, 0x1b, 0x0221401f),
	AZALIA_PIN_CFG(0, 0x1c, 0x411111f0),
	AZALIA_PIN_CFG(0, 0x1d, 0x4005c603),
	AZALIA_PIN_CFG(0, 0x1e, 0x411111f0),

};

const u32 pc_beep_verbs[0] = {};

AZALIA_ARRAY_SIZES;
