/* SPDX-License-Identifier: GPL-2.0-only */

#include <bootblock_common.h>
#include <soc/gpio.h>
#include <superio/ite/it8613e/it8613e.h>
#include <superio/ite/common/ite.h>
#include "include/gpio.h"

#define GPIO_DEV PNP_DEV(0x2e, IT8613E_GPIO)
//#define UART_DEV PNP_DEV(0x2e, IT8613E_SP1)
#define SERIAL1_DEV PNP_DEV(0x2e, IT8613E_SP1)
//#define GPIO_DEV PNP_DEV(0x2e, IT8613E_GPIO)

 void bootblock_mainboard_early_init(void)
 {
	//ite_conf_clkin(GPIO_DEV, ITE_UART_CLK_PREDIVIDE_24);
	//ite_enable_3vsbsw(GPIO_DEV);
	//ite_kill_watchdog(GPIO_DEV);
	//ite_enable_serial(UART_DEV, CONFIG_TTYS0_BASE);
	

	ite_reg_write(GPIO_DEV, 0x2c, 0x41); /* disable K8 power seq */
	ite_reg_write(GPIO_DEV, 0x2d, 0x02); /* PCICLK 25MHz */
	ite_enable_serial(SERIAL1_DEV, CONFIG_TTYS0_BASE);
 }

void bootblock_mainboard_early_init(void)
{
	early_config_superio();
	program_early_gpio_pads();
}
