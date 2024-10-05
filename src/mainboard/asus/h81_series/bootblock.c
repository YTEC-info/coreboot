/* SPDX-License-Identifier: GPL-2.0-only */

#include <device/pnp_ops.h>
#include <southbridge/intel/lynxpoint/pch.h>
#include <superio/nuvoton/common/nuvoton.h>
#include <superio/nuvoton/nct6791d/nct6791d.h>

#define GLOBAL_DEV	PNP_DEV(0x2e, 0)
#define SERIAL_DEV	PNP_DEV(0x2e, NCT6791D_SP1)
#define ACPI_DEV	PNP_DEV(0x2e, NCT6791D_ACPI)
#define GPIO_PP_OD_DEV	PNP_DEV(0x2e, NCT6791D_GPIO_PP_OD)

void mainboard_config_superio(void)
{
	nuvoton_pnp_enter_conf_state(GLOBAL_DEV);

	/* Select SIO pin mux states */
	pnp_write_config(GLOBAL_DEV, 0x1b, 0xe6);
	pnp_write_config(GLOBAL_DEV, 0x1c, 0x10);
	pnp_write_config(GLOBAL_DEV, 0x24, 0xfc);
	pnp_write_config(GLOBAL_DEV, 0x2a, 0x40);
	pnp_write_config(GLOBAL_DEV, 0x2b, 0x20);
	pnp_write_config(GLOBAL_DEV, 0x2c, 0x00);
	pnp_write_config(GLOBAL_DEV, 0x2d, 0x02);

	/* Select push-pull vs. open-drain output */
	pnp_set_logical_device(GPIO_PP_OD_DEV);
	pnp_write_config(GPIO_PP_OD_DEV, 0xe0, 0xfe);
	pnp_write_config(GPIO_PP_OD_DEV, 0xe2, 0x79);
	pnp_write_config(GPIO_PP_OD_DEV, 0xe6, 0x6f);

	/* Power RAM in S3 */
	pnp_set_logical_device(ACPI_DEV);
	pnp_write_config(ACPI_DEV, 0xe4, 0x10);

	nuvoton_pnp_exit_conf_state(GLOBAL_DEV);

	nuvoton_enable_serial(SERIAL_DEV, CONFIG_TTYS0_BASE);
}
