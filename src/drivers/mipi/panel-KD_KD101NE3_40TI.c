/* SPDX-License-Identifier: GPL-2.0-only */

#include <mipi/panel.h>

struct panel_serializable_data KD_KD101NE3_40TI = {
	.edid = {
		.ascii_string = "KD101NE3-40TI",
		.manufacturer_name = "KD",
		.panel_bits_per_color = 8,
		.panel_bits_per_pixel = 24,
		.mode = {
			.pixel_clock = 70595,
			.lvds_dual_channel = 0,
			.refresh = 60,
			.ha = 800, .hbl = 90, .hso = 30, .hspw = 30,
			.va = 1280, .vbl = 42, .vso = 30, .vspw = 4,
			.phsync = '-', .pvsync = '-',
			.x_mm = 135, .y_mm = 216,
		},
	},
	.init = {
		PANEL_DELAY(24),
		PANEL_DCS(0xE0, 0x00),
		PANEL_DCS(0xE1, 0x93),
		PANEL_DCS(0xE2, 0x65),
		PANEL_DCS(0xE3, 0xF8),
		PANEL_DCS(0x80, 0x03),
		PANEL_DCS(0xE0, 0x01),
		PANEL_DCS(0x0C, 0x74),
		PANEL_DCS(0x17, 0x00),
		PANEL_DCS(0x18, 0xC7),
		PANEL_DCS(0x19, 0x01),
		PANEL_DCS(0x1A, 0x00),
		PANEL_DCS(0x1B, 0xC7),
		PANEL_DCS(0x1C, 0x01),
		PANEL_DCS(0x24, 0xFE),
		PANEL_DCS(0x37, 0x19),
		PANEL_DCS(0x35, 0x28),
		PANEL_DCS(0x38, 0x05),
		PANEL_DCS(0x39, 0x08),
		PANEL_DCS(0x3A, 0x12),
		PANEL_DCS(0x3C, 0x7E),
		PANEL_DCS(0x3D, 0xFF),
		PANEL_DCS(0x3E, 0xFF),
		PANEL_DCS(0x3F, 0x7F),
		PANEL_DCS(0x40, 0x06),
		PANEL_DCS(0x41, 0xA0),
		PANEL_DCS(0x43, 0x1E),
		PANEL_DCS(0x44, 0x0B),
		PANEL_DCS(0x55, 0x02),
		PANEL_DCS(0x57, 0x6A),
		PANEL_DCS(0x59, 0x0A),
		PANEL_DCS(0x5A, 0x2E),
		PANEL_DCS(0x5B, 0x1A),
		PANEL_DCS(0x5C, 0x15),
		PANEL_DCS(0x5D, 0x7F),
		PANEL_DCS(0x5E, 0x61),
		PANEL_DCS(0x5F, 0x50),
		PANEL_DCS(0x60, 0x43),
		PANEL_DCS(0x61, 0x3F),
		PANEL_DCS(0x62, 0x32),
		PANEL_DCS(0x63, 0x35),
		PANEL_DCS(0x64, 0x1F),
		PANEL_DCS(0x65, 0x38),
		PANEL_DCS(0x66, 0x36),
		PANEL_DCS(0x67, 0x36),
		PANEL_DCS(0x68, 0x54),
		PANEL_DCS(0x69, 0x42),
		PANEL_DCS(0x6A, 0x48),
		PANEL_DCS(0x6B, 0x39),
		PANEL_DCS(0x6C, 0x34),
		PANEL_DCS(0x6D, 0x26),
		PANEL_DCS(0x6E, 0x14),
		PANEL_DCS(0x6F, 0x02),
		PANEL_DCS(0x70, 0x7F),
		PANEL_DCS(0x71, 0x61),
		PANEL_DCS(0x72, 0x50),
		PANEL_DCS(0x73, 0x43),
		PANEL_DCS(0x74, 0x3F),
		PANEL_DCS(0x75, 0x32),
		PANEL_DCS(0x76, 0x35),
		PANEL_DCS(0x77, 0x1F),
		PANEL_DCS(0x78, 0x38),
		PANEL_DCS(0x79, 0x36),
		PANEL_DCS(0x7A, 0x36),
		PANEL_DCS(0x7B, 0x54),
		PANEL_DCS(0x7C, 0x42),
		PANEL_DCS(0x7D, 0x48),
		PANEL_DCS(0x7E, 0x39),
		PANEL_DCS(0x7F, 0x34),
		PANEL_DCS(0x80, 0x26),
		PANEL_DCS(0x81, 0x14),
		PANEL_DCS(0x82, 0x02),
		PANEL_DCS(0xE0, 0x02),
		PANEL_DCS(0x00, 0x52),
		PANEL_DCS(0x01, 0x5F),
		PANEL_DCS(0x02, 0x5F),
		PANEL_DCS(0x03, 0x50),
		PANEL_DCS(0x04, 0x77),
		PANEL_DCS(0x05, 0x57),
		PANEL_DCS(0x06, 0x5F),
		PANEL_DCS(0x07, 0x4E),
		PANEL_DCS(0x08, 0x4C),
		PANEL_DCS(0x09, 0x5F),
		PANEL_DCS(0x0A, 0x4A),
		PANEL_DCS(0x0B, 0x48),
		PANEL_DCS(0x0C, 0x5F),
		PANEL_DCS(0x0D, 0x46),
		PANEL_DCS(0x0E, 0x44),
		PANEL_DCS(0x0F, 0x40),
		PANEL_DCS(0x10, 0x5F),
		PANEL_DCS(0x11, 0x5F),
		PANEL_DCS(0x12, 0x5F),
		PANEL_DCS(0x13, 0x5F),
		PANEL_DCS(0x14, 0x5F),
		PANEL_DCS(0x15, 0x5F),
		PANEL_DCS(0x16, 0x53),
		PANEL_DCS(0x17, 0x5F),
		PANEL_DCS(0x18, 0x5F),
		PANEL_DCS(0x19, 0x51),
		PANEL_DCS(0x1A, 0x77),
		PANEL_DCS(0x1B, 0x57),
		PANEL_DCS(0x1C, 0x5F),
		PANEL_DCS(0x1D, 0x4F),
		PANEL_DCS(0x1E, 0x4D),
		PANEL_DCS(0x1F, 0x5F),
		PANEL_DCS(0x20, 0x4B),
		PANEL_DCS(0x21, 0x49),
		PANEL_DCS(0x22, 0x5F),
		PANEL_DCS(0x23, 0x47),
		PANEL_DCS(0x24, 0x45),
		PANEL_DCS(0x25, 0x41),
		PANEL_DCS(0x26, 0x5F),
		PANEL_DCS(0x27, 0x5F),
		PANEL_DCS(0x28, 0x5F),
		PANEL_DCS(0x29, 0x5F),
		PANEL_DCS(0x2A, 0x5F),
		PANEL_DCS(0x2B, 0x5F),
		PANEL_DCS(0x2C, 0x13),
		PANEL_DCS(0x2D, 0x1F),
		PANEL_DCS(0x2E, 0x1F),
		PANEL_DCS(0x2F, 0x01),
		PANEL_DCS(0x30, 0x17),
		PANEL_DCS(0x31, 0x17),
		PANEL_DCS(0x32, 0x1F),
		PANEL_DCS(0x33, 0x0D),
		PANEL_DCS(0x34, 0x0F),
		PANEL_DCS(0x35, 0x1F),
		PANEL_DCS(0x36, 0x05),
		PANEL_DCS(0x37, 0x07),
		PANEL_DCS(0x38, 0x1F),
		PANEL_DCS(0x39, 0x09),
		PANEL_DCS(0x3A, 0x0B),
		PANEL_DCS(0x3B, 0x11),
		PANEL_DCS(0x3C, 0x1F),
		PANEL_DCS(0x3D, 0x1F),
		PANEL_DCS(0x3E, 0x1F),
		PANEL_DCS(0x3F, 0x1F),
		PANEL_DCS(0x40, 0x1F),
		PANEL_DCS(0x41, 0x1F),
		PANEL_DCS(0x42, 0x12),
		PANEL_DCS(0x43, 0x1F),
		PANEL_DCS(0x44, 0x1F),
		PANEL_DCS(0x45, 0x00),
		PANEL_DCS(0x46, 0x17),
		PANEL_DCS(0x47, 0x17),
		PANEL_DCS(0x48, 0x1F),
		PANEL_DCS(0x49, 0x0C),
		PANEL_DCS(0x4A, 0x0E),
		PANEL_DCS(0x4B, 0x1F),
		PANEL_DCS(0x4C, 0x04),
		PANEL_DCS(0x4D, 0x06),
		PANEL_DCS(0x4E, 0x1F),
		PANEL_DCS(0x4F, 0x08),
		PANEL_DCS(0x50, 0x0A),
		PANEL_DCS(0x51, 0x10),
		PANEL_DCS(0x52, 0x1F),
		PANEL_DCS(0x53, 0x1F),
		PANEL_DCS(0x54, 0x1F),
		PANEL_DCS(0x55, 0x1F),
		PANEL_DCS(0x56, 0x1F),
		PANEL_DCS(0x57, 0x1F),
		PANEL_DCS(0x58, 0x40),
		PANEL_DCS(0x5B, 0x10),
		PANEL_DCS(0x5C, 0x06),
		PANEL_DCS(0x5D, 0x40),
		PANEL_DCS(0x5E, 0x00),
		PANEL_DCS(0x5F, 0x00),
		PANEL_DCS(0x60, 0x40),
		PANEL_DCS(0x61, 0x03),
		PANEL_DCS(0x62, 0x04),
		PANEL_DCS(0x63, 0x6C),
		PANEL_DCS(0x64, 0x6C),
		PANEL_DCS(0x65, 0x75),
		PANEL_DCS(0x66, 0x08),
		PANEL_DCS(0x67, 0xB4),
		PANEL_DCS(0x68, 0x08),
		PANEL_DCS(0x69, 0x6C),
		PANEL_DCS(0x6A, 0x6C),
		PANEL_DCS(0x6B, 0x0C),
		PANEL_DCS(0x6D, 0x00),
		PANEL_DCS(0x6E, 0x00),
		PANEL_DCS(0x6F, 0x88),
		PANEL_DCS(0x75, 0xBB),
		PANEL_DCS(0x76, 0x00),
		PANEL_DCS(0x77, 0x05),
		PANEL_DCS(0x78, 0x2A),
		PANEL_DCS(0xE0, 0x04),
		PANEL_DCS(0x00, 0x0E),
		PANEL_DCS(0x02, 0xB3),
		PANEL_DCS(0x09, 0x61),
		PANEL_DCS(0x0E, 0x48),
		PANEL_DCS(0xE0, 0x00),
		PANEL_DCS(0x11),
		PANEL_DELAY(120),
		PANEL_DCS(0x29),
		PANEL_DELAY(20),
		PANEL_END,
	},
};
