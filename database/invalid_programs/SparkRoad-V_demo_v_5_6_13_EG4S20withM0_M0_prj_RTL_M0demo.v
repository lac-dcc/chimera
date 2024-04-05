`timescale 1ns/1ps
`include "cmsdk_mcu_defs.v"

module M0demo(
    input  wire          XTAL1, //
    output wire          XTAL2, //
    input  wire          NRST,  //
    output  wire  [15:0]  P0,
    //inout  wire  [15:0]  P1,
    
    input  wire          nTRST,
    input  wire          TDI,
    output wire          TDO,
    inout  wire          SWDIOTMS,
    input  wire          SWCLKTCK,
    
    inout  wire  [7:0]   b_pad_gpio_porta,

    input  wire          uart0_rxd,
    output wire          uart0_txd,
    output wire          uart0_txen


);
    wire XTAL1_wire;

  parameter BE              = 0;   // Big or little endian

  parameter BKPT            = 4;   // Number of breakpoint comparators
  parameter DBG             = 1;   // Debug configuration
  parameter NUMIRQ          = 32;  // NUM of IRQ
  parameter SMUL            = 0;   // Multiplier configuration
  parameter SYST            = 1;   // SysTick
  parameter WIC             = 1;   // Wake-up interrupt controller support
  parameter WICLINES        = 34;  // Supported WIC lines
  parameter WPT             = 2;   // Number of DWT comparators

 // --------------------------------------------------------------------------------
 // Cortex-M0/Cortex-M0+ Microcontroller
 // --------------------------------------------------------------------------------

  cmsdk_mcu
   #(.BE               (BE),
     .BKPT             (BKPT),          // Number of breakpoint comparators
     .DBG              (DBG),           // Debug configuration
     .NUMIRQ           (NUMIRQ),        // NUMIRQ
     .SMUL             (SMUL),          // Multiplier configuration
     .SYST             (SYST),          // SysTick
     .WIC              (WIC),           // Wake-up interrupt controller support
     .WICLINES         (WICLINES),      // Supported WIC lines
     .WPT              (WPT)            // Number of DWT comparators
   )
   u_cmsdk_mcu (
  .XTAL1      (XTAL1_wire),  // input
  .XTAL2      (XTAL2),  // output
  .NRST       (NRST),   // active low reset
  .P0         (P0),
  //.P1         (P1),
  .nTRST      (nTRST),  // Not needed if serial-wire debug is used
  .TDI        (TDI),    // Not needed if serial-wire debug is used
  .TDO        (TDO),    // Not needed if serial-wire debug is used
  .TMS        (SWDIOTMS),
  .TCK        (SWCLKTCK),
  
  .b_pad_gpio_porta (b_pad_gpio_porta),
                
  .uart0_rxd        (uart0_rxd),
  .uart0_txd        (uart0_txd),
  .uart0_txen       (uart0_txen)
  );
  


M0clkpll u_M0clkpll(
	.refclk	 (XTAL1    ),
	.clk0_out (XTAL1_wire)
);
  
  
  
endmodule