//////////////////////////////////////////////////////////////////////
////                                                              ////
//// orpsoc-defines                                               ////
////                                                              ////
//// Top level ORPSoC defines file                                ////
////                                                              ////
//// Included in toplevel and testbench                           ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009, 2010 Authors and OPENCORES.ORG           ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//
// Uncomment a `define BOARD_XYZ to configure design RTL for it.
//
// Mainly presets are for internal frequency settings, and what
// external oscillator is expected (ordb1's were made with various
// XTALs.)
//
//////////////////////////////////////////////////////////////////////

// ORSoC Dev board: XTAL: 64MHz, WB: 24MHz
//`define BOARD_ORSOC_DEV_XTAL64_WB24

// ORSoC Dev board: XTAL: 64MHz, WB: 20MHz
`define BOARD_ORSOC_DEV_XTAL64_WB20

// ORSoC Dev board: XTAL: 64MHz, WB: 18MHz
//`define BOARD_ORSOC_DEV_XTAL64_WB18

// ORSoC Dev board: XTAL: 64MHz, WB: 16MHz
//`define BOARD_ORSOC_DEV_XTAL64_WB16

// ORSoC Dev board: XTAL: 25MHz, WB: 24MHz
//`define BOARD_ORSOC_DEV_XTAL25_WB24

// ORSoC Dev board: XTAL: 25MHz, WB: 20MHz
//`define BOARD_ORSOC_DEV_XTAL25_WB20

// Actel simulation:
// Clock periods are used in  simulation only! 
// We generate our own because Actel's PLL model is buggy.
// CLKA is SDRAM clock
// CLKB is Wishbone clock
// CLKC is USB clock

`ifdef BOARD_ORSOC_DEV_XTAL64_WB24
 `define ACTEL
 `define ACTEL_PLL
 `define PLL_XTAL64_WB24
 `define FPGA_BOARD_ORSOC_DEV
 `define IOCONFIG_ORSOC_IO_BOARD
 `define ETH_CLK
 `define ETH_CLK_PLL
 `define ACTEL_PLL_CLKA_PERIOD 15.625     // 64 MHz
 `define ACTEL_PLL_CLKB_PERIOD 41.666667  // 24 MHz
 `define ACTEL_PLL_CLKC_PERIOD 20.83334   // 48 MHz
 `define BOARD_CLOCK_PERIOD 15.625     // 64 MHz
// Modules in system (or `define CUSTOM_CONFIG and define below)
 `define CUSTOM_MODULES_CONFIG
`endif //  `ifdef BOARD_ORSOC_DEV_XTAL64_WB24

`ifdef BOARD_ORSOC_DEV_XTAL64_WB20
 `define ACTEL
 `define ACTEL_PLL
 `define PLL_XTAL64_WB20
 `define FPGA_BOARD_ORSOC_DEV
 `define IOCONFIG_ORSOC_IO_BOARD
 `define ETH_CLK
 `define ETH_CLK_PLL
 `define ACTEL_PLL_CLKA_PERIOD 15.625    // 64 MHz
 `define ACTEL_PLL_CLKB_PERIOD 50        // 20 MHz
 `define ACTEL_PLL_CLKC_PERIOD 20.83334  // 48 MHz
 `define BOARD_CLOCK_PERIOD 15.625    // 64 MHz
// Modules in system (or `define CUSTOM_CONFIG and define below)
 `define CUSTOM_MODULES_CONFIG
`endif

`ifdef BOARD_ORSOC_DEV_XTAL64_WB18
 `define ACTEL
 `define ACTEL_PLL
 `define PLL_XTAL64_WB18
 `define FPGA_BOARD_ORSOC_DEV
 `define IOCONFIG_ORSOC_IO_BOARD
 `define ETH_CLK
 `define ETH_CLK_PLL
 `define ACTEL_PLL_CLKA_PERIOD 15.625    // 64 MHz
 `define ACTEL_PLL_CLKB_PERIOD 55.55556  // 18 MHz
 `define ACTEL_PLL_CLKC_PERIOD 20.83334  // 48 MHz
 `define BOARD_CLOCK_PERIOD 15.625    // 64 MHz
// Modules in system (or `define CUSTOM_CONFIG and define below)
 `define CUSTOM_MODULES_CONFIG
`endif

`ifdef BOARD_ORSOC_DEV_XTAL64_WB16
 `define ACTEL
 `define ACTEL_PLL
 `define PLL_XTAL64_WB16
 `define FPGA_BOARD_ORSOC_DEV
 `define IOCONFIG_ORSOC_IO_BOARD
 `define ETH_CLK
 `define ETH_CLK_PLL
 `define ACTEL_PLL_CLKA_PERIOD 15.625    // 64 MHz
 `define ACTEL_PLL_CLKB_PERIOD 62.5      // 16 MHz
 `define ACTEL_PLL_CLKC_PERIOD 20.83334  // 48 MHz
 `define BOARD_CLOCK_PERIOD 15.625    // 64 MHz
