/* SPDX-License-Identifier: GPL-2.0-only */

#include <mipi/panel.h>

struct panel_serializable_data BOE_NV110WUM_L60 = {
	.edid = {
		.ascii_string = "NV110WUM-L60",
		.manufacturer_name = "BOE",
		.panel_bits_per_color = 8,
		.panel_bits_per_pixel = 24,
		.mode = {
			.pixel_clock = 166400,
			.lvds_dual_channel = 0,
			.refresh = 60,
			.ha = 1200, .hbl = 150, .hso = 65, .hspw = 20,
			.va = 1920, .vbl = 135, .vso = 115, .vspw = 8,
			.phsync = '-', .pvsync = '-',
			.x_mm = 147, .y_mm = 235,
		},
	},
	.init = {
		PANEL_DELAY(15),
		PANEL_DCS(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),
		PANEL_DCS(0xB1, 0x2C, 0xAF, 0xAF, 0x2B, 0xEB, 0x42, 0xE1, 0x4D,
			0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11, 0x65, 0x00,
			0x88, 0xFA, 0xFF, 0xFF, 0x8F, 0xFF, 0x08, 0x9A, 0x33),
		PANEL_DCS(0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x12, 0x71, 0x3C,
			0xA3, 0x11, 0x00, 0x00, 0x00, 0x88, 0xF5, 0x22, 0x8F),
		PANEL_DCS(0xB4, 0x49, 0x49, 0x32, 0x32, 0x14, 0x32, 0x84, 0x6E,
			0x84, 0x6E, 0x01, 0x9C),
		PANEL_DCS(0xE9, 0xCD),
		PANEL_DCS(0xBA, 0x84),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xBC, 0x1B, 0x04),
		PANEL_DCS(0xBE, 0x20),
		PANEL_DCS(0xBF, 0xFC, 0x84),
		PANEL_DCS(0xC0, 0x36, 0x36, 0x22, 0x00, 0x00, 0xA0, 0x61, 0x08,
			0xF5, 0x03),
		PANEL_DCS(0xE9, 0xCC),
		PANEL_DCS(0xC7, 0x80),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xE9, 0xC6),
		PANEL_DCS(0xC8, 0x97),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xC9, 0x00, 0x1E, 0x30, 0xD4, 0x01),
		PANEL_DCS(0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x34),
		PANEL_DCS(0xCC, 0x02, 0x03, 0x44),
		PANEL_DCS(0xE9, 0xC4),
		PANEL_DCS(0xD0, 0x03),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xD1, 0x37, 0x06, 0x00, 0x02, 0x04, 0x0C, 0xFF),
		PANEL_DCS(0xD2, 0x1F, 0x11, 0x1F, 0x11),
		PANEL_DCS(0xD3, 0x06, 0x00, 0x00, 0x00, 0x00, 0x04, 0x08, 0x04,
			0x08, 0x37, 0x37, 0x64, 0x4B, 0x11, 0x11, 0x03, 0x03,
			0x32, 0x10, 0x0E, 0x00, 0x0E, 0x32, 0x10, 0x0A, 0x00,
			0x0A, 0x32, 0x17, 0x98, 0x07, 0x98, 0x00, 0x00),
		PANEL_DCS(0xD5, 0x18, 0x18, 0x18, 0x18, 0x1E, 0x1E, 0x1E, 0x1E,
			0x1F, 0x1F, 0x1F, 0x1F, 0x24, 0x24, 0x24, 0x24, 0x07,
			0x06, 0x07, 0x06, 0x05, 0x04, 0x05, 0x04, 0x03, 0x02,
			0x03, 0x02, 0x01, 0x00, 0x01, 0x00, 0x21, 0x20, 0x21,
			0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),
		PANEL_DCS(0xD8, 0xAF, 0xAA, 0xAA, 0xAA, 0xAA, 0xA0, 0xAF, 0xAA,
			0xAA, 0xAA, 0xAA, 0xA0),
		PANEL_DCS(0xE0, 0x00, 0x05, 0x0D, 0x14, 0x1B, 0x2C, 0x44, 0x49,
			0x51, 0x4C, 0x67, 0x6C, 0x71, 0x80, 0x7D, 0x84, 0x8D,
			0xA0, 0xA0, 0x4F, 0x58, 0x64, 0x73, 0x00, 0x05, 0x0D,
			0x14, 0x1B, 0x2C, 0x44, 0x49, 0x51, 0x4C, 0x67, 0x6C,
			0x71, 0x80, 0x7D, 0x84, 0x8D, 0xA0, 0xA0, 0x4F, 0x58,
			0x64, 0x73),
		PANEL_DCS(0xE7, 0x07, 0x10, 0x10, 0x1A, 0x26, 0x9E, 0x00, 0x53,
			0x9B, 0x14, 0x14),
		PANEL_DCS(0xE1, 0x11, 0x00, 0x00, 0x89, 0x30, 0x80, 0x07, 0x80,
			0x02, 0x58, 0x00, 0x14, 0x02, 0x58, 0x02, 0x58, 0x02, 0x00,
			0x02, 0x2C, 0x00, 0x20, 0x02, 0x02, 0x00, 0x08, 0x00, 0x0C,
			0x05, 0x0E, 0x04, 0x94, 0x18, 0x00, 0x10, 0xF0, 0x03, 0x0C,
			0x20, 0x00, 0x06, 0x0B, 0x0B, 0x33, 0x0E),
		PANEL_DCS(0xBD, 0x01),
		PANEL_DCS(0xD8, 0xFF, 0xFF, 0xFF, 0xFF, 0xFA, 0xA0, 0xFF, 0xFF,
			0xFF, 0xFF, 0xFA, 0xA0),
		PANEL_DCS(0xB1, 0x01, 0xBF, 0x11),
		PANEL_DCS(0xCB, 0x86),
		PANEL_DCS(0xD2, 0x96),
		PANEL_DCS(0xE9, 0xC9),
		PANEL_DCS(0xD3, 0x84),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xE9, 0xD1),
		PANEL_DCS(0xE1, 0xF6, 0x2B, 0x34, 0x2B, 0x74, 0x3B, 0x74, 0x6B,
			0x74),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xE7, 0x02, 0x00, 0x2B, 0x01, 0x7E, 0x0F, 0x7E, 0x10,
			0xA0, 0x00, 0x00),
		PANEL_DCS(0xBD, 0x02),
		PANEL_DCS(0xB4, 0x02, 0x00, 0xBB, 0x11),
		PANEL_DCS(0xD8, 0xFF, 0xAF, 0xFF, 0xFF, 0xFA, 0xA0, 0xFF, 0xAF,
			0xFF, 0xFF, 0xFA, 0xA0),
		PANEL_DCS(0xE7, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0x00, 0x00,
			0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00, 0x20,
			0x65, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			0x01, 0x00),
		PANEL_DCS(0xBD, 0x03),
		PANEL_DCS(0xD8, 0xAA, 0xAF, 0xAA, 0xAA, 0xA0, 0x00, 0xAA, 0xAF,
			0xAA, 0xAA, 0xA0, 0x00, 0xAA, 0xAF, 0xAA, 0xAA, 0xA0,
			0x00, 0xAA, 0xAF, 0xAA, 0xAA, 0xA0, 0x00),
		PANEL_DCS(0xE9, 0xC6),
		PANEL_DCS(0xB4, 0x03, 0xFF, 0xF8),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xE1, 0x00),
		PANEL_DCS(0xBD, 0x00),
		PANEL_DCS(0xE9, 0xC4),
		PANEL_DCS(0xBA, 0x96),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xBD, 0x01),
		PANEL_DCS(0xE9, 0xC5),
		PANEL_DCS(0xBA, 0x4F),
		PANEL_DCS(0xE9, 0x3F),
		PANEL_DCS(0xBD, 0x00),
		PANEL_DCS(0xB9, 0x00, 0x00, 0x00),
		PANEL_DELAY(50),
		PANEL_DCS(0x11),
		PANEL_DELAY(110),
		PANEL_DCS(0x29),
		PANEL_DELAY(25),
		PANEL_END,
	},
};
