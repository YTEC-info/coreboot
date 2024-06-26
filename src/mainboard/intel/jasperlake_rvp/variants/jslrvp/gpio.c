/* SPDX-License-Identifier: GPL-2.0-only */

#include <baseboard/gpio.h>
#include <baseboard/variants.h>
#include <types.h>
#include <vendorcode/google/chromeos/chromeos.h>

/* Pad configuration in ramstage */
static const struct pad_config gpio_table[] = {
	/* WWAN_WAKE_N */
	PAD_CFG_GPI_SCI(GPP_A10, NONE, DEEP, LEVEL, INVERT),

	/* DDI1_HPD */
	PAD_CFG_NF(GPP_A16, NONE, DEEP, NF1),

	/* DDI0_HPD */
	PAD_CFG_NF(GPP_A17, NONE, DEEP, NF1),

	/* M.2_WWAN_DISABLE_N */
	PAD_CFG_GPO(GPP_A19, 1, PLTRST),

	/* PMC_CORE_VID0 */
	PAD_CFG_NF(GPP_B0, NONE, DEEP, NF1),

	/* PMC_CORE_VID1 */
	PAD_CFG_NF(GPP_B1, NONE, DEEP, NF1),

	/* PMC_SLP_S0_N */
	PAD_CFG_NF(GPP_B12, NONE, DEEP, NF1),

	/* PMC_PLT_RST_N */
	PAD_CFG_NF(GPP_B13, NONE, DEEP, NF1),

	/* CAM1_RST_N */
	PAD_CFG_GPO(GPP_B14, 0, PLTRST),

	/* M.2_WLAN_PERST_N */
	PAD_CFG_GPO(GPP_B17, 1, PLTRST),

	/* GSPI1_CS0_N */
	PAD_CFG_NF(GPP_B19, NONE, DEEP, NF1),

	/* GSPI1_CLK */
	PAD_CFG_NF(GPP_B20, NONE, DEEP, NF1),

	/* GSPI1_MISO */
	PAD_CFG_NF(GPP_B21, NONE, DEEP, NF1),

	/* GSPI1_MOSI */
	PAD_CFG_NF(GPP_B22, NONE, DEEP, NF1),

	/* DDI2_HPD */
	PAD_CFG_NF(GPP_B23, NONE, DEEP, NF1),

	/* WWAN_PERST_N */
	PAD_CFG_GPO(GPP_C0, 0, PLTRST),

	/* M2_WWAN_SSD_SKT2_CFG2 */
	PAD_CFG_GPI(GPP_C3, NONE, PLTRST),

	/* SLP_LAN_N */
	PAD_CFG_GPO(GPP_C7, 0, PLTRST),

	/* I2C0_SDA */
	PAD_CFG_NF(GPP_C16, UP_2K, DEEP, NF1),

	/* I2C0_SCL */
	PAD_CFG_NF(GPP_C17, UP_2K, DEEP, NF1),

	/* CAM2_RST_N */
	PAD_CFG_GPO(GPP_C19, 0, PLTRST),

	/* WIFI_RF_KILL_N */
	PAD_CFG_GPO(GPP_D0, 1, PLTRST),

	/* BT_RF_KILL_N */
	PAD_CFG_GPO(GPP_D1, 1, PLTRST),

	/* CAM2_PWREN */
	PAD_CFG_GPO(GPP_D4, 0, PLTRST),

	/* CAM1_PWREN */
	PAD_CFG_GPO(GPP_D5, 0, PLTRST),

	/*LAN_RST_N*/
	PAD_CFG_GPO(GPP_D6, 1, PLTRST),

	/* I2C4B_SDA */
	PAD_CFG_NF(GPP_D12, NONE, DEEP, NF3),

	/* I2C4B_SCL */
	PAD_CFG_NF(GPP_D13, NONE, DEEP, NF3),

	/* AVS_I2S_MCLK */
	PAD_CFG_NF(GPP_D18, NONE, DEEP, NF1),

	/* CNV_MFUART2_RXD */
	PAD_CFG_NF(GPP_D19, NONE, DEEP, NF1),

	/* CNV_MFUART2_TXD */
	PAD_CFG_NF(GPP_D20, NONE, DEEP, NF1),

	/* CNV_PA_BLANKING */
	PAD_CFG_NF(GPP_D21, NONE, DEEP, NF1),

	/* I2C5_SDA */
	PAD_CFG_NF(GPP_D22, NONE, PLTRST, NF1),

	/* I2C5_SCL */
	PAD_CFG_NF(GPP_D23, NONE, PLTRST, NF1),

	/* IMGCLKOUT_0 */
	PAD_CFG_NF(GPP_E0, NONE, DEEP, NF2),

	/* IMGCLKOUT_1 */
	PAD_CFG_NF(GPP_E2, NONE, PLTRST, NF1),

	/* WWAN_FCP_OFF_N */
	PAD_CFG_GPO(GPP_E3, 1, PLTRST),

	/* DDI0_DDC_SCL */
	PAD_CFG_NF(GPP_E13, NONE, DEEP, NF1),

	/* DDI0_DDC_SDA */
	PAD_CFG_NF(GPP_E14, NONE, DEEP, NF1),

	/* DDI1_DDC_SCL */
	PAD_CFG_NF(GPP_E15, NONE, DEEP, NF1),

	/* DDI1_DDC_SDA */
	PAD_CFG_NF(GPP_E16, NONE, DEEP, NF1),

	/* DDI2_DDC_SCL */
	PAD_CFG_NF(GPP_E17, NONE, DEEP, NF1),

	/* DDI2_DDC_SDA */
	PAD_CFG_NF(GPP_E18, NONE, DEEP, NF1),

	/* CNV_BRI_DT */
	PAD_CFG_NF(GPP_E20, NONE, DEEP, NF1),

	/* CNV_BRI_RSP */
	PAD_CFG_NF(GPP_E21, NONE, DEEP, NF1),

	/* CNV_RGI_DT */
	PAD_CFG_NF(GPP_E22, NONE, DEEP, NF1),

	/* CNV_RGI_RSP */
	PAD_CFG_NF(GPP_E23, NONE, DEEP, NF1),

	/* CNV_RF_RESET_B */
	PAD_CFG_NF(GPP_F4, NONE, DEEP, NF1),

	/* EMMC_CMD */
	PAD_CFG_NF(GPP_F7, NONE, DEEP, NF1),

	/* EMMC_DATA0 */
	PAD_CFG_NF(GPP_F8, NONE, DEEP, NF1),

	/* EMMC_DATA1 */
	PAD_CFG_NF(GPP_F9, NONE, DEEP, NF1),

	/* EMMC_DATA2 */
	PAD_CFG_NF(GPP_F10, NONE, DEEP, NF1),

	/* EMMC_DATA3 */
	PAD_CFG_NF(GPP_F11, NONE, DEEP, NF1),

	/* EMMC_DATA4 */
	PAD_CFG_NF(GPP_F12, NONE, DEEP, NF1),

	/* EMMC_DATA5 */
	PAD_CFG_NF(GPP_F13, NONE, DEEP, NF1),

	/* EMMC_DATA6 */
	PAD_CFG_NF(GPP_F14, NONE, DEEP, NF1),

	/* EMMC_DATA7 */
	PAD_CFG_NF(GPP_F15, NONE, DEEP, NF1),

	/* EMMC_RCLK */
	PAD_CFG_NF(GPP_F16, NONE, DEEP, NF1),

	/* EMMC_CLK */
	PAD_CFG_NF(GPP_F17, NONE, DEEP, NF1),

	/* EMMC_RESET_N */
	PAD_CFG_NF(GPP_F18, NONE, DEEP, NF1),

	/* SD_SDIO_CMD */
	PAD_CFG_NF(GPP_G0, NONE, DEEP, NF1),

	/* SD_SDIO_D0 */
	PAD_CFG_NF(GPP_G1, NONE, DEEP, NF1),

	/* SD_SDIO_D1 */
	PAD_CFG_NF(GPP_G2, NONE, DEEP, NF1),

	/* SD_SDIO_D2 */
	PAD_CFG_NF(GPP_G3, NONE, DEEP, NF1),

	/* SD_SDIO_D3 */
	PAD_CFG_NF(GPP_G4, NONE, DEEP, NF1),

	/* SD_SDIO_CD_N */
	PAD_CFG_NF(GPP_G5, UP_20K, PWROK, NF1),

	/* SD_SDIO_CLK */
	PAD_CFG_NF(GPP_G6, NONE, DEEP, NF1),

	/* SD_SDIO_WP */
	PAD_CFG_NF(GPP_G7, DN_20K, PWROK, NF1),

	/* FPS_INT */
	PAD_CFG_GPI_APIC(GPP_H0, NONE, PLTRST, LEVEL, INVERT),

	/* SD_SDIO_PWR_EN_N */
	PAD_CFG_NF(GPP_H1, NONE, DEEP, NF1),

	/* MODEM_CLKREQ0 */
	PAD_CFG_NF(GPP_H2, NONE, DEEP, NF3),

	/* WWAN EN GPIO */
	PAD_CFG_GPO(GPP_H7, 1, PLTRST),

	/* CPU_C10_GATE_N */
	PAD_CFG_NF(GPP_H10, NONE, DEEP, NF1),

	/* M.2_BT_I2S2_SCLK */
	PAD_CFG_GPI(GPP_H11, NONE, PLTRST),

	/* CNV_RF_RESET_N */
	PAD_CFG_NF(GPP_H12, NONE, DEEP, NF2),

	/* PCH_INT_ODL */
	PAD_CFG_GPI_APIC(GPP_H13, NONE, DEEP, EDGE_SINGLE, INVERT),

	/* M.2_BT_I2S2_RXD */
	PAD_CFG_GPI(GPP_H14, NONE, PLTRST),

	/* AVS_I2S1_SCLK */
	PAD_CFG_NF(GPP_H15, NONE, DEEP, NF1),

	/* Audio Jack Detection */
	PAD_CFG_GPI_INT(GPP_H16, NONE, PLTRST, EDGE_BOTH),

	/* M2_CNVI_EN_N */
	PAD_CFG_GPO(GPP_H19, 0, PLTRST),

	/* AVS_I2S0_SCLK */
	PAD_CFG_NF(GPP_R0, NONE, DEEP, NF2),

	/* AVS_I2S0_SFRM */
	PAD_CFG_NF(GPP_R1, NONE, DEEP, NF2),

	/* AVS_I2S0_TXD */
	PAD_CFG_NF(GPP_R2, NONE, DEEP, NF2),

	/* AVS_I2S0_RXD */
	PAD_CFG_NF(GPP_R3, NONE, DEEP, NF2),

	/* AVS_I2S1_RXD */
	PAD_CFG_NF(GPP_R5, NONE, DEEP, NF2),

	/* AVS_I2S1_SFRM */
	PAD_CFG_NF(GPP_R6, NONE, DEEP, NF1),

	/* AVS_I2S1_TXD */
	PAD_CFG_NF(GPP_R7, NONE, DEEP, NF1),

	/* WWAN RST_N */
	PAD_CFG_GPO(GPP_S0, 1, DEEP),

	/* DMIC_CLK_1 */
	PAD_CFG_NF(GPP_S2, UP_20K, DEEP, NF2),

	/* DMIC_DATA_1 */
	PAD_CFG_NF(GPP_S3, UP_20K, DEEP, NF2),

	/* DMIC_CLK_0 */
	PAD_CFG_NF(GPP_S6, UP_20K, DEEP, NF2),

	/* DMIC_DATA_0 */
	PAD_CFG_NF(GPP_S7, UP_20K, DEEP, NF2),

	/* PMC_BATLOW_N */
	PAD_CFG_NF(GPD0, NONE, DEEP, NF1),

	/* PMC_ACPRESENT */
	PAD_CFG_NF(GPD1, NONE, DEEP, NF1),

	/* LAN_WAKE_N */
	PAD_CFG_NF(GPD2, NONE, DEEP, NF1),

	/* PMC_PWR_BTN_N */
	PAD_CFG_NF(GPD3, UP_20K, DEEP, NF1),

	/* PMC_SLP_S3_N */
	PAD_CFG_NF(GPD4, NONE, DEEP, NF1),

	/* PMC_SLP_S4_N */
	PAD_CFG_NF(GPD5, NONE, DEEP, NF1),

	/* PMC_SUSCLK */
	PAD_CFG_NF(GPD8, NONE, DEEP, NF1),

	/* virtual GPIO for SD card detect */
	PAD_CFG_GPI_GPIO_DRIVER(VGPIO_39, NONE, DEEP),
};

