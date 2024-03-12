//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2017 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368442 $
//  File Date           : $Date: 2017-07-25 15:07:59 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//------------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------
// Abstract : Top level for Cortex-M0 DesignStart Eval RTL example
//-----------------------------------------------------------------------------
//

`include "cmsdk_mcu_defs.v"

module cmsdk_mcu #(
  //-----------------------------------------
  // CPU options

  parameter BE              = 0,   // Big or little endian
  parameter BKPT            = 4,   // Number of breakpoint comparators
  parameter DBG             = 1,   // Debug configuration
  parameter NUMIRQ          = 32,  // NUM of IRQ
  parameter SMUL            = 0,   // Multiplier configuration
  parameter SYST            = 1,   // SysTick
  parameter WIC             = 0,   // Wake-up interrupt controller support
  parameter WICLINES        = 34,  // Supported WIC lines
  parameter WPT             = 2    // Number of DWT comparators

 )
 (
  input  wire          XTAL1, // input
  output wire          XTAL2, // output
  input  wire          NRST,  // active low reset
  inout  wire  [15:0]  P0,
  inout  wire  [15:0]  P1,

  input  wire          nTRST,
  input  wire          TDI,
  output wire          TDO,
  inout  wire          SWDIOTMS,
  input  wire          SWCLKTCK);


//------------------------------------
// internal wires
  wire               SLEEPING;
  wire               APBACTIVE;
  wire               SYSRESETREQ;    // processor system reset request
  wire               WDOGRESETREQ;   // watchdog system reset request
  wire               HRESETREQ;      // Combined system reset request
  wire               cmsdk_SYSRESETREQ; // Combined system reset request
  wire               clk_ctrl_sys_reset_req;
  wire               PMUHRESETREQ;
  wire               PMUDBGRESETREQ;
  wire               LOCKUP;
  wire               LOCKUPRESET;
  wire               PMUENABLE;
  wire               SLEEPDEEP;

  wire               PORESETn;// Power on reset
  wire               HRESETn; // AHB reset
  wire               PRESETn; // APB and peripheral reset
  wire               DBGRESETn; // Debug system reset
  wire               FCLK;    // Free running system clock
  wire               HCLK;    // System clock from PMU
  wire               DCLK;
  wire               SCLK;
  wire               PCLK;    // Peripheral clock
  wire               PCLKG;   // Gated PCLK for APB
  wire               HCLKSYS; // System clock for memory
  wire               PCLKEN;  // Clock divider for AHB to APB bridge
  // Common AHB signals
  wire  [31:0]       HADDR;
  wire  [1:0]        HTRANS;
  wire  [2:0]        HSIZE;
  wire               HWRITE;
  wire  [31:0]       HWDATA;
  wire               HREADY;

  // Flash memory AHB signals
  wire               flash_hsel;
  wire               flash_hreadyout;
  wire  [31:0]       flash_hrdata;
  wire               flash_hresp;

  // SRAM AHB signals
  wire               sram_hsel;
  wire               sram_hreadyout;
  wire  [31:0]       sram_hrdata;
  wire               sram_hresp;

  // internal peripheral signals
  wire               uart0_rxd;
  wire               uart0_txd;
  wire               uart0_txen;
  wire               uart1_rxd;
  wire               uart1_txd;
  wire               uart1_txen;
  wire               uart2_rxd;
  wire               uart2_txd;
  wire               uart2_txen;

  wire               timer0_extin;
  wire               timer1_extin;

  wire  [15:0]       p0_in;
  wire  [15:0]       p0_out;
  wire  [15:0]       p0_outen;
  wire  [15:0]       p0_altfunc;

  wire  [15:0]       p1_in;
  wire  [15:0]       p1_out;
  wire  [15:0]       p1_outen;
  wire  [15:0]       p1_altfunc;

  localparam BASEADDR_GPIO0       = 32'h4001_0000;
  localparam BASEADDR_GPIO1       = 32'h4001_1000;
  localparam BASEADDR_SYSROMTABLE = 32'hF000_0000;

  // Internal Debug signals
  wire               i_trst_n;
  wire               i_swditms;
  wire               i_swclktck;
  wire               i_tdi;
  wire               i_tdo;
  wire               i_tdoen_n;
  wire               i_swdo;
  wire               i_swdoen;

  wire               TESTMODE;

  assign TESTMODE = 1'b0;

//----------------------------------------
// Clock and reset controller
//----------------------------------------
  // Clock controller generates reset if PMU request (PMUHRESETREQ),
  // CPU request or watchdog request (SYSRESETREQ)
  assign clk_ctrl_sys_reset_req = PMUHRESETREQ | cmsdk_SYSRESETREQ;

  // Clock controller to generate reset and clock signals
  cmsdk_mcu_clkctrl
   #(.CLKGATE_PRESENT(0))
   u_cmsdk_mcu_clkctrl(
     // inputs
    .XTAL1            (XTAL1),
    .NRST             (NRST),

    .APBACTIVE        (APBACTIVE),
    .SLEEPING         (SLEEPING),
    .SLEEPDEEP        (SLEEPDEEP),
    .LOCKUP           (LOCKUP),
    .LOCKUPRESET      (LOCKUPRESET),
    .SYSRESETREQ      (clk_ctrl_sys_reset_req),
    .DBGRESETREQ      (PMUDBGRESETREQ),
    .CGBYPASS         (TESTMODE),
    .RSTBYPASS        (TESTMODE),

     // outputs
    .XTAL2            (XTAL2),

    .FCLK             (FCLK),

    .PCLK             (PCLK),
    .PCLKG            (PCLKG),
    .PCLKEN           (PCLKEN),
    .PORESETn         (PORESETn),
    .DBGRESETn        (DBGRESETn),
    .HRESETn          (HRESETn),
    .PRESETn          (PRESETn)
    );

//----------------------------------------
//
  // System Reset request can be from processor or watchdog
  // or when lockup happens and the control flag is set.
  assign  cmsdk_SYSRESETREQ = SYSRESETREQ | WDOGRESETREQ |
                              (LOCKUP & LOCKUPRESET);

  // Power Management Unit will not be available
  assign  HCLK = FCLK;        // connect HCLK to FCLK
  assign  DCLK = FCLK;        // connect DCLK to FCLK
  assign  SCLK = FCLK;        // connect SCLK to FCLK

  // Since there is no PMU, these signals are not used
  assign  PMUDBGRESETREQ = 1'b0;
  assign  PMUHRESETREQ   = 1'b0;

//---------------------------------------------------
// System design for example Cortex-M0 MCU
//---------------------------------------------------
  cmsdk_mcu_system
   #(.BE               (BE),
     .BASEADDR_GPIO0   (BASEADDR_GPIO0), // GPIO0 Base Address
     .BASEADDR_GPIO1   (BASEADDR_GPIO1), // GPIO1 Base Address
     .BKPT             (BKPT),           // Number of breakpoint comparators
     .DBG              (DBG),            // Debug configuration
     .NUMIRQ           (NUMIRQ),         // NUMIRQ
     .SMUL             (SMUL),           // Multiplier configuration
     .SYST             (SYST),           // SysTick
     .WIC              (WIC),            // Wake-up interrupt controller support
     .WICLINES         (WICLINES),       // Supported WIC lines
     .WPT              (WPT),            // Number of DWT comparators
     .BASEADDR_SYSROMTABLE (BASEADDR_SYSROMTABLE) // System ROM Table base address
   )
    u_cmsdk_mcu_system (
    .FCLK             (FCLK),
    .HCLK             (HCLK),
    .DCLK             (DCLK),                        
    .SCLK             (SCLK),
    .HRESETn          (HRESETn),
    .PORESETn         (PORESETn),
    .DBGRESETn        (DBGRESETn),
    .PCLK             (PCLK),
    .PCLKG            (PCLKG),
    .PRESETn          (PRESETn),
    .PCLKEN           (PCLKEN),

    // Common AHB signals
    .HADDR            (HADDR),
    .HTRANS           (HTRANS),
    .HSIZE            (HSIZE),
    .HWRITE           (HWRITE),
    .HWDATA           (HWDATA),
    .HREADY           (HREADY),

    // Flash
    .flash_hsel       (flash_hsel),
    .flash_hreadyout  (flash_hreadyout),
    .flash_hrdata     (flash_hrdata),
    .flash_hresp      (flash_hresp),

    // SRAM
    .sram_hsel        (sram_hsel),
    .sram_hreadyout   (sram_hreadyout),
    .sram_hrdata      (sram_hrdata),
    .sram_hresp       (sram_hresp),

    // Optional boot loader
    // Only use if BOOT_MEM_TYPE is not zero
    .boot_hsel        (),
    .boot_hreadyout   (1'b0),
    .boot_hrdata      (32'h00000000),
    .boot_hresp       (1'b0),

    // Status
    .APBACTIVE        (APBACTIVE),
    .SLEEPING         (SLEEPING),
    .SYSRESETREQ      (SYSRESETREQ),
    .WDOGRESETREQ     (WDOGRESETREQ),
    .LOCKUP           (LOCKUP),
    .LOCKUPRESET      (LOCKUPRESET),
    .PMUENABLE        (PMUENABLE),
    .SLEEPDEEP        (SLEEPDEEP),
    // Debug
    .nTRST            (i_trst_n),
    .SWDITMS          (i_swditms),
    .SWCLKTCK         (i_swclktck),
    .TDI              (i_tdi),
    .TDO              (i_tdo),
    .nTDOEN           (i_tdoen_n),
    .SWDO             (i_swdo),
    .SWDOEN           (i_swdoen),
    // UART
    .uart0_rxd        (uart0_rxd),
    .uart0_txd        (uart0_txd),
    .uart0_txen       (uart0_txen),
    .uart1_rxd        (uart1_rxd),
    .uart1_txd        (uart1_txd),
    .uart1_txen       (uart1_txen),
    .uart2_rxd        (uart2_rxd),
    .uart2_txd        (uart2_txd),
    .uart2_txen       (uart2_txen),

    // Timer
    .timer0_extin     (timer0_extin),
    .timer1_extin     (timer1_extin),

    // IO Ports
    .p0_in            (p0_in),
    .p0_out           (p0_out),
    .p0_outen         (p0_outen),
    .p0_altfunc       (p0_altfunc),

    .p1_in            (p1_in),
    .p1_out           (p1_out),
    .p1_outen         (p1_outen),
    .p1_altfunc       (p1_altfunc),

    .DFTSE            (1'b0)
  );

assign   HCLKSYS  = HCLK;

//----------------------------------------
// Flash memory
//----------------------------------------
cmsdk_ahb_rom
  #(.MEM_TYPE(1'b1),
    .AW(16),  // 64K bytes flash ROM
    .filename("image.hex"),
    .WS_N(`ARM_CMSDK_ROM_MEM_WS_N),
    .WS_S(`ARM_CMSDK_ROM_MEM_WS_S),
    .BE  (BE))
   u_ahb_rom (
    .HCLK             (HCLKSYS),
    .HRESETn          (HRESETn),
    .HSEL             (flash_hsel),  // AHB inputs
    .HADDR            (HADDR[15:0]),
    .HTRANS           (HTRANS),
    .HSIZE            (HSIZE),
    .HWRITE           (HWRITE),
    .HWDATA           (HWDATA),
    .HREADY           (HREADY),

    .HREADYOUT        (flash_hreadyout), // Outputs
    .HRDATA           (flash_hrdata),
    .HRESP            (flash_hresp)
  );

//----------------------------------------
// SRAM
//----------------------------------------
cmsdk_ahb_ram
  #(.MEM_TYPE(1'b1),
    .AW(16),  // 64K bytes SRAM
    .WS_N(`ARM_CMSDK_RAM_MEM_WS_N),
    .WS_S(`ARM_CMSDK_RAM_MEM_WS_S))
   u_ahb_ram (
    .HCLK             (HCLKSYS),
    .HRESETn          (HRESETn),
    .HSEL             (sram_hsel),  // AHB inputs
    .HADDR            (HADDR[15:0]),
    .HTRANS           (HTRANS),
    .HSIZE            (HSIZE),
    .HWRITE           (HWRITE),
    .HWDATA           (HWDATA),
    .HREADY           (HREADY),

    .HREADYOUT        (sram_hreadyout), // Outputs
    .HRDATA           (sram_hrdata),
    .HRESP            (sram_hresp)
  );

//----------------------------------------
// I/O port pin muxing and tristate
//----------------------------------------
  cmsdk_mcu_pin_mux
    u_pin_mux (
    // UART
    .uart0_rxd        (uart0_rxd),
    .uart0_txd        (uart0_txd),
    .uart0_txen       (uart0_txen),
    .uart1_rxd        (uart1_rxd),
    .uart1_txd        (uart1_txd),
    .uart1_txen       (uart1_txen),
    .uart2_rxd        (uart2_rxd),
    .uart2_txd        (uart2_txd),
    .uart2_txen       (uart2_txen),

    // Timer
    .timer0_extin     (timer0_extin),
    .timer1_extin     (timer1_extin),

    // IO Ports
    .p0_in            (p0_in),
    .p0_out           (p0_out),
    .p0_outen         (p0_outen),
    .p0_altfunc       (p0_altfunc),

    .p1_in            (p1_in),
    .p1_out           (p1_out),
    .p1_outen         (p1_outen),
    .p1_altfunc       (p1_altfunc),

    // Debug
    .i_trst_n         (i_trst_n),
    .i_swditms        (i_swditms),
    .i_swclktck       (i_swclktck),
    .i_tdi            (i_tdi),
    .i_tdo            (i_tdo),
    .i_tdoen_n        (i_tdoen_n),
    .i_swdo           (i_swdo),
    .i_swdoen         (i_swdoen),

    // IO pads
    .P0               (P0),
    .P1               (P1),

    .nTRST            (nTRST),  // Not needed if serial-wire debug is used
    .TDI              (TDI),    // Not needed if serial-wire debug is used
    .SWDIOTMS         (SWDIOTMS),
    .SWCLKTCK         (SWCLKTCK),
    .TDO              (TDO)     // Not needed if serial-wire debug is used

  );

endmodule



