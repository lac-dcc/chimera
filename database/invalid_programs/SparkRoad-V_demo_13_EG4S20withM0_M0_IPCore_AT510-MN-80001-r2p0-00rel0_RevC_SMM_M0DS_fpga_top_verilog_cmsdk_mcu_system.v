//-----------------------------------------------------------------------------
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
//  File Revision       : $Revision: 368444 $
//  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : System level design for the example Cortex-M0 system
//-----------------------------------------------------------------------------
// Note: This file has been modified from original CMSDK due to memory
//       map differences, and extra peripheral interrupts
`include "cmsdk_mcu_defs.v"

module cmsdk_mcu_system #(
  parameter BASEADDR_GPIO0  = 32'h4001_0000,    // GPIO0 peripheral base address
  parameter BASEADDR_GPIO1  = 32'h4001_1000,    // GPIO1 peripheral base address
  parameter BE              = 0,                // 1: Big endian 0: little endian
  parameter BKPT            = 4,                // Number of breakpoint comparators
  parameter DBG             = 1,                // Debug configuration
  parameter NUMIRQ          = 32,               // NUM of IRQ
  parameter SMUL            = 0,                // Multiplier configuration
  parameter SYST            = 1,                // SysTick
  parameter WIC             = 0,                // Wake-up interrupt controller support
  parameter WICLINES        = 34,               // Supported WIC lines
  parameter WPT             = 2,                // Number of DWT comparators

  parameter CLKGATE_PRESENT = 0,                // Enable clock gating
  parameter BOOT_MEM_TYPE   = 0,                // Boot loader memory type

  parameter INCLUDE_DMA     = 0,                // Include instantiation of DMA-230
                                                // This option also add a number of bus components
  parameter DMA_CHANNEL_NUM = 0,                // Number of DMA channels
  parameter INCLUDE_BITBAND = 0,                // Include instantiation of Bit-band wrapper
  parameter INCLUDE_JTAG    = 0,                // Include JTAG feature

  //----------------------------------------------------
  // Derived parameters
  //----------------------------------------------------
  // Generate BOOT_LOADER_PRESENT based on BOOT_MEM_TYPE
  // This is a derived parameter - do not override using instiantiation
  parameter BOOT_LOADER_PRESENT = (BOOT_MEM_TYPE==0) ? 0 : 1,

  // Location of the System ROM Table.
  parameter BASEADDR_SYSROMTABLE = 32'hF000_0000

 )
 (
  input  wire               FCLK,             // Free running clock
  input  wire               HCLK,             // AHB clock(from PMU)
  input  wire               DCLK,             // Debug system clock (from PMU)
  input  wire               SCLK,             // System clock
  input  wire               HRESETn,          // AHB and System reset
  input  wire               PORESETn,         // Power on reset
  input  wire               DBGRESETn,        // Debug reset
  input  wire               RSTBYPASS,        // Reset bypass (for testing)
  input  wire               PCLK,             // Peripheral clock
  input  wire               PCLKG,            // Gated Peripheral bus clock
  input  wire               SLOWCLK,          // Peripheral clock
  input  wire               SLOWCLKG,         // Gated Peripheral bus clock
  input  wire               PRESETn,          // Peripheral system and APB reset
  input  wire               PCLKEN,           // Clock divide control for AHB to APB bridge

  input  wire               zbt_boot_ctrl,    // MODIFICATION:Set to 1 to boot from ZBT SRAM

  output wire  [31:0]       HADDR,            // AHB to memory blocks - address
  output wire   [1:0]       HTRANS,           // AHB to memory blocks - transfer ctrl
  output wire   [2:0]       HSIZE,            // AHB to memory blocks - transfer size
  output wire               HWRITE,           // AHB to memory blocks - write ctrl
  output wire  [31:0]       HWDATA,           // AHB to memory blocks - write data
  output wire               HREADY,           // AHB to memory blocks - AHB ready

  output wire               flash_hsel,       // AHB to flash memory - select
  input  wire               flash_hreadyout,  // AHB from flash blocks - ready
  input  wire  [31:0]       flash_hrdata,     // AHB from flash blocks - read data
  input  wire               flash_hresp,      // AHB from flash blocks - response

  output wire               sram_hsel,        // AHB to SRAM - select
  input  wire               sram_hreadyout,   // AHB from SRAM - ready
  input  wire  [31:0]       sram_hrdata,      // AHB from SRAM - read data
  input  wire               sram_hresp,       // AHB from SRAM - response

                                              // Optional : only if BOOT_MEM_TYPE!=0
  output wire               boot_hsel,        // AHB to boot loader - select
  input  wire               boot_hreadyout,   // AHB from boot loader - ready
  input  wire  [31:0]       boot_hrdata,      // AHB from boot loader - read data
  input  wire               boot_hresp,       // AHB from boot loader - response

// Done  
  output wire               APBACTIVE,        // APB bus active (for clock gating of PCLKG)
  output wire               SLEEPING,         // Processor status - sleeping
  output wire               SLEEPDEEP,        // Processor status - deep sleep
  output wire               SYSRESETREQ,      // Processor control - system reset request
  output wire               WDOGRESETREQ,     // Watchdog reset request
  output wire               LOCKUP,           // Processor status - Locked up (from core partition)
  output wire               LOCKUPRESET,      // System Controller cfg - reset if lockup
  output wire               PMUENABLE,        // System Controller cfg - Enable PMU

// Done
  output wire               GATEHCLK,         // Processor status - safe to gate HCLK
  output wire               WAKEUP,           // Wake up request from WIC
  input  wire               WICENREQ,         // WIC enable request from PMU
  output wire               WICENACK,         // WIC enable ack to PMU
  output wire               CDBGPWRUPREQ,     // Debug Power Up request to PMU
  input  wire               CDBGPWRUPACK,     // Debug Power Up ACK from PMU
  input  wire               SLEEPHOLDREQn,    // Sleep extension request from PMU
  output wire               SLEEPHOLDACKn,    // Sleep extension request to PMU

  input  wire               uart0_rxd,        // Uart 0 receive data
  output wire               uart0_txd,        // Uart 0 transmit data
  output wire               uart0_txen,       // Uart 0 transmit data enable
  input  wire               uart1_rxd,        // Uart 1 receive data
  output wire               uart1_txd,        // Uart 1 transmit data
  output wire               uart1_txen,       // Uart 1 transmit data enable
  input  wire               uart2_rxd,        // Uart 2 receive data
  output wire               uart2_txd,        // Uart 2 transmit data
  output wire               uart2_txen,       // Uart 2 transmit data enable
  input  wire               uart3_rxd,        // Uart 3 receive data
  output wire               uart3_txd,        // Uart 3 transmit data
  output wire               uart3_txen,       // Uart 3 transmit data enable
  input  wire               uart4_rxd,        // Uart 4 receive data
  output wire               uart4_txd,        // Uart 4 transmit data
  output wire               uart4_txen,       // Uart 4 transmit data enable

  input  wire               timer0_extin,     // Timer 0 external input
  input  wire               timer1_extin,     // Timer 1 external input

  input  wire  [15:0]       p0_in,            // GPIO 0 inputs
  output wire  [15:0]       p0_out,           // GPIO 0 outputs
  output wire  [15:0]       p0_outen,         // GPIO 0 output enables
  output wire  [15:0]       p0_altfunc,       // GPIO 0 alternate function (pin mux)
  input  wire  [15:0]       p1_in,            // GPIO 1 inputs
  output wire  [15:0]       p1_out,           // GPIO 1 outputs
  output wire  [15:0]       p1_outen,         // GPIO 1 output enables
  output wire  [15:0]       p1_altfunc,       // GPIO 1 alternate function (pin mux)

  input  wire               spi_interrupt,    // MODIFICATION: V2M-MPS2 SPI interrupt
  input  wire               i2s_interrupt,    // MODIFICATION: V2M-MPS2 I2S interrupt
  input  wire               eth_interrupt,    // MODIFICATION: V2M-MPS2 Ethernet interrupt
  input  wire               ts_interrupt,     // MODIFICATION: V2M-MPS2 Touch screen interrupt
  input  wire               gpio2_interrupt,  // MODIFICATION: V2M-MPS2 GPIO 2
  input  wire               gpio3_interrupt,  // MODIFICATION: V2M-MPS2 GPIO 3

  // DEBUG
  input  wire               nTRST,
  input  wire               SWCLKTCK,
  input  wire               SWDITMS,
  input  wire               TDI,
  output wire               SWDO,
  output wire               SWDOEN,
  output wire               TDO,
  output wire               nTDOEN,
  
  input  wire               DBGRESTART,
  output wire               DBGRESTARTED,
  input  wire               EDBGRQ,

  input  wire               DFTSE             // dummy scan enable port for synthesis
);           

  // -------------------------------
  // Internal signals
  // -------------------------------
  wire              HCLKSYS;        // System AHB clock

  // Bit band wrapper bus between CPU and the reset of the system
  wire     [31:0]   cm_haddr;
  wire     [1:0]    cm_htrans;
  wire     [2:0]    cm_hsize;
  wire     [2:0]    cm_hburst;
  wire     [3:0]    cm_hprot;
  wire              cm_hmastlock;
  wire              cm_hmaster;
  wire              cm_hwrite;
  wire     [31:0]   cm_hwdata;
  wire     [31:0]   cm_hrdata;
  wire              cm_hready;
  wire              cm_hreadyout;
  wire              cm_hresp;

  wire     [31:0]   cm0_haddr;        // AHB from core - addr
  wire     [ 2:0]   cm0_hburst;       // AHB from core - burst
  wire              cm0_hmastlock;    // AHB from core - master lock
  wire     [ 3:0]   cm0_hprot;        // AHB from core - prot
  wire     [ 2:0]   cm0_hsize;        // AHB from core - size)
  wire     [ 1:0]   cm0_htrans;       // AHB from core - transfer
  wire     [31:0]   cm0_hwdata;       // AHB from core - write data
  wire              cm0_hwrite;       // AHB from core - write enable
  wire     [31:0]   cm0_hrdata;       // AHB from core - read data
  wire              cm0_hready;       // AHB from core - ready
  wire              cm0_hresp;        // AHB from core - response
  wire              cm0_hmaster;      // AHB from core - master

  // System bus from DMA Controller
  // (Optional, only used when INCLUDE_DMA!=0)
  wire     [31:0]   dmac_haddr;
  wire     [1:0]    dmac_htrans;
  wire     [2:0]    dmac_hsize;
  wire     [2:0]    dmac_hburst;
  wire     [3:0]    dmac_hprot;
  wire              dmac_hmastlock;
  wire              dmac_hwrite;
  wire     [31:0]   dmac_hwdata;
  wire     [31:0]   dmac_hrdata;
  wire              dmac_hready;
  wire              dmac_hresp;

  wire              dmac_psel;
  wire              dmac_pready;
  wire              dmac_pslverr;
  wire     [31:0]   dmac_prdata;

  // System bus
  wire              sys_hselm;  // Note: the sys_hselm signal is for protocol checking only.
  wire     [31:0]   sys_haddr;
  wire     [1:0]    sys_htrans;
  wire     [2:0]    sys_hsize;
  wire     [2:0]    sys_hburst;
  wire     [3:0]    sys_hprot;
  wire              sys_hmaster;
  wire              sys_hmastlock;
  wire              sys_hwrite;
  wire     [31:0]   sys_hwdata;
  wire     [31:0]   sys_hrdata;
  wire              sys_hready;
  wire              sys_hreadyout;
  wire              sys_hresp;

  wire              defslv_hsel;   // AHB default slave signals
  wire              defslv_hreadyout;
  wire     [31:0]   defslv_hrdata;
  wire              defslv_hresp;

  wire              apbsys_hsel;  // APB subsystem AHB interface signals
  wire              apbsys_hreadyout;
  wire     [31:0]   apbsys_hrdata;
  wire              apbsys_hresp;

  wire              gpio0_hsel;   // AHB GPIO bus interface signals
  wire              gpio0_hreadyout;
  wire     [31:0]   gpio0_hrdata;
  wire              gpio0_hresp;

  wire              gpio1_hsel;   // AHB GPIO bus interface signals
  wire              gpio1_hreadyout;
  wire     [31:0]   gpio1_hrdata;
  wire              gpio1_hresp;

  wire              sysctrl_hsel;  // System control bus interface signals
  wire              sysctrl_hreadyout;
  wire     [31:0]   sysctrl_hrdata;
  wire              sysctrl_hresp;

  wire     [31:0]   intisr_cm0;    // Combined interrupts output to core
  wire              intnmi_cm0;    // NMI interrupt output to core

  // MTB (Only available to the Cortex-M0+)
  wire              HSELMTB;
  wire              HREADYOUTMTB;
  wire     [31:0]   HRDATAMTB;
  wire              HRESPMTB;
  wire              HSELSFR;
  wire              HSELRAM;

  // SysTick timer signals
  wire              STCLKEN;
  wire     [25:0]   STCALIB;
  
  // System ROM Table
  wire              sysrom_hsel;      // AHB to System ROM Table - select
  wire              sysrom_hreadyout; // AHB from System ROM Table - ready
  wire     [31:0]   sysrom_hrdata;    // AHB from System ROM Table - read data
  wire              sysrom_hresp;     // AHB from System ROM Table - response

  wire [1:0]        sys_hmaster_i;

  // APB expansion port signals
  wire     [11:0]   exp_paddr;
  wire     [31:0]   exp_pwdata;
  wire              exp_pwrite;
  wire              exp_penable;

  wire     [33:0]   WICSENSE;       // Not used

  wire              remap_ctrl;

  // Interrupt request
  wire     [15:0]   gpio0_intr;
  wire              gpio0_combintr;
  wire              gpio1_combintr;
  wire     [31:0]   apbsubsys_interrupt;
  wire              dma_err;
  wire              watchdog_interrupt;

     // I/O Port
  wire              IOMATCH;
  wire     [31:0]   IORDATA;
  wire              IOTRANS;
  wire              IOWRITE;
  wire     [31:0]   IOCHECK;
  wire     [31:0]   IOADDR;
  wire     [ 1:0]   IOSIZE;
  wire              IOMASTER;
  wire              IOPRIV;
  wire     [31:0]   IOWDATA;

  // event signals
  wire              DMA_DONE;       // From DMA controller to indicate completion
  wire              TXEV;           // Not used
  wire              RXEV;           // Used by Cortex-M0 PMTB only

  // Processor status
  wire              HALTED;         // Not used
`ifdef CORTEX_M0
  wire      [2:0]   CODEHINTDE;     // Not used