/* Early pad configuration in bootblock */
static const struct pad_config early_gpio_table[] = {
#if CONFIG(BOARD_INTEL_JASPERLAKE_RVP_EXT_EC)
	/* UART2 RX */
	PAD_CFG_NF(GPP_C20, NONE, DEEP, NF1),

	/* UART2 TX */
	PAD_CFG_NF(GPP_C21, NONE, DEEP, NF1),
#endif

	/* GSPI1_CS# */
	PAD_CFG_NF(GPP_B19, NONE, DEEP, NF1),

	/* GSPI1_CLK */
	PAD_CFG_NF(GPP_B20, NONE, DEEP, NF1),

	/* GSPI1_MISO */
	PAD_CFG_NF(GPP_B21, NONE, DEEP, NF1),

	/* GSPI1_MOSI */
	PAD_CFG_NF(GPP_B22, NONE, DEEP, NF1),

	/* PCH_INT_ODL */
	PAD_CFG_GPI_APIC(GPP_H13, NONE, DEEP, EDGE_SINGLE, INVERT),
};

const struct pad_config *variant_gpio_table(size_t *num)
{
	*num = ARRAY_SIZE(gpio_table);
	return gpio_table;
}

const struct pad_config *variant_early_gpio_table(size_t *num)
{
	*num = ARRAY_SIZE(early_gpio_table);
	return early_gpio_table;
}

static const struct cros_gpio cros_gpios[] = {
	CROS_GPIO_REC_AL(CROS_GPIO_VIRTUAL, CROS_GPIO_COMM0_NAME),
};

DECLARE_CROS_GPIOS(cros_gpios);