// Modules in system (or `define CUSTOM_CONFIG and define below)
 `define CUSTOM_MODULES_CONFIG
`endif

`ifdef BOARD_ORSOC_DEV_XTAL25_WB24
 `define ACTEL
 `define ACTEL_PLL
 `define PLL_XTAL25_WB24
 `define FPGA_BOARD_ORSOC_DEV
 `define IOCONFIG_ORSOC_IO_BOARD
 `define ETH_CLK
 `define ACTEL_PLL_CLKA_PERIOD 40        // 25 MHz
 `define ACTEL_PLL_CLKB_PERIOD 41.666667 // 24 MHz
 `define ACTEL_PLL_CLKC_PERIOD 20.83334  // 48 MHz
 `define BOARD_CLOCK_PERIOD 40        // 25 MHz
// Modules in system (or `define CUSTOM_CONFIG and define below)
 `define CUSTOM_MODULES_CONFIG
`endif //  `ifdef BOARD_ORSOC_DEV_XTAL25_WB24

`ifdef BOARD_ORSOC_DEV_XTAL25_WB20
 `define ACTEL
 `define ACTEL_PLL
 `define PLL_XTAL25_WB20
 `define FPGA_BOARD_ORSOC_DEV
 `define IOCONFIG_ORSOC_IO_BOARD
 `define ETH_CLK
 `define ACTEL_PLL_CLKA_PERIOD 40        // 25 MHz
 `define ACTEL_PLL_CLKB_PERIOD 50        // 20 MHz
 `define ACTEL_PLL_CLKC_PERIOD 20.83334  // 48 MHz
 `define BOARD_CLOCK_PERIOD 40        // 25 MHz
// Modules in system (or `define CUSTOM_CONFIG and define below)
// `define CUSTOM_MODULES_CONFIG
// Included modules: define to include
 `define JTAG_DEBUG
 `define VERSATILE_SDRAM
 `define UART0
 `define SPI0
 `define I2C0
 `define GPIO0
 `define ETH0
 `define SMII0
`endif

`ifdef CUSTOM_MODULES_CONFIG
// Included modules: define to include
 `define JTAG_DEBUG
 `define VERSATILE_SDRAM
//`define RAM_WB
//`define ACTEL_UFR
 `define UART0
 `define SPI0
// `define SPI1
// `define SPI2
// `define I2C0
// `define I2C1
// `define I2C2
// `define I2C3
 `define USB0
// `define USB1
//`define GPIO0
`define ETH0
`define SMII0
`define SDC_CONTROLLER

`endif //  `ifdef CUSTOM_MODULES_CONFIG


// end of included module defines - keep this comment line here, scripts depend on it!!

`ifdef SPI0
 `define SPI0_SLAVE_SELECTS
`endif


`ifdef SPI1
 `define SPI1_SLAVE_SELECTS
`endif

`ifdef SPI2
 `define SPI2_SLAVE_SELECTS
`endif

`ifdef USB0
// Indicate we need clock for USB
`define USB_CLK
// uncomment this for the module to be only a host controller
 `define USB0_ONLY_HOST
`endif


`ifdef USB1
// If we haven't already, indicate we need clock for USB
 `ifndef USB_CLK
  `define USB_CLK
 `endif

// If both are commented out, USB1 is a host and slave otherwise uncomment
// only one of the following to instantiate the desired type:
// `define USB1_ONLY_HOST
 `define USB1_ONLY_SLAVE
`endif


`ifdef ETH0
// Define ETH0_PHY_RST here or where ETH0 is defined to enable an active-low
// reset output to the PHY if it's possible.
// `define ETH0_PHY_RST
`endif

`ifdef ETH_CLK
// Ethernet clock rate, for simulation
 `define ETHERNET_CLOCK_PERIOD 8.00 // 125 MHz
`endif

//
// Arbiter defines
//

// Uncomment to register things through arbiter (hopefully quicker design)
// Instruction bus arbiter
//`define ARBITER_IBUS_REGISTERING
`define ARBITER_IBUS_WATCHDOG
// Watchdog timeout: 2^(ARBITER_IBUS_WATCHDOG_TIMER_WIDTH+1) cycles
`define ARBITER_IBUS_WATCHDOG_TIMER_WIDTH 12

// Data bus arbiter

//`define ARBITER_DBUS_REGISTERING
`define ARBITER_DBUS_WATCHDOG
// Watchdog timeout: 2^(ARBITER_DBUS_WATCHDOG_TIMER_WIDTH+1) cycles
`define ARBITER_DBUS_WATCHDOG_TIMER_WIDTH 12

// Byte bus (peripheral bus) arbiter
// Don't really need the watchdog here - the databus will pick it up
//`define ARBITER_BYTEBUS_WATCHDOG
// Watchdog timeout: 2^(ARBITER_BYTEBUS_WATCHDOG_TIMER_WIDTH+1) cycles
`define ARBITER_BYTEBUS_WATCHDOG_TIMER_WIDTH 9

