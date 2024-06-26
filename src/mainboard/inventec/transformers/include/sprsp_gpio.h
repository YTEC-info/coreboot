/* SPDX-License-Identifier: GPL-2.0-only */

#ifndef CFG_GPIO_H
#define CFG_GPIO_H

#include <gpio.h>

/* Pad configuration was generated automatically using intelp2m utility */
static const struct pad_config gpio_table[] = {
	/* ------- GPIO Community 0 ------- */

	/* ------- GPIO Group GPPC_A ------- */
	_PAD_CFG_STRUCT(GPPC_A0, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_A1, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_A2, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF), 0),
	_PAD_CFG_STRUCT(GPPC_A3, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_A4, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF), 0),
	_PAD_CFG_STRUCT(GPPC_A5, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF), 0),
	_PAD_CFG_STRUCT(GPPC_A6, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_A7, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_A8, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_A9, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_A10, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_A11, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	PAD_CFG_GPO(GPPC_A12, 1, RSMRST),
	PAD_NC(GPPC_A13, NONE),
	PAD_NC(GPPC_A14, NONE),
	PAD_CFG_GPO(GPPC_A15, 0, RSMRST),
	_PAD_CFG_STRUCT(GPPC_A16, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF), 0),
	PAD_NC(GPPC_A17, NONE),
	PAD_CFG_GPO(GPPC_A18, 1, RSMRST),
	/* GPPC_A19 - RESERVED */

	/* ------- GPIO Group GPPC_B ------- */
	_PAD_CFG_STRUCT(GPPC_B0, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_B1, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_B2, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_B3, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_B4, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	PAD_NC(GPPC_B5, NONE),
	_PAD_CFG_STRUCT(GPPC_B6, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_CFG_GPI_TRIG_OWN(GPPC_B7, NONE, RSMRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPPC_B8, NONE, RSMRST, OFF, ACPI),
	_PAD_CFG_STRUCT(GPPC_B9, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_CFG_GPI_TRIG_OWN(GPPC_B10, NONE, RSMRST, OFF, ACPI),
	/* GPPC_B11 - n/a */
	PAD_NC(GPPC_B12, NONE),
	PAD_CFG_GPI_TRIG_OWN(GPPC_B13, NONE, RSMRST, OFF, ACPI),
	PAD_NC(GPPC_B14, NONE),
	PAD_NC(GPPC_B15, NONE),
	PAD_NC(GPPC_B16, NONE),
	PAD_NC(GPPC_B17, NONE),
	PAD_NC(GPPC_B18, NONE),
	PAD_NC(GPPC_B19, NONE),
	PAD_NC(GPPC_B20, NONE),
	PAD_NC(GPPC_B21, NONE),
	PAD_NC(GPPC_B22, NONE),
	_PAD_CFG_STRUCT(GPPC_B23, PAD_FUNC(NF4) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),

	/* ------- GPIO Group GPPC_S ------- */
	PAD_NC(GPPC_S0, NONE),
	_PAD_CFG_STRUCT(GPPC_S1, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_NC(GPPC_S2, NONE),
	PAD_CFG_GPO(GPPC_S3, 1, RSMRST),
	PAD_CFG_GPI_TRIG_OWN(GPPC_S4, NONE, RSMRST, OFF, ACPI),
	_PAD_CFG_STRUCT(GPPC_S5, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_NC(GPPC_S6, NONE),
	_PAD_CFG_STRUCT(GPPC_S7, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_S8, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_S9, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPPC_S10, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_CFG_GPI_TRIG_OWN(GPPC_S11, NONE, RSMRST, OFF, ACPI),

	/* ------- GPIO Community 1 ------- */

	/* ------- GPIO Group GPPC_C ------- */
	/* GPPC_C0 - RESERVED */
	/* GPPC_C1 - RESERVED */
	_PAD_CFG_STRUCT(GPPC_C2, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE) | (1 << 1), 0),
	/* GPPC_C3 - RESERVED */
	/* GPPC_C4 - RESERVED */
	PAD_CFG_GPO(GPPC_C5, 0, DEEP),
	/* GPPC_C6 - RESERVED */
	/* GPPC_C7 - RESERVED */
	/* GPPC_C8 - RESERVED */
	/* GPPC_C9 - RESERVED */
	/* GPPC_C10 - RESERVED */
	/* GPPC_C11 - RESERVED */
	/* GPPC_C12 - RESERVED */
	/* GPPC_C13 - RESERVED */
	/* GPPC_C14 - RESERVED */
	/* GPPC_C15 - RESERVED */
	/* GPPC_C16 - RESERVED */
	PAD_CFG_GPO(GPPC_C17, 1, DEEP),
	PAD_CFG_GPO(GPPC_C18, 0, RSMRST),
	_PAD_CFG_STRUCT(GPPC_C19, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_C20, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | (1 << 1), 0),
	PAD_CFG_GPO(GPPC_C21, 0, DEEP),

	/* ------- GPIO Group GPP_D ------- */
	_PAD_CFG_STRUCT(GPP_D0, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_D1, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | (1 << 1), 0),
	PAD_CFG_GPO(GPP_D2, 0, DEEP),
	PAD_NC(GPP_D3, UP_20K),
	PAD_NC(GPP_D4, UP_20K),
	PAD_NC(GPP_D5, UP_20K),
	PAD_CFG_GPI_TRIG_OWN(GPP_D6, NONE, RSMRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_D7, NONE, RSMRST, OFF, ACPI),
	_PAD_CFG_STRUCT(GPP_D8, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	PAD_NC(GPP_D9, UP_20K),
	PAD_NC(GPP_D10, NONE),
	_PAD_CFG_STRUCT(GPP_D11, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_D12, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	/* GPP_D13 - RESERVED */
	_PAD_CFG_STRUCT(GPP_D14, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_NC(GPP_D15, NONE),
	_PAD_CFG_STRUCT(GPP_D16, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_D17, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_D18, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_D19, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_D20, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), PAD_PULL(UP_20K)),
	_PAD_CFG_STRUCT(GPP_D21, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_D22, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE) | (1 << 1), 0),
	PAD_CFG_GPI_TRIG_OWN(GPP_D23, NONE, RSMRST, OFF, ACPI),

	/* ------- GPIO Community 3 ------- */

	/* ------- GPIO Group GPP_E ------- */
	PAD_CFG_GPO(GPP_E0, 0, RSMRST),
	PAD_CFG_GPO(GPP_E1, 1, RSMRST),
	PAD_CFG_GPO(GPP_E2, 1, RSMRST),
	PAD_CFG_GPO(GPP_E3, 1, RSMRST),
	_PAD_CFG_STRUCT(GPP_E4, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_E5, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_E6, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_E7, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_E8, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_E9, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_E10, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_E11, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_E12, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_E13, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	PAD_CFG_GPO(GPP_E14, 0, RSMRST),
	PAD_NC(GPP_E15, NONE),
	PAD_NC(GPP_E16, NONE),
	_PAD_CFG_STRUCT(GPP_E17, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_E18, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_E19, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	/* ------- GPIO Group JTAG ------- */

	/* ------- GPIO Community 4 ------- */

	/* ------- GPIO Group GPPC_H ------- */
	_PAD_CFG_STRUCT(GPPC_H0, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	/* GPPC_H1 - RESERVED */
	PAD_NC(GPPC_H2, UP_20K),
	PAD_NC(GPPC_H3, UP_20K),
	PAD_NC(GPPC_H4, UP_20K),
	PAD_NC(GPPC_H5, UP_20K),
	_PAD_CFG_STRUCT(GPPC_H6, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_H7, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_NC(GPPC_H8, UP_20K),
	PAD_NC(GPPC_H9, NONE),
	PAD_NC(GPPC_H10, NONE),
	PAD_NC(GPPC_H11, NONE),
	PAD_NC(GPPC_H12, UP_20K),
	PAD_NC(GPPC_H13, UP_20K),
	PAD_NC(GPPC_H14, UP_20K),
	_PAD_CFG_STRUCT(GPPC_H15, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_H16, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPPC_H17, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_NC(GPPC_H18, NONE),
	_PAD_CFG_STRUCT(GPPC_H19, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),

	/* ------- GPIO Group GPP_J ------- */
	_PAD_CFG_STRUCT(GPP_J0, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_J1, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE) | (1 << 1), PAD_PULL(UP_1K)),
	_PAD_CFG_STRUCT(GPP_J2, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_J3, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_J4, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_J5, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_J6, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE) | (1 << 1), PAD_PULL(UP_1K)),
	_PAD_CFG_STRUCT(GPP_J7, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE) | (1 << 1), PAD_PULL(UP_1K)),
	_PAD_CFG_STRUCT(GPP_J8, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), 0),
	PAD_NC(GPP_J9, DN_20K),
	PAD_NC(GPP_J10, DN_20K),
	PAD_NC(GPP_J11, DN_20K),
	PAD_NC(GPP_J12, UP_1K),
	PAD_NC(GPP_J13, UP_1K),
	PAD_NC(GPP_J14, UP_1K),
	PAD_NC(GPP_J15, UP_1K),

	/* ------- GPIO Community 5 ------- */

	/* ------- GPIO Group GPP_I ------- */
	PAD_NC(GPP_I0, UP_20K),
	PAD_NC(GPP_I1, UP_20K),
	PAD_NC(GPP_I2, UP_20K),
	PAD_NC(GPP_I3, UP_20K),
	PAD_NC(GPP_I4, UP_20K),
	PAD_NC(GPP_I5, UP_20K),
	PAD_NC(GPP_I6, UP_20K),
	PAD_NC(GPP_I7, UP_20K),
	PAD_NC(GPP_I8, UP_20K),
	PAD_CFG_TERM_GPO(GPP_I9, 0, UP_20K, DEEP),
	PAD_NC(GPP_I10, UP_20K),
	PAD_CFG_TERM_GPO(GPP_I11, 0, UP_20K, DEEP),
	_PAD_CFG_STRUCT(GPP_I12, PAD_FUNC(NF2) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_I13, PAD_FUNC(NF2) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_I14, PAD_FUNC(NF2) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_I15, PAD_FUNC(NF2) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	_PAD_CFG_STRUCT(GPP_I16, PAD_FUNC(NF2) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	_PAD_CFG_STRUCT(GPP_I17, PAD_FUNC(NF2) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE), 0),
	PAD_CFG_TERM_GPO(GPP_I18, 0, UP_20K, DEEP),
	PAD_CFG_TERM_GPO(GPP_I19, 0, UP_20K, DEEP),
	PAD_CFG_TERM_GPO(GPP_I20, 0, UP_20K, DEEP),
	PAD_CFG_TERM_GPO(GPP_I21, 0, UP_20K, DEEP),
	_PAD_CFG_STRUCT(GPP_I22, PAD_FUNC(GPIO) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_CFG_GPI_TRIG_OWN(GPP_I23, NONE, RSMRST, OFF, ACPI),

	/* ------- GPIO Group GPP_L ------- */
	_PAD_CFG_STRUCT(GPP_L0, PAD_FUNC(NF1) | PAD_RESET(RSMRST) | PAD_TRIG(OFF) | PAD_BUF(RX_DISABLE), 0),
	/* GPP_L1 - RESERVED */
	_PAD_CFG_STRUCT(GPP_L2, PAD_FUNC(NF1) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_RX_DISABLE), 0),
	PAD_NC(GPP_L3, NONE),
	PAD_NC(GPP_L4, NONE),
	_PAD_CFG_STRUCT(GPP_L5, PAD_FUNC(GPIO) | PAD_RESET(DEEP) | PAD_TRIG(OFF) | PAD_BUF(TX_DISABLE) | (1 << 1), 0),
	PAD_CFG_GPI_TRIG_OWN(GPP_L6, NONE, PLTRST, OFF, DRIVER),
	PAD_NC(GPP_L7, NONE),
	PAD_NC(GPP_L8, NONE),

	/* ------- GPIO Group GPP_M ------- */
	PAD_CFG_GPI_TRIG_OWN(GPP_M0, NONE, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M1, NONE, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M2, NONE, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M3, NONE, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M4, DN_20K, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M5, NONE, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M6, NONE, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M7, NONE, PLTRST, OFF, ACPI),
	PAD_CFG_GPI_TRIG_OWN(GPP_M8, NONE, PLTRST, OFF, ACPI),
	PAD_NC(GPP_M9, DN_20K),
	PAD_NC(GPP_M10, DN_20K),
	PAD_CFG_GPI_TRIG_OWN(GPP_M11, NONE, RSMRST, OFF, ACPI),
	PAD_CFG_TERM_GPO(GPP_M12, 0, DN_20K, DEEP),
	PAD_NC(GPP_M13, DN_20K),
	PAD_NC(GPP_M14, DN_20K),
	PAD_NC(GPP_M15, UP_20K),
	PAD_NC(GPP_M16, UP_20K),
	PAD_NC(GPP_M17, UP_20K),

	/* ------- GPIO Group GPP_N ------- */
	PAD_NC(GPP_N0, NONE),
	PAD_NC(GPP_N1, DN_20K),
	PAD_NC(GPP_N2, NONE),
	PAD_NC(GPP_N3, NONE),
	PAD_NC(GPP_N4, NONE),
};

#endif /* CFG_GPIO_H */