`endif
`ifdef CORTEX_M0DESIGNSTART
  wire      [2:0]   CODEHINTDE;     // Not used
`endif

  wire              SPECHTRANS;     // Not used
  wire              CODENSEQ;       // Not used
  wire              SHAREABLE;

  // -------------------------------
  // Processor and power management
  // -------------------------------
  // If DMA is presented, use SCLK for system HCLK so that
  // DMA can run even if processor is in sleep mode.
  // Otherwise there is only one master (cpu), so AHB system
  // clock can be stopped when DMA take place.
  assign   HCLKSYS  = (INCLUDE_DMA!=0) ? SCLK : HCLK;

  // Generate event when a DMA operation completed.
  assign   RXEV = DMA_DONE;

  
`ifdef CORTEX_M0DESIGNSTART                
    // Cortex-M0 DesignStart version, obfuscated code
    // Does not pass any parameters, since using obfuscated code
    CORTEXM0INTEGRATION
`endif
`ifdef CORTEX_M0                           
    // Cortex-M0 non-obfuscated code
    // Has parameterised code
    CORTEXM0INTEGRATION
      #(.ACG            (CLKGATE_PRESENT), // Architectural clock gating
        .BE             (BE),              // Big-endian
        .BKPT           (BKPT),            // Number of breakpoint comparators
        .DBG            (DBG),             // Debug configuration
        .JTAGnSW        (INCLUDE_JTAG),    // Debug port interface: JTAGnSW
        .NUMIRQ         (NUMIRQ),          // Number of Interrupts
        .RAR            (0),               // Reset All Registers
        .SMUL           (SMUL),            // Multiplier configuration
        .SYST           (SYST),            // SysTick
        .WIC            (WIC),             // Wake-up interrupt controller support
        .WICLINES       (WICLINES),        // Supported WIC lines
        .WPT            (WPT))             // Number of DWT comparators
`endif

    u_cortex_m0_integration (
        // System inputs
        .FCLK           (FCLK),             // FCLK
        .SCLK           (SCLK),             // SCLK generated from PMU
        .HCLK           (HCLK),             // HCLK generated from PMU
        .DCLK           (DCLK),             // DCLK generated from PMU
        .PORESETn       (PORESETn),
        .HRESETn        (HRESETn),
        .DBGRESETn      (DBGRESETn),
        .RSTBYPASS      (RSTBYPASS),
        .SE             (DFTSE),

        // Power management inputs
        .SLEEPHOLDREQn  (SLEEPHOLDREQn),
        .WICENREQ       (WICENREQ),
        .CDBGPWRUPACK   (CDBGPWRUPACK),

        // Power management outputs
        .SLEEPHOLDACKn  (SLEEPHOLDACKn),
        .WICENACK       (WICENACK),
        .CDBGPWRUPREQ   (CDBGPWRUPREQ),

        .WAKEUP         (WAKEUP),
        .WICSENSE       (WICSENSE),
        .GATEHCLK       (GATEHCLK),
        .SYSRESETREQ    (SYSRESETREQ),

        // System bus
        .HADDR          (cm0_haddr),
        .HTRANS         (cm0_htrans),
        .HSIZE          (cm0_hsize),
        .HBURST         (cm0_hburst),
        .HPROT          (cm0_hprot),
        .HMASTER        (cm0_hmaster),
        .HMASTLOCK      (cm0_hmastlock),
        .HWRITE         (cm0_hwrite),
        .HWDATA         (cm0_hwdata),
        .HRDATA         (cm0_hrdata),
        .HREADY         (cm0_hready),
        .HRESP          (cm0_hresp),

        .CODEHINTDE     (CODEHINTDE),
        .SPECHTRANS     (SPECHTRANS),
        .CODENSEQ       (CODENSEQ),

        // Interrupts
        .IRQ            (intisr_cm0[31:0]),
        .NMI            (intnmi_cm0),
        .IRQLATENCY     (8'h00),
        .ECOREVNUM      (28'h0),

        // Systick
        .STCLKEN        (STCLKEN),
        .STCALIB        (STCALIB),

        // Debug - JTAG or Serial wire
        // Inputs
        .nTRST          (nTRST),
        .SWDITMS        (SWDITMS),
        .SWCLKTCK       (SWCLKTCK),
        .TDI            (TDI),
        // Outputs
        .TDO            (TDO),
        .nTDOEN         (nTDOEN),
        .SWDO           (SWDO),
        .SWDOEN         (SWDOEN),

        .DBGRESTART     (DBGRESTART),
        .DBGRESTARTED   (DBGRESTARTED),

        // Event communication
        .TXEV           (TXEV),
        .RXEV           (RXEV),
        .EDBGRQ         (EDBGRQ),
        // Status output
        .HALTED         (HALTED),
        .LOCKUP         (LOCKUP),
        .SLEEPING       (SLEEPING),
        .SLEEPDEEP      (SLEEPDEEP)
    );

  // No MTB in Cortex-M0
  assign   HRDATAMTB     = {32{1'b0}};
  assign   HREADYOUTMTB  = 1'b0;
  assign   HRESPMTB      = 1'b0;
  
  // -------------------------------
  // AHB system
  // -------------------------------

  generate if (INCLUDE_BITBAND != 0) begin : gen_ahb_bitband

  cmsdk_ahb_bitband #(.MW(1), .BE(BE)) u_ahb_bitband (
  // System
  .HCLK        (HCLKSYS),
  .HRESETn     (HRESETn),

  .HSELS       (1'b1),
  .HADDRS      (cm0_haddr),
  .HTRANSS     (cm0_htrans),
  .HPROTS      (cm0_hprot),
  .HBURSTS     (cm0_hburst),
  .HMASTERS    (cm0_hmaster),
  .HMASTLOCKS  (cm0_hmastlock),
  .HSIZES      (cm0_hsize),
  .HWRITES     (cm0_hwrite),
  .HREADYS     (cm0_hready),
  .HWDATAS     (cm0_hwdata),
  .HREADYOUTS  (cm0_hready),
  .HRDATAS     (cm0_hrdata),
  .HRESPS      (cm0_hresp),


  .HSELM       (),
  .HADDRM      (cm_haddr),
  .HTRANSM     (cm_htrans),
  .HPROTM      (cm_hprot),
  .HBURSTM     (cm_hburst),
  .HMASTERM    (cm_hmaster),
  .HMASTLOCKM  (cm_hmastlock),
  .HSIZEM      (cm_hsize),
  .HWRITEM     (cm_hwrite),
  .HREADYM     (cm_hready),
  .HWDATAM     (cm_hwdata),
  .HREADYOUTM  (cm_hreadyout),
  .HRDATAM     (cm_hrdata),
  .HRESPM      (cm_hresp)
  );

  end else begin  : gen_no_ahb_bitband
  // No bitband wrapper, direct signal connections
  assign   cm_haddr[31:0]  = cm0_haddr[31:0];
  assign   cm_htrans[1:0]  = cm0_htrans[1:0];
  assign   cm_hsize[2:0]   = cm0_hsize[2:0];
  assign   cm_hburst[2:0]  = cm0_hburst[2:0];
  assign   cm_hprot[3:0]   = cm0_hprot[3:0];
  assign   cm_hmaster      = cm0_hmaster;
  assign   cm_hmastlock    = cm0_hmastlock;
  assign   cm_hwrite       = cm0_hwrite;
  assign   cm_hwdata[31:0] = cm0_hwdata[31:0];
  assign   cm_hready       = cm0_hready;
  assign   cm0_hrdata[31:0]= cm_hrdata[31:0];
  assign   cm0_hready      = cm_hreadyout;
  assign   cm0_hresp       = cm_hresp;

  end endgenerate

  generate if (INCLUDE_DMA != 0) begin  : gen_ahb_master_mux


  cmsdk_ahb_master_mux #(
    .PORT0_ENABLE (1),
    .PORT1_ENABLE (0),
    .PORT2_ENABLE (1),
    .DW           (32)
    )
  u_ahb_master_mux (
    .HCLK         (HCLKSYS),
    .HRESETn      (HRESETn),

    .HSELS0       (1'b1),
    .HADDRS0      (cm_haddr[31:0]),
    .HTRANSS0     (cm_htrans[1:0]),
    .HSIZES0      (cm_hsize[2:0]),
    .HWRITES0     (cm_hwrite),
    .HREADYS0     (cm_hready),
    .HPROTS0      (cm_hprot[3:0]),
    .HBURSTS0     (cm_hburst[2:0]),
    .HMASTLOCKS0  (cm_hmastlock),
    .HWDATAS0     (cm_hwdata[31:0]),

    .HREADYOUTS0  (cm_hreadyout),
    .HRESPS0      (cm_hresp),
    .HRDATAS0     (cm_hrdata[31:0]),

    .HSELS1       (1'b0),
    .HADDRS1      ({32{1'b0}}),
    .HTRANSS1     ({2{1'b0}}),
    .HSIZES1      ({3{1'b0}}),
    .HWRITES1     (1'b0),
    .HREADYS1     (1'b1),
    .HPROTS1      ({4{1'b0}}),
    .HBURSTS1     ({3{1'b0}}),
    .HMASTLOCKS1  (1'b0),
    .HWDATAS1     ({32{1'b0}}),

    .HREADYOUTS1  (),
    .HRESPS1      (),
    .HRDATAS1     (),

    .HSELS2       (1'b1),
    .HADDRS2      (dmac_haddr[31:0]),
    .HTRANSS2     (dmac_htrans[1:0]),
    .HSIZES2      (dmac_hsize[2:0]),
    .HWRITES2     (dmac_hwrite),
    .HREADYS2     (dmac_hready),
    .HPROTS2      (dmac_hprot[3:0]),
    .HBURSTS2     (dmac_hburst[2:0]),
    .HMASTLOCKS2  (dmac_hmastlock),
    .HWDATAS2     (dmac_hwdata[31:0]),

    .HREADYOUTS2  (dmac_hready),
    .HRESPS2      (dmac_hresp),
    .HRDATAS2     (dmac_hrdata[31:0]),

  // Output master port
    .HSELM        (sys_hselm), // Note: sys_hselm is not required for this particular example system.
                               //       It is connected to the AHB Lite protocol checker only.
    .HADDRM       (sys_haddr[31:0]),
    .HTRANSM      (sys_htrans[1:0]),
    .HSIZEM       (sys_hsize[2:0]),
    .HWRITEM      (sys_hwrite),
    .HREADYM      (sys_hready),
    .HPROTM       (sys_hprot[3:0]),
    .HBURSTM      (sys_hburst[2:0]),
    .HMASTLOCKM   (sys_hmastlock),
    .HWDATAM      (sys_hwdata[31:0]),
    .HMASTERM     (sys_hmaster_i[1:0]),

    .HREADYOUTM   (sys_hreadyout),
    .HRESPM       (sys_hresp),
    .HRDATAM      (sys_hrdata[31:0])
  );

  assign sys_hmaster = (sys_hmaster_i==2'b10); // 2'b00 (core) or 2'b10 (dma)
  // This signal is currently not used, but if the customer need to extend the subsystem, this signal may
  // be needed

  end else begin  : gen_no_ahb_master_mux
  // No DMA controller - no need to have master multiplexer
  // direct connection from cpu to system bus if DMA is not presented
  assign   sys_haddr[31:0] = cm_haddr[31:0];
  assign   sys_htrans[1:0] = cm_htrans[1:0];
  assign   sys_hsize[2:0]  = cm_hsize[2:0];
  assign   sys_hburst[2:0] = cm_hburst[2:0];
  assign   sys_hprot[3:0]  = cm_hprot[3:0];
  assign   sys_hmaster     = cm_hmaster;
  assign   sys_hmastlock   = cm_hmastlock;
  assign   sys_hwrite      = cm_hwrite;
  assign   sys_hwdata[31:0]= cm_hwdata[31:0];
  assign   sys_hready      = cm_hready;
  assign   cm_hrdata[31:0] = sys_hrdata[31:0];
  assign   cm_hreadyout    = sys_hreadyout;
  assign   cm_hresp        = sys_hresp;
  assign   sys_hmaster_i   = 2'b00;

  end endgenerate

  // AHB address decode
  cmsdk_mcu_addr_decode #(
     .BASEADDR_GPIO0       (BASEADDR_GPIO0),
     .BASEADDR_GPIO1       (BASEADDR_GPIO1),
     .BOOT_LOADER_PRESENT  (BOOT_LOADER_PRESENT),
     .BASEADDR_SYSROMTABLE (BASEADDR_SYSROMTABLE)
    )
    u_addr_decode (
    // System Address
    .haddr         (sys_haddr),
    .remap_ctrl    (remap_ctrl),
    .zbt_boot_ctrl (zbt_boot_ctrl),

    .boot_hsel     (boot_hsel),
    .flash_hsel    (flash_hsel),
    .sram_hsel     (sram_hsel),
    .apbsys_hsel   (apbsys_hsel),
    .gpio0_hsel    (gpio0_hsel),
    .gpio1_hsel    (gpio1_hsel),
    .sysctrl_hsel  (sysctrl_hsel),
    .sysrom_hsel   (sysrom_hsel),
    .defslv_hsel   (defslv_hsel),
    .hselmtb       (HSELMTB),
    .hselram       (HSELRAM),
    .hselsfr       (HSELSFR)
  );

  // AHB slave multiplexer
  cmsdk_ahb_slave_mux #(
    .PORT0_ENABLE  (1),
    .PORT1_ENABLE  (1),
    .PORT2_ENABLE  (BOOT_LOADER_PRESENT),
    .PORT3_ENABLE  (1),
    .PORT4_ENABLE  (1),
    .PORT5_ENABLE  (1),
    .PORT6_ENABLE  (1),
    .PORT7_ENABLE  (1),
    .PORT8_ENABLE  (1),
    .PORT9_ENABLE  (0),
    .DW            (32)
    )
    u_ahb_slave_mux_sys_bus (
    .HCLK         (HCLKSYS),
    .HRESETn      (HRESETn),
    .HREADY       (sys_hready),
    .HSEL0        (flash_hsel),      // Input Port 0
    .HREADYOUT0   (flash_hreadyout),
    .HRESP0       (flash_hresp),
    .HRDATA0      (flash_hrdata),
    .HSEL1        (sram_hsel),       // Input Port 1
    .HREADYOUT1   (sram_hreadyout),
    .HRESP1       (sram_hresp),
    .HRDATA1      (sram_hrdata),
    .HSEL2        (boot_hsel),       // Input Port 2
    .HREADYOUT2   (boot_hreadyout),
    .HRESP2       (boot_hresp),
    .HRDATA2      (boot_hrdata),
    .HSEL3        (defslv_hsel),     // Input Port 3
    .HREADYOUT3   (defslv_hreadyout),
    .HRESP3       (defslv_hresp),
    .HRDATA3      (defslv_hrdata),
    .HSEL4        (apbsys_hsel),     // Input Port 4
    .HREADYOUT4   (apbsys_hreadyout),
    .HRESP4       (apbsys_hresp),
    .HRDATA4      (apbsys_hrdata),
    .HSEL5        (gpio0_hsel),      // Input Port 5
    .HREADYOUT5   (gpio0_hreadyout),
    .HRESP5       (gpio0_hresp),
    .HRDATA5      (gpio0_hrdata),
    .HSEL6        (gpio1_hsel),      // Input Port 6
    .HREADYOUT6   (gpio1_hreadyout),
    .HRESP6       (gpio1_hresp),
    .HRDATA6      (gpio1_hrdata),
    .HSEL7        (sysctrl_hsel),    // Input Port 7
    .HREADYOUT7   (sysctrl_hreadyout),
    .HRESP7       (sysctrl_hresp),
    .HRDATA7      (sysctrl_hrdata),
    .HSEL8        (sysrom_hsel),     // Input Port 8
    .HREADYOUT8   (sysrom_hreadyout),
    .HRESP8       (sysrom_hresp),
    .HRDATA8      (sysrom_hrdata),
    .HSEL9        (HSELMTB),         // Input Port 9
    .HREADYOUT9   (HREADYOUTMTB),
    .HRESP9       (HRESPMTB),
    .HRDATA9      (HRDATAMTB),

    .HREADYOUT    (sys_hreadyout),   // Outputs
    .HRESP        (sys_hresp),
    .HRDATA       (sys_hrdata)
  );

  // Default slave
  cmsdk_ahb_default_slave u_ahb_default_slave_1 (
    .HCLK         (HCLKSYS),
    .HRESETn      (HRESETn),
    .HSEL         (defslv_hsel),
    .HTRANS       (sys_htrans),
    .HREADY       (sys_hready),
    .HREADYOUT    (defslv_hreadyout),
    .HRESP        (defslv_hresp)
  );

  assign   defslv_hrdata = 32'h00000000; // Default slave do not have read data


  // -------------------------------
  // System ROM Table
  // -------------------------------
  cmsdk_ahb_cs_rom_table
   #(//.JEPID                             (),
     //.JEPCONTINUATION                   (),
     //.PARTNUMBER                        (),
     //.REVISION                          (),
     .BASE              (BASEADDR_SYSROMTABLE),
     // Entry 0 = Cortex-M0+ Processor
     .ENTRY0BASEADDR    (32'hE00FF000),
     .ENTRY0PRESENT     (1'b1),
     // Entry 1 = CoreSight MTB-M0+
     .ENTRY1BASEADDR    (32'hF0200000),
     .ENTRY1PRESENT     (0))
    u_system_rom_table
    (//Outputs
     .HRDATA                            (sysrom_hrdata[31:0]),
     .HREADYOUT                         (sysrom_hreadyout),
     .HRESP                             (sysrom_hresp),
     //Inputs
     .HCLK                              (HCLKSYS),
     .HSEL                              (sysrom_hsel),
     .HADDR                             (sys_haddr[31:0]),
     .HBURST                            (sys_hburst[2:0]),
     .HMASTLOCK                         (sys_hmastlock),
     .HPROT                             (sys_hprot[3:0]),
     .HSIZE                             (sys_hsize[2:0]),
     .HTRANS                            (sys_htrans[1:0]),
     .HWDATA                            (sys_hwdata[31:0]),
     .HWRITE                            (sys_hwrite),
     .HREADY                            (sys_hready),
     .ECOREVNUM                         (4'h0));

  // -------------------------------
  // Peripherals
  // -------------------------------

  cmsdk_mcu_sysctrl #(.BE (BE))
    u_cmsdk_mcu_sysctrl
  (
   // AHB Inputs
    .HCLK         (HCLKSYS),
    .HRESETn      (HRESETn),
    .FCLK         (FCLK),
    .PORESETn     (PORESETn),
    .HSEL         (sysctrl_hsel),
    .HREADY       (sys_hready),
    .HTRANS       (sys_htrans),
    .HSIZE        (sys_hsize),
    .HWRITE       (sys_hwrite),
    .HADDR        (sys_haddr[11:0]),
    .HWDATA       (sys_hwdata),
   // AHB Outputs
    .HREADYOUT    (sysctrl_hreadyout),
    .HRESP        (sysctrl_hresp),
    .HRDATA       (sysctrl_hrdata),
   // Reset information
    .SYSRESETREQ  (SYSRESETREQ),
    .WDOGRESETREQ (WDOGRESETREQ),
    .LOCKUP       (LOCKUP),
    // Engineering-change-order revision bits
    .ECOREVNUM    (4'h0),
   // System control signals
    .REMAP        (remap_ctrl),
    .PMUENABLE    (PMUENABLE),
    .LOCKUPRESET  (LOCKUPRESET)
   );

`ifndef ARM_CMSDK_INCLUDE_IOP

  // GPIO is driven from the AHB
  cmsdk_ahb_gpio #(
    .ALTERNATE_FUNC_MASK     (16'hFFFF), // Permit pin muxing for Port #0
    .ALTERNATE_FUNC_DEFAULT  (16'h0000), // All pins default to GPIO
    .BE                      (BE)
    )
    u_ahb_gpio_0  (
   // AHB Inputs
    .HCLK         (HCLKSYS),
    .HRESETn      (HRESETn),
    .FCLK         (FCLK),
    .HSEL         (gpio0_hsel),
    .HREADY       (sys_hready),
    .HTRANS       (sys_htrans),
    .HSIZE        (sys_hsize),
    .HWRITE       (sys_hwrite),
    .HADDR        (sys_haddr[11:0]),
    .HWDATA       (sys_hwdata),
   // AHB Outputs
    .HREADYOUT    (gpio0_hreadyout),
    .HRESP        (gpio0_hresp),
    .HRDATA       (gpio0_hrdata),

    .ECOREVNUM    (4'h0),// Engineering-change-order revision bits

    .PORTIN       (p0_in),   // GPIO Interface inputs
    .PORTOUT      (p0_out),  // GPIO Interface outputs
    .PORTEN       (p0_outen),
    .PORTFUNC     (p0_altfunc), // Alternate function control

    .GPIOINT      (gpio0_intr[15:0]),  // Interrupt outputs
    .COMBINT      (gpio0_combintr)
  );

  cmsdk_ahb_gpio #(
    .ALTERNATE_FUNC_MASK     (16'hFFFF), // Permit pin muxing for Port #1
    .ALTERNATE_FUNC_DEFAULT  (16'h0000), // All pins default to GPIO
    .BE                      (BE)
    )
    u_ahb_gpio_1  (
   // AHB Inputs
    .HCLK         (HCLKSYS),
    .HRESETn      (HRESETn),
    .FCLK         (FCLK),
    .HSEL         (gpio1_hsel),
    .HREADY       (sys_hready),
    .HTRANS       (sys_htrans),
    .HSIZE        (sys_hsize),
    .HWRITE       (sys_hwrite),
    .HADDR        (sys_haddr[11:0]),
    .HWDATA       (sys_hwdata),
   // AHB Outputs
    .HREADYOUT    (gpio1_hreadyout),
    .HRESP        (gpio1_hresp),
    .HRDATA       (gpio1_hrdata),

    .ECOREVNUM    (4'h0),// Engineering-change-order revision bits

    .PORTIN       (p1_in),   // GPIO Interface inputs
    .PORTOUT      (p1_out),  // GPIO Interface outputs
    .PORTEN       (p1_outen),
    .PORTFUNC     (p1_altfunc), // Alternate function control

    .GPIOINT      (),  // Interrupt outputs
    .COMBINT      (gpio1_combintr)
  );

  assign IOMATCH = 1'b0;
  assign IORDATA = {32{(1'b0)}};

`endif

  // APB subsystem for timers, UARTs
  cmsdk_apb_subsystem_m0ds #(
    .APB_EXT_PORT12_ENABLE   (0),
    .APB_EXT_PORT13_ENABLE   (0),
    .APB_EXT_PORT14_ENABLE   (0),
    .APB_EXT_PORT15_ENABLE   (INCLUDE_DMA),
    .INCLUDE_IRQ_SYNCHRONIZER(0),
    .INCLUDE_APB_TEST_SLAVE  (1),
    .INCLUDE_APB_TIMER0      (1),  // Include simple timer #0
    .INCLUDE_APB_TIMER1      (1),  // Include simple timer #1
    .INCLUDE_APB_DUALTIMER0  (1),  // Include dual timer module
    .INCLUDE_APB_UART0       (1),  // Include simple UART #0
    .INCLUDE_APB_UART1       (1),  // Include simple UART #1
    .INCLUDE_APB_UART2       (1),  // Include simple UART #2.
    .INCLUDE_APB_UART3       (1),  // Include simple UART #3.
    .INCLUDE_APB_UART4       (1),  // Include simple UART #4.
    .INCLUDE_APB_WATCHDOG    (1),  // Include APB watchdog module
    .BE                      (BE)
     )
  u_apb_subsystem(

  // AHB interface for AHB to APB bridge
    .HCLK          (HCLKSYS),
    .HRESETn       (HRESETn),

    .HSEL          (apbsys_hsel),
    .HADDR         (sys_haddr[15:0]),
    .HTRANS        (sys_htrans[1:0]),
    .HWRITE        (sys_hwrite),
    .HSIZE         (sys_hsize),
    .HPROT         (sys_hprot),
    .HREADY        (sys_hready),
    .HWDATA        (sys_hwdata[31:0]),

    .HREADYOUT     (apbsys_hreadyout),
    .HRDATA        (apbsys_hrdata),
    .HRESP         (apbsys_hresp),

  // APB clock and reset
    .PCLK          (PCLK),
    .PCLKG         (PCLKG),
    .PCLKEN        (PCLKEN),
    .PRESETn       (PRESETn),

  // APB extension ports
    .PADDR         (exp_paddr[11:0]),
    .PWRITE        (exp_pwrite),
    .PWDATA        (exp_pwdata[31:0]),
    .PENABLE       (exp_penable),

    .ext12_psel    (),
    .ext13_psel    (),
    .ext14_psel    (),
    .ext15_psel    (dmac_psel),

  // Input from APB devices on APB expansion ports
    .ext12_prdata  (32'h00000000),
    .ext12_pready  (1'b1),
    .ext12_pslverr (1'b0),

    .ext13_prdata  (32'h00000000),
    .ext13_pready  (1'b1),
    .ext13_pslverr (1'b0),

    .ext14_prdata  (32'h00000000),
    .ext14_pready  (1'b1),
    .ext14_pslverr (1'b0),

    .ext15_prdata  (dmac_prdata),
    .ext15_pready  (dmac_pready),
    .ext15_pslverr (dmac_pslverr),

    .APBACTIVE     (APBACTIVE),  // Status Output for clock gating

  // Peripherals
    // UART
    .uart0_rxd     (uart0_rxd),
    .uart0_txd     (uart0_txd),
    .uart0_txen    (uart0_txen),

    .uart1_rxd     (uart1_rxd),
    .uart1_txd     (uart1_txd),
    .uart1_txen    (uart1_txen),

    .uart2_rxd     (uart2_rxd),
    .uart2_txd     (uart2_txd),
    .uart2_txen    (uart2_txen),

    // New for Arduino board
    .uart3_rxd     (uart3_rxd),
    .uart3_txd     (uart3_txd),
    .uart3_txen    (uart3_txen),

    .uart4_rxd     (uart4_rxd),
    .uart4_txd     (uart4_txd),
    .uart4_txen    (uart4_txen),

    // Timer
    .timer0_extin  (timer0_extin),
    .timer1_extin  (timer1_extin),

  // Interrupt outputs
    .apbsubsys_interrupt (apbsubsys_interrupt),
    .watchdog_interrupt  (watchdog_interrupt),
   // reset output
    .watchdog_reset      (WDOGRESETREQ)
  );
  
  // Connect system bus to external
  assign   HADDR  = sys_haddr;
  assign   HTRANS = sys_htrans;
  assign   HSIZE  = sys_hsize;
  assign   HWRITE = sys_hwrite;
  assign   HWDATA = sys_hwdata;
  assign   HREADY = sys_hready;

  // -------------------------------
  // DMA Controller
  // -------------------------------

  // DMA interface not used in this example system
  wire  [DMA_CHANNEL_NUM-1:0] dma230_tie0;  // tie off signal.

  assign dma230_tie0 = {DMA_CHANNEL_NUM{1'b0}};

  // DMA done per channel
  wire  [DMA_CHANNEL_NUM-1:0] dma230_done_ch;

  generate if (INCLUDE_DMA != 0) begin : gen_pl230_udma
  // DMA controller present
  pl230_udma u_pl230_udma (
  // Clock and Reset
    .hclk          (HCLKSYS),
    .hresetn       (HRESETn),
  // DMA Control
    .dma_req       (dma230_tie0),
    .dma_sreq      (dma230_tie0),
    .dma_waitonreq (dma230_tie0),
    .dma_stall     (1'b0),
    .dma_active    (),
    .dma_done      (dma230_done_ch),
    .dma_err       (dma_err),
  // AHB-Lite Master Interface
    .hready        (dmac_hready),
    .hresp         (dmac_hresp),
    .hrdata        (dmac_hrdata),
    .htrans        (dmac_htrans),
    .hwrite        (dmac_hwrite),
    .haddr         (dmac_haddr),
    .hsize         (dmac_hsize),
    .hburst        (dmac_hburst),
    .hmastlock     (dmac_hmastlock),
    .hprot         (dmac_hprot),
    .hwdata        (dmac_hwdata),
  // APB Slave Interface
    .pclken        (PCLKEN),
    .psel          (dmac_psel),
    .pen           (exp_penable),
    .pwrite        (exp_pwrite),
    .paddr         (exp_paddr[11:0]),
    .pwdata        (exp_pwdata[31:0]),
    .prdata        (dmac_prdata)
  );

    assign dmac_pready  = 1'b1;
    assign dmac_pslverr = 1'b0;
    assign DMA_DONE     = |dma230_done_ch; // OR all the DMA done together

  end else begin : gen_no_pl230_udma
    // DMA controller not present
    assign dmac_htrans = 2'b00;
    assign dmac_hwrite = 1'b0;
    assign dmac_haddr  = 32'h00000000;
    assign dmac_hsize  = 3'b000;
    assign dmac_hburst = 3'b000;
    assign dmac_hmastlock = 1'b0;
    assign dmac_hprot  = 4'b0000;
    assign dmac_hwdata = 32'h00000000;

    assign DMA_DONE = 1'b0;
    assign dma_err  = 1'b0;
    assign dmac_pready  = 1'b1;
    assign dmac_pslverr = 1'b0;
    assign dmac_prdata  = 32'h00000000;
    assign dma230_done_ch = {DMA_CHANNEL_NUM{1'b0}};

  end endgenerate

  // -------------------------------
  // Interrupt assignment
  // -------------------------------

  assign intnmi_cm0        = watchdog_interrupt;
  assign intisr_cm0[ 5: 0] = apbsubsys_interrupt[ 5: 0];
  assign intisr_cm0[ 6]    = apbsubsys_interrupt[ 6]   | gpio0_combintr | gpio2_interrupt;
  assign intisr_cm0[ 7]    = apbsubsys_interrupt[ 7]   | gpio1_combintr | gpio3_interrupt;
  assign intisr_cm0[10: 8] = apbsubsys_interrupt[10: 8];
  assign intisr_cm0[11]    = spi_interrupt;
  assign intisr_cm0[12]    = |apbsubsys_interrupt[15: 12] | apbsubsys_interrupt[18]; // UART Overflow interrupts
  assign intisr_cm0[13]    = eth_interrupt; // V2M-MPS2 Ethernet
  assign intisr_cm0[14]    = i2s_interrupt; // V2M-MPS2 Ethernet
  assign intisr_cm0[15]    =                           | DMA_DONE | dma_err | ts_interrupt;
  assign intisr_cm0[16]    = apbsubsys_interrupt[16]   | gpio0_intr[0]; // UART4 Rx
  assign intisr_cm0[17]    = apbsubsys_interrupt[17]   | gpio0_intr[1]; // UART4 Tx
  assign intisr_cm0[18]    =                             gpio0_intr[2];
  assign intisr_cm0[31:19] = apbsubsys_interrupt[31:19]| gpio0_intr[15:3];
  // End of modified IRQ assignment

  // -------------------------------
  // SysTick signals
  // -------------------------------
  cmsdk_mcu_stclkctrl
   #(.DIV_RATIO (18'd01000))
   u_cmsdk_mcu_stclkctrl (
    .FCLK      (FCLK),
    .SYSRESETn (HRESETn),

    .STCLKEN   (STCLKEN),
    .STCALIB   (STCALIB)
    );

 // --------------------------------------------------------------------------------
 // Verification components
 // --------------------------------------------------------------------------------
`ifdef ARM_AHB_ASSERT_ON
  // AHB protocol checker for process bus
  AhbLitePC #(
      .ADDR_WIDTH                           (32),
      .DATA_WIDTH                           (32),
      .BIG_ENDIAN                           (BE),
      .MASTER_TO_INTERCONNECT               ( 1),
      .EARLY_BURST_TERMINATION              ( 0),
      // Property type (0=prove, 1=assume, 2=ignore)
      .MASTER_REQUIREMENT_PROPTYPE          ( 0),
      .MASTER_RECOMMENDATION_PROPTYPE       ( 0),
      .MASTER_XCHECK_PROPTYPE               ( 0),
      .SLAVE_REQUIREMENT_PROPTYPE           ( 0),
      .SLAVE_RECOMMENDATION_PROPTYPE        ( 0),
      .SLAVE_XCHECK_PROPTYPE                ( 0),
      .INTERCONNECT_REQUIREMENT_PROPTYPE    ( 0),
      .INTERCONNECT_RECOMMENDATION_PROPTYPE ( 0),
      .INTERCONNECT_XCHECK_PROPTYPE         ( 0)
   ) u_AhbLitePC_processor
  (
   // clock
   .HCLK         (HCLKSYS),

   // active low reset
   .HRESETn      (HRESETn),

   // Main Master signals
   .HADDR        (cm0_haddr),
   .HTRANS       (cm0_htrans),
   .HWRITE       (cm0_hwrite),
   .HSIZE        (cm0_hsize),
   .HBURST       (cm0_hburst),
   .HPROT        (cm0_hprot),
   .HWDATA       (cm0_hwdata),

   // Main Decoder signals
   .HSELx        (1'bx), // Ignored for this instance

   // Main Slave signals
   .HRDATA       (cm0_hrdata),
   .HREADY       (cm0_hready),
   .HREADYOUT    (1'bx),  // Ignored for this instance
   .HRESP        (cm0_hresp),
   .HMASTLOCK    (cm0_hmastlock)
   );

  generate if (INCLUDE_DMA != 0) begin : gen_ahblite_with_dma
  // AHB protocol checker for DMA bus
  AhbLitePC #(
      .ADDR_WIDTH                           (32),
      .DATA_WIDTH                           (32),
      .BIG_ENDIAN                           (BE),
      .MASTER_TO_INTERCONNECT               ( 1),
      .EARLY_BURST_TERMINATION              ( 0),
      // Property type (0=prove, 1=assume, 2=ignore)
      .MASTER_REQUIREMENT_PROPTYPE          ( 0),
      .MASTER_RECOMMENDATION_PROPTYPE       ( 0),
      .MASTER_XCHECK_PROPTYPE               ( 0),
      .SLAVE_REQUIREMENT_PROPTYPE           ( 0),
      .SLAVE_RECOMMENDATION_PROPTYPE        ( 0),
      .SLAVE_XCHECK_PROPTYPE                ( 0),
      .INTERCONNECT_REQUIREMENT_PROPTYPE    ( 0),
      .INTERCONNECT_RECOMMENDATION_PROPTYPE ( 0),
      .INTERCONNECT_XCHECK_PROPTYPE         ( 0)
   ) u_AhbLitePC_dma
  (
   // clock
   .HCLK         (HCLKSYS),

   // active low reset
   .HRESETn      (HRESETn),

   // Main Master signals
   .HADDR        (dmac_haddr),
   .HTRANS       (dmac_htrans),
   .HWRITE       (dmac_hwrite),
   .HSIZE        (dmac_hsize),
   .HBURST       (dmac_hburst),
   .HPROT        (dmac_hprot),
   .HWDATA       (dmac_hwdata),

   // Main Decoder signals
   .HSELx        (1'bx), // Ignored for this instance

   // Main Slave signals
   .HRDATA       (dmac_hrdata),
   .HREADY       (dmac_hready),
   .HREADYOUT    (1'bx), // Ignored for this instance
   .HRESP        (dmac_hresp),

   .HMASTLOCK    (dmac_hmastlock)
   );

  // AHB protocol checker for the out bus from bus multiplexer
   // AHB-Lite slave interface
   AhbLitePC #(
      .ADDR_WIDTH                           (32),
      .DATA_WIDTH                           (32),
      .BIG_ENDIAN                           (BE),
      .MASTER_TO_INTERCONNECT               ( 1),
      .EARLY_BURST_TERMINATION              ( 0),
      // Property type (0=prove, 1=assume, 2=ignore)
      .MASTER_REQUIREMENT_PROPTYPE          ( 0),
      .MASTER_RECOMMENDATION_PROPTYPE       ( 0),
      .MASTER_XCHECK_PROPTYPE               ( 0),
      .SLAVE_REQUIREMENT_PROPTYPE           ( 0),
      .SLAVE_RECOMMENDATION_PROPTYPE        ( 0),
      .SLAVE_XCHECK_PROPTYPE                ( 0),
      .INTERCONNECT_REQUIREMENT_PROPTYPE    ( 0),
      .INTERCONNECT_RECOMMENDATION_PROPTYPE ( 0),
      .INTERCONNECT_XCHECK_PROPTYPE         ( 0)
   ) u_AhbLitePC_sys
  (
   // clock
   .HCLK         (HCLKSYS),

   // active low reset
   .HRESETn      (HRESETn),

   // Main Master signals
   .HADDR        (sys_haddr),
   .HTRANS       (sys_htrans),
   .HWRITE       (sys_hwrite),
   .HSIZE        (sys_hsize),
   .HBURST       (sys_hburst),
   .HPROT        (sys_hprot),
   .HWDATA       (sys_hwdata),

   // Main Decoder signals
   .HSELx        (1'bx), // Ignored for this instance

   // Main Slave signals
   .HRDATA       (sys_hrdata),
   .HREADY       (sys_hready),
   .HREADYOUT    (1'bx), // Ignored for this instance
   .HRESP        (sys_hresp),

   .HMASTLOCK    (dmac_hmastlock)
   );

  end endgenerate

`endif

`ifdef ARM_CMSDK_INCLUDE_IOP
`ifdef ARM_IOP_ASSERT_ON
  // IO Port protocol checker for GPIO

  cm0p_ioppc
   #(.DRIVEMASTER        (1'b0),
     .DRIVESLAVE         (1'b0))
     u_cm0p_ioppc
  (
   // Inputs
   .IOCLK                               (HCLKSYS),
   .IORESETn                            (HRESETn),
   .IOCHECK                             (IOCHECK),
   .IOMATCH                             (IOMATCH),
   .IOTRANS                             (IOTRANS),
   .IOADDR                              (IOADDR),
   .IOSIZE                              (IOSIZE),
   .IOWRITE                             (IOWRITE),
   .IOPRIV                              (IOPRIV),
   .IOMASTER                            (IOMASTER),
   .IORDATA                             (IORDATA),
   .IOWDATA                             (IOWDATA));
`endif
`endif

  // Lint checks, tie off all the unused signals
  wire              unused;
  assign            unused = SPECHTRANS | CODENSEQ | (|CODEHINTDE) | TXEV | (|WICSENSE) | HALTED | sys_hmaster; 

endmodule
