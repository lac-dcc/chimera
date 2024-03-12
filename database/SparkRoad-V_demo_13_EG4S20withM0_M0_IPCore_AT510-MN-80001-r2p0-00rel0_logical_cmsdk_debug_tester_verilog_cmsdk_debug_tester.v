//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-04-09 09:25:32 +0100 (Tue, 09 Apr 2013) $
//
//      Revision            : $Revision: 243294 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//      Debug tester for testing the debug feature in the processor
//-----------------------------------------------------------------------------
// This block is used to control the DAP in the MCU by wiggling the JTAG/SW
// signals appropriately.
// The most significant 8 bits of GPIO P0 from the MCU is used to program the
// "debug tester" system which consists of a CM0PMTBINTEGRATION,
// CORTEXM0INTEGRATION, CORTEXM3INTEGRATION or CORTEXM4INTEGRATION timing
// wrapper, memory and IO. This arrangement enables the JTAG/SW signals to be
// controlled even when the processor (in the MCU) is sleeping.
//
// This block instantiates the following sub modules:
//  o u_cortex_m0_int    - Timing Wrapper - CORTEXM0INTEGRATION
//  o u_cm0pmtb_int      - Timing Wrapper - CM0PMTBINTEGRATION
//  o u_int_imp          - Timing Wrapper - CORTEXM3INTEGRATION/CORTEXM4INTEGRATION
//  o u_rom              - AHB ROM Memory
//  o u_ram              - AHB RAM Memory
//  o u_ahb_interconnect - AHB Bus Interconnect Block
//  o u_ahb_def_slv      - AHB Default Slave
//  o u_gpio_0           - AHB GPIO (Debug Tester Functionality)
//  o u_gpio_1           - AHB GPIO (Message Printing)
//-----------------------------------------------------------------------------

`ifdef CORTEX_M3
`define ARM_CMSDK_DEBUG_TESTER_M3M4_INTEGRATION
`define ARM_CMSDK_DEBUG_TESTER_TRACE
`define ARM_CMSDK_DEBUG_TESTER_CODE_MUX
`endif

`ifdef CORTEX_M4
`define ARM_CMSDK_DEBUG_TESTER_M3M4_INTEGRATION
`define ARM_CMSDK_DEBUG_TESTER_TRACE
`define ARM_CMSDK_DEBUG_TESTER_CODE_MUX
`endif


module cmsdk_debug_tester #(
   parameter CLKGATE_PRESENT  = 1,
   parameter BE               = 0,
   parameter ROM_MEMFILE      = "",

   parameter ROM_ADDRWIDTH    = 17, // 128KB
   parameter ROM_MEMBASE      = 32'h00000000,
   parameter ROM_MEMTOP       = 32'h0001FFFF,

   parameter RAM_ADDRWIDTH    = 14, // 16KB
   parameter RAM_MEMBASE      = 32'h20000000,
   parameter RAM_MEMTOP       = 32'h20003FFF)

  (input  wire       CLK,
   input  wire       PORESETn,

   // Command Interface
   input  wire [5:0] DBGCMD,
   output wire       DBGRUNNING,
   output wire       DBGERROR,

   // Trace Interface
   input  wire       TRACECLK,
   input  wire[3:0]  TRACEDATA,
   input  wire       SWV,

   // Debug Interface
   input  wire       TDO,
   output wire       nTRST,
   output wire       SWCLKTCK,
   output wire       TDI,
   inout  wire       SWDIOTMS
   );

//-----------------------------------------------------------------------------
// Signal declarations
//-----------------------------------------------------------------------------

   wire [31:0]      haddr;
   wire [2:0]       hburst;
   wire [3:0]       hprot;
   wire [2:0]       hsize;
   wire [1:0]       htrans;
   wire [31:0]      hwdata;
   wire             hwrite;
   wire [31:0]      hrdata_mux, hrdata_code, hrdata_rom, hrdata_ram, hrdata_gpio_0, hrdata_gpio_1, hrdata_tcb;
   wire             hresp_mux, hresp_code, hresp_rom, hresp_ram, hresp_gpio_0, hresp_gpio_1, hresp_tcb, hresp_def_slv;
   wire             hready_mux, hready_out_code, hready_out_rom, hready_out_ram, hready_out_gpio_0, hready_out_gpio_1, hready_out_tcb, hready_out_def_slv;
   wire             hsel_code, hsel_rom, hsel_ram, hsel_gpio_0, hsel_gpio_1, hsel_tcb, hsel_def_slv, hsel_def_slv_i;

   wire [31:0]      haddr_code;
   wire [1:0]       htrans_code;
   wire [2:0]       hsize_code;
   wire             hready_code;

   wire [15:0]      gpio_0_out;
   wire [15:0]      gpio_0_in;
   wire [15:0]      gpio_0_en;
   wire [15:0]      extgpio;

   wire [15:0]      gpio_1_out;
   wire [15:0]      gpio_1_in;
   wire [15:0]      gpio_1_en;

`ifdef ARM_CMSDK_DEBUG_TESTER_CODE_MUX
   // Cortex-M3/M4 to Code Mux
   wire [31:0]      cm_i_haddr, cm_d_haddr;
   wire [2:0]       cm_i_hburst, cm_d_hburst;
   wire [3:0]       cm_i_hprot, cm_d_hprot;
   wire [2:0]       cm_i_hsize, cm_d_hsize;
   wire [1:0]       cm_i_htrans, cm_d_htrans;
   wire [31:0]      cm_d_hwdata;
   wire             cm_d_hwrite;
   wire [31:0]      cm_i_hrdata, cm_d_hrdata;
   wire             cm_i_hresp, cm_d_hresp;
   wire             cm_i_hready, cm_d_hready;
`endif


//-----------------------------------------------------------------------------
// Processor
//-----------------------------------------------------------------------------


`ifdef CORTEX_M0 // Cortex-M0
//-----------------------------------------------------------------------------
// CORTEXM0INTEGRATION
//-----------------------------------------------------------------------------

  CORTEXM0INTEGRATION
            #(.ACG       (CLKGATE_PRESENT), // Architectural clock gating
              .BE        (BE),              // big-endian
              .BKPT      (4),               // Number of breakpoint comparators
              .DBG       (0),               // Debug configuration
              .JTAGnSW   (1),               // Debug port interface: JTAGnSW
              .NUMIRQ    (32),              // NUMIRQ
              .RAR       (0),               // RESET_ALL_REGS
              .SMUL      (0),               // Multiplier configuration
              .SYST      (1),               // SysTick
              .WIC       (0),               // Wake-up interrupt controller support
              .WICLINES  (34),              // Supported WIC lines
              .WPT       (2))               // Number of DWT comparators

   u_cortex_m0_int (
  // System inputs
  .FCLK          (CLK),  // FCLK
  .SCLK          (CLK),  // SCLK generated from PMU
  .HCLK          (CLK),  // HCLK generated from PMU
  .DCLK          (CLK),  // DCLK generated from PMU
  .PORESETn      (PORESETn),
  .HRESETn       (PORESETn),
  .DBGRESETn     (PORESETn),
  .RSTBYPASS     (1'b0),
  .SE            (1'b0),

  // Power management inputs
  .SLEEPHOLDREQn (1'b1),
  .WICENREQ      (1'b0),
  .CDBGPWRUPACK  (1'b0),

  // Power management outputs
  .SLEEPHOLDACKn (),
  .WICENACK      (),
  .CDBGPWRUPREQ  (),

  .WAKEUP        (),
  .WICSENSE      (),
  .GATEHCLK      (),
  .SYSRESETREQ   (),

  // System bus
  .HADDR         (haddr[31:0]),
  .HTRANS        (htrans[1:0]),
  .HSIZE         (hsize[2:0]),
  .HBURST        (hburst[2:0]),
  .HPROT         (hprot[3:0]),
  .HMASTER       (),
  .HMASTLOCK     (),
  .HWRITE        (hwrite),
  .HWDATA        (hwdata[31:0]),
  .HRDATA        (hrdata_mux[31:0]),
  .HREADY        (hready_mux),
  .HRESP         (hresp_mux),

  .CODEHINTDE    (),
  .SPECHTRANS    (),
  .CODENSEQ      (),

  // Interrupts
  .IRQ           ({32{1'b0}}),
  .NMI           (1'b0),
  .IRQLATENCY    (8'h00),

  .ECOREVNUM     ({28{1'b0}}),

  // Systick
  .STCLKEN       (1'b0),
  .STCALIB       ({26{1'b0}}),

  // Debug - JTAG or Serial wire
  // inputs
  .nTRST         (1'b1),
  .SWDITMS       (1'b0),
  .SWCLKTCK      (1'b0),
  .TDI           (1'b0),
     // outputs
  .TDO           (),
  .nTDOEN        (),
  .SWDO          (),
  .SWDOEN        (),

  .DBGRESTART    (1'b0),// multi-core synchronous restart from halt
  .DBGRESTARTED  (),

  // Event communication
  .TXEV          (),
  .RXEV          (1'b0),
  .EDBGRQ        (1'b0), // multi-core synchronous halt request
  // Status output
  .HALTED        (),
  .LOCKUP        (),
  .SLEEPING      (),
  .SLEEPDEEP     ()
  );

`endif

`ifdef CORTEX_M0PLUS // Cortex-M0+
//-----------------------------------------------------------------------------
// CM0PMTBINTEGRATION
//-----------------------------------------------------------------------------

  // Cortex-M0+ & CoreSight MTB M0+ integration level
  CM0PMTBINTEGRATION
            #(.ACG       (CLKGATE_PRESENT), // Architectural clock gating
              .BE        (BE),              // Big-endian
              .BKPT      (4),               // Number of breakpoint comparators
              .DBG       (0),               // Debug configuration
              .HALTEV    (0),               // Debug halt event
              .HWF       (0),               // Half-Word Fetching
              .IOP       (0),               // IO Port interface
              .IRQDIS    (32'h00000000),    // Interrupt Disable
              .MPU       (0),               // MPU with 8 regions or none
              .NUMIRQ    (32),              // Number of Interrupts
              .RAR       (0),               // Reset All Registers
              .SMUL      (0),               // Multiplier configuration
              .SYST      (1),               // SysTick
              .USER      (0),               // User/Privilege modes
              .VTOR      (0),               // Vector Table Offset support
              .WIC       (0),               // Wake-up interrupt controller support
              .WICLINES  (34),              // Supported WIC lines
              .WPT       (2),               // Number of DWT comparators
              .BASEADDR  (32'hE00FF003),
              .JTAGnSW   (1),               // Debug port interface: JTAGnSW
              .SWMD      (0),               // For Serial Wire support protocol 2 & multi-drop
              .TARGETID  (32'h00000001),
              .AWIDTH    (32),
              .MTB       (0))               // Disable Instruction Trace
    u_cm0pmtb_int
  (

   // System inputs
   .FCLK          (CLK),  // FCLK
   .SCLK          (CLK),  // SCLK generated from PMU
   .HCLK          (CLK),  // HCLK generated from PMU
   .DCLK          (CLK),  // DCLK generated from PMU
   .PORESETn      (PORESETn),
   .HRESETn       (PORESETn),
   .DBGRESETn     (PORESETn),
   .DFTSE         (1'b0),

   // Power management inputs
   .SLEEPHOLDREQn (1'b1),
   .WICENREQ      (1'b0),
   .CDBGPWRUPACK  (1'b0),

   // Power management outputs
   .SLEEPHOLDACKn (),
   .WICENACK      (),
   .CDBGPWRUPREQ  (),

   .WAKEUP        (),
   .WICSENSE      (),
   .GATEHCLK      (),
   .SYSRESETREQ   (),

   // System bus
   .HADDR         (haddr[31:0]),
   .HTRANS        (htrans[1:0]),
   .HSIZE         (hsize[2:0]),
   .HBURST        (hburst[2:0]),
   .HPROT         (hprot[3:0]),
   .HMASTER       (),
   .HMASTLOCK     (),
   .HWRITE        (hwrite),
   .HWDATA        (hwdata[31:0]),
   .HRDATA        (hrdata_mux[31:0]),
   .HREADY        (hready_mux),
   .HRESP         (hresp_mux),

   // IO Port bus
   .IOTRANS       (),
   .IOWRITE       (),
   .IOCHECK       (),
   .IOADDR        (),
   .IOSIZE        (),
   .IOMASTER      (),
   .IOPRIV        (),
   .IOWDATA       (),
   .IOMATCH       (1'b0),
   .IORDATA       ({32{1'b0}}),

   .CODEHINT      (),
   .SPECHTRANS    (),
   .CODENSEQ      (),

   // Interrupts
   .IRQ           ({32{1'b0}}),
   .NMI           (1'b0),
   .IRQLATENCY    (8'h00),

   .ECOREVNUM     (32'h0),

   // Systick
   .STCLKEN       (1'b0),
   .STCALIB       ({26{1'b0}}),

   // Debug - JTAG or Serial wire
   // inputs
   .nTRST         (1'b1),
   .SWDITMS       (1'b0),
   .SWCLKTCK      (1'b0),
   .TDI           (1'b0),

   // outputs
   .TDO           (),
   .nTDOEN        (),
   .SWDO          (),
   .SWDOEN        (),

   .DBGRESTART    (1'b0),// multi-core synchronous restart from halt
   .DBGRESTARTED  (),

   // Event communication
   .TXEV          (),
   .RXEV          (1'b0),
   .EDBGRQ        (1'b0),

   // Status output
   .HALTED        (),
   .LOCKUP        (),
   .SLEEPING      (),
   .SLEEPDEEP     (),

    // Outputs
   .SHAREABLE     (),
   .HRDATAMTB     (),
   .HREADYOUTMTB  (),
   .HRESPMTB      (),
   .RAMHCLK       (),
   .RAMAD         (),
   .RAMWD         (),
   .RAMCS         (),
   .RAMWE         (),
   .DATAHINT      (),
   .SWDETECT      (),
   .SYSPWRDOWNACK (),
   .DBGPWRDOWNACK (),

   // Inputs
   .SRAMBASEADDR  ({32{1'b0}}),
   .HADDRMTB      ({32{1'b0}}),
   .HPROTMTB      ({4{1'b0}}),
   .HSIZEMTB      ({3{1'b0}}),
   .HTRANSMTB     ({2{1'b0}}),
   .HWDATAMTB     ({32{1'b0}}),
   .HSELRAM       (1'b0),
   .HSELSFR       (1'b0),
   .HWRITEMTB     (hwrite),
   .HREADYMTB     (hready_mux),
   .RAMRD         ({32{1'b0}}),
   .TSTART        (1'b0),
   .TSTOP         (1'b0),
   .NIDEN         (1'b0),
   .DBGEN         (1'b0),
   .INSTANCEID    (4'h0),
   .CPUWAIT       (1'b0),
   .SLVSTALL      (1'b0),
   .DFTRSTDISABLE (1'b0),
   .SYSRETAINn    (1'b1),
   .SYSISOLATEn   (1'b1),
   .SYSPWRDOWN    (1'b0),
   .DBGISOLATEn   (1'b1),
   .DBGPWRDOWN    (1'b0));

`endif

`ifdef ARM_CMSDK_DEBUG_TESTER_M3M4_INTEGRATION
//-----------------------------------------------------------------------------
// CORTEXM INTEGRATION
//-----------------------------------------------------------------------------

  wire   bigendian = (BE!=0) ? 1'b1 : 1'b0;

`ifdef CORTEX_M3
  // Cortex-M3 integration level
  CORTEXM3INTEGRATION #(
`else
  // Cortex-M4 integration level
  CORTEXM4INTEGRATION #(
`endif

     .MPU_PRESENT    ( 0),
     .NUM_IRQ        ( 1),
     .LVL_WIDTH      ( 3),
     .TRACE_LVL      ( 0),
     .DEBUG_LVL      ( 0),
     .JTAG_PRESENT   ( 0),
     .CLKGATE_PRESENT( 0),
     .RESET_ALL_REGS ( 0),
     .BB_PRESENT     ( 0),
     .CONST_AHB_CTRL ( 0),
`ifdef CORTEX_M3
     .OBSERVATION    ( 0),
     .WIC_PRESENT    ( 0),
     .WIC_LINES      ( 3)
     ) uCore (
`else
     .FPU_PRESENT    ( 0),
     .WIC_PRESENT    ( 0),
     .WIC_LINES      ( 3)
     ) u_int_imp (
`endif
  // System inputs
  .FCLK          (CLK),     // FCLK
  .HCLK          (CLK),     // HCLK generated from clock controller
  .PORESETn      (PORESETn),
  .SYSRESETn     (PORESETn),
  .RSTBYPASS     (1'b0),
  .CGBYPASS      (1'b0),
  .SE            (1'b0),

  .BIGEND        (bigendian),
  .FIXMASTERTYPE (1'b0),

  // Power management inputs
  .ISOLATEn      (1'b1),   //active low
  .RETAINn       (1'b1),   //active low

  .SLEEPHOLDREQn (1'b1),   //active low
  .WICENREQ      (1'b0),   //active high

  .CDBGPWRUPACK  (1'b0),

  // Power management outputs
  .SLEEPHOLDACKn (),
  .WICENACK      (),

  .CDBGPWRUPREQ  (),

  .WAKEUP        (),
  .GATEHCLK      (),
  .SYSRESETREQ   (),

  //Logic disable/enable
  .MPUDISABLE    (1'b0),
  .DBGEN         (1'b0), // No debug in debug tester
`ifdef CORTEX_M4
  .FPUDISABLE    (1'b0),
`endif


  // Instruction bus
  .HADDRI        (cm_i_haddr),
  .HTRANSI       (cm_i_htrans),
  .HSIZEI        (cm_i_hsize),
  .HBURSTI       (cm_i_hburst),
  .HPROTI        (cm_i_hprot),
  .MEMATTRI      (),
  .HRDATAI       (cm_i_hrdata),
  .HREADYI       (cm_i_hready),
  .HRESPI        ({1'b0,cm_i_hresp}),
  .IFLUSH        (1'b0),

  // Data bus
  .HADDRD        (cm_d_haddr),
  .HTRANSD       (cm_d_htrans),
  .HSIZED        (cm_d_hsize),
  .HBURSTD       (cm_d_hburst),
  .HPROTD        (cm_d_hprot),
  .MEMATTRD      (),
  .HMASTERD      (),
  .EXREQD        (),
  .HWRITED       (cm_d_hwrite),
  .HWDATAD       (cm_d_hwdata),
  .HRDATAD       (cm_d_hrdata),
  .HREADYD       (cm_d_hready),
  .HRESPD        ({1'b0,cm_d_hresp}),
  .EXRESPD       (1'b0),

  // System bus
  .HADDRS        (haddr),
  .HTRANSS       (htrans),
  .HSIZES        (hsize),
  .HBURSTS       (hburst),
  .HPROTS        (hprot),
  .MEMATTRS      (),
  .HMASTERS      (),
  .HMASTLOCKS    (),
  .EXREQS        (),
  .HWRITES       (hwrite),
  .HWDATAS       (hwdata),
  .HRDATAS       (hrdata_mux),
  .HREADYS       (hready_mux),
  .HRESPS        ({1'b0,hresp_mux}),
  .EXRESPS       (1'b0),

  .BRCHSTAT      (),

  // Interrupts
  .INTISR        ({240{1'b0}}), //(intisr_cm[239:0]),
  .INTNMI        (1'b0),
  .ETMINTNUM     (),
  .ETMINTSTAT    (),
  .CURRPRI       (),
  .AUXFAULT      ({32{1'b0}}),

  // Systick
  .STCLK         (1'b0),
  .STCALIB       ({26{1'b0}}),

  // Debug - JTAG or Serial wire
     // inputs
  .nTRST         (1'b0),
  .SWDITMS       (1'b0),
  .SWCLKTCK      (1'b0),
  .TDI           (1'b0),
     // outputs
  .TDO           (),
  .nTDOEN        (),
  .SWDO          (),
  .SWDOEN        (),
  .JTAGNSW       (),
  // Debug - TPIU
  .TRACECLKIN    (1'b0),
  .TRACECLK      (),
  .TRACEDATA     (),
  .SWV           (),

  .TSVALUEB      ({48{1'b0}}),
  .TSCLKCHANGE   (1'b0),

  .DBGRESTART    (1'b0),
  .DBGRESTARTED  (),

  // Event communication
  .TXEV          (),
  .RXEV          (1'b0),
  .EDBGRQ        (1'b0),
  // Status output
  .HALTED        (),
  .LOCKUP        (),
  .SLEEPING      (),
  .SLEEPDEEP     (),

`ifdef CORTEX_M3
  .INTERNALSTATE (),  // This signal is available on Cortex-M3 only
`else
  .FPIXC         (),  // These signals are available on Cortex-M4 only
  .FPOFC         (),
  .FPUFC         (),
  .FPIOC         (),
  .FPDZC         (),
  .FPIDC         (),
`endif

  //.INTERNALSTATE (),
  .HTMDHADDR     (),
  .HTMDHTRANS    (),
  .HTMDHSIZE     (),
  .HTMDHBURST    (),
  .HTMDHPROT     (),
  .HTMDHWDATA    (),
  .HTMDHWRITE    (),
  .HTMDHRDATA    (),
  .HTMDHREADY    (),
  .HTMDHRESP     ()
  );

`endif


`ifdef ARM_CMSDK_DEBUG_TESTER_CODE_MUX
//-----------------------------------------------------------------------------
// AHB Code MUX for Cortex-M3 and Cortex-M4
//-----------------------------------------------------------------------------
// Instruction and Data accesses are combined before being presented to code
// region. Use example flash_mux. Tie-off signals which are ignored by the ROM.

`ifdef CORTEX_M3
  cm3_flash_mux u_cm3_flash_mux (
`else
  cm4_flash_mux u_cm4_flash_mux (
`endif
    // Common AHB signals
    .HCLK           (CLK),
    .HRESETn        (PORESETn),

    // Input Port 0
    .HADDRS0        (cm_d_haddr),
    .HTRANSS0       (cm_d_htrans),
    .HWRITES0       (cm_d_hwrite),
    .HSIZES0        (cm_d_hsize),
    .HBURSTS0       (cm_d_hburst),
    .HPROTS0        (cm_d_hprot),
    .HWDATAS0       (32'h00000000),
    .HREADYS0       (cm_d_hready),

    // Response signals to Master for Port 0
    .HRDATAS0       (cm_d_hrdata),
    .HREADYOUTS0    (cm_d_hready),
    .HRESPS0        (cm_d_hresp),

    // Input Port 1
    .HADDRS1        (cm_i_haddr),
    .HTRANSS1       (cm_i_htrans),
    .HWRITES1       (1'b0),
    .HSIZES1        (cm_i_hsize),
    .HBURSTS1       (cm_i_hsize),
    .HPROTS1        (cm_i_hprot),
    .HWDATAS1       (32'h00000000),
    .HREADYS1       (cm_i_hready),

    // Response signals to Master for Port 1
    .HRDATAS1       (cm_i_hrdata),
    .HREADYOUTS1    (cm_i_hready),
    .HRESPS1        (cm_i_hresp),

    // Output Port 0
    .HADDRM0        (haddr_code),
    .HTRANSM0       (htrans_code[1:0]),
    .HWRITEM0       (),
    .HSIZEM0        (hsize_code[2:0]),
    .HBURSTM0       (),
    .HPROTM0        (),
    .HWDATAM0       (),
    .HREADYMUXM0    (hready_code),

    // Response signals from Slave for Port 0
    .HRDATAM0       (hrdata_code[31:0]),
    .HREADYOUTM0    (hready_out_code),
    .HRESPM0        (hresp_code)
    );

    assign hsel_code = 1'b1;

`endif


//-----------------------------------------------------------------------------
// AHB Read-Only Memory
//-----------------------------------------------------------------------------

   cmsdk_ahb_rom
     #(.MEM_TYPE                        (1), // Behavioural memory
       .AW                              (ROM_ADDRWIDTH),
       .filename                        (ROM_MEMFILE),
       .WS_N                            (0),
       .WS_S                            (0),
       .BE                              (0)
       )
   u_rom
     (//Outputs
      .HRDATA                           (hrdata_code[31:0]),
      .HREADYOUT                        (hready_out_code),
      .HRESP                            (hresp_code),
      //Inputs
      .HCLK                             (CLK),
      .HRESETn                          (PORESETn),
      .HSEL                             (hsel_code),
      .HADDR                            (haddr_code[ROM_ADDRWIDTH-1:0]),
      .HTRANS                           (htrans_code[1:0]),
      .HSIZE                            (hsize_code[2:0]),
      .HWRITE                           (1'b0),
      .HWDATA                           (32'h00000000),
      .HREADY                           (hready_code));


`ifdef ARM_CMSDK_DEBUG_TESTER_CODE_MUX

   // Map AHB interconnect rom slave port to default slave
   assign hrdata_rom     = 32'h00000000;
   assign hready_out_rom = hready_out_def_slv;
   assign hresp_rom      = hresp_def_slv;

`else

   // Map AHB interconnect rom slave port to AHB ROM

   assign hrdata_rom     = hrdata_code;
   assign hready_out_rom = hready_out_code;
   assign hresp_rom      = hresp_code;

   assign hsel_code      = hsel_rom;
   assign haddr_code     = haddr;
   assign htrans_code    = htrans;
   assign hsize_code     = hsize;
   assign hready_code    = hready_mux;

`endif


//-----------------------------------------------------------------------------
// AHB SRAM Memory
//-----------------------------------------------------------------------------

  cmsdk_ahb_ram
     #(.MEM_TYPE                        (1), // Behavioural memory
       .AW                              (RAM_ADDRWIDTH),
       .filename                        (""),
       .WS_N                            (0),
       .WS_S                            (0)
       )
   u_ram
     (//Outputs
      .HRDATA                           (hrdata_ram[31:0]),
      .HREADYOUT                        (hready_out_ram),
      .HRESP                            (hresp_ram),
      //Inputs
      .HCLK                             (CLK),
      .HRESETn                          (PORESETn),
      .HSEL                             (hsel_ram),
      .HADDR                            (haddr[RAM_ADDRWIDTH-1:0]),
      .HTRANS                           (htrans[1:0]),
      .HSIZE                            (hsize[2:0]),
      .HWRITE                           (hwrite),
      .HWDATA                           (hwdata[31:0]),
      .HREADY                           (hready_mux));


//-----------------------------------------------------------------------------
// AHB Interconnect
//-----------------------------------------------------------------------------

 cmsdk_debug_tester_ahb_interconnect
 u_ahb_interconnect
   (// Outputs
    .HREADY                             (hready_mux),
    .HRESP                              (hresp_mux),
    .HRDATA                             (hrdata_mux[31:0]),
    .HSELS0                             (hsel_def_slv),
    .HSELS1                             (hsel_rom),
    .HSELS2                             (hsel_ram),
    .HSELS3                             (hsel_gpio_0),
    .HSELS4                             (hsel_gpio_1),
    .HSELS5                             (hsel_tcb),
    // Inputs
    .HCLK                               (CLK),
    .HRESETn                            (PORESETn),
    .HADDR                              (haddr[31:0]),
    .HRDATAS0                           (32'h0000_0000),
    .HRDATAS1                           (hrdata_rom[31:0]),
    .HRDATAS2                           (hrdata_ram[31:0]),
    .HRDATAS3                           (hrdata_gpio_0[31:0]),
    .HRDATAS4                           (hrdata_gpio_1[31:0]),
    .HRDATAS5                           (hrdata_tcb[31:0]),
    .HREADYOUTS0                        (hready_out_def_slv),
    .HREADYOUTS1                        (hready_out_rom),
    .HREADYOUTS2                        (hready_out_ram),
    .HREADYOUTS3                        (hready_out_gpio_0),
    .HREADYOUTS4                        (hready_out_gpio_1),
    .HREADYOUTS5                        (hready_out_tcb),
    .HRESPS0                            (hresp_def_slv),
    .HRESPS1                            (hresp_rom),
    .HRESPS2                            (hresp_ram),
    .HRESPS3                            (hresp_gpio_0),
    .HRESPS4                            (hresp_gpio_1),
    .HRESPS5                            (hresp_tcb));


//-----------------------------------------------------------------------------
// AHB Default Slave
//-----------------------------------------------------------------------------

   cmsdk_ahb_default_slave
     u_ahb_def_slv
       (// Outputs
        .HREADYOUT                      (hready_out_def_slv),
        .HRESP                          (hresp_def_slv),
        // Inputs
        .HCLK                           (CLK),
        .HRESETn                        (PORESETn),
        .HSEL                           (hsel_def_slv_i),
        .HTRANS                         (htrans),
        .HREADY                         (hready_mux));


   assign hsel_def_slv_i = hsel_def_slv |
`ifdef ARM_CMSDK_DEBUG_TESTER_CODE_MUX
                           hsel_rom |
`endif
`ifndef ARM_CMSDK_DEBUG_TESTER_TRACE
                           hsel_tcb |
`endif
                           1'b0;


//-----------------------------------------------------------------------------
// GPIO
//-----------------------------------------------------------------------------

// GPIO 0: DBGCMD interface and SerialWire/JTAG pin interface

   cmsdk_ahb_gpio
     u_gpio_0
       (// Outputs
        .HREADYOUT                      (hready_out_gpio_0),
        .HRESP                          (hresp_gpio_0),
        .HRDATA                         (hrdata_gpio_0[31:0]),
        .PORTOUT                        (gpio_0_out[15:0]),
        .PORTEN                         (gpio_0_en[15:0]),
        .PORTFUNC                       (),
        .GPIOINT                        (),
        .COMBINT                        (),

        // Inputs
        .HCLK                           (CLK),
        .HRESETn                        (PORESETn),
        .FCLK                           (CLK),
        .HSEL                           (hsel_gpio_0),
        .HREADY                         (hready_mux),
        .HTRANS                         (htrans[1:0]),
        .HSIZE                          (hsize[2:0]),
        .HWRITE                         (hwrite),
        .HADDR                          (haddr[11:0]),
        .HWDATA                         (hwdata[31:0]),
        .ECOREVNUM                      (4'h0),
        .PORTIN                         (gpio_0_in[15:0])
        );


// GPIO 1: Message character output ("tube")

   cmsdk_ahb_gpio
     u_gpio_1
       (// Outputs
        .HREADYOUT                      (hready_out_gpio_1),
        .HRESP                          (hresp_gpio_1),
        .HRDATA                         (hrdata_gpio_1[31:0]),
        .PORTOUT                        (gpio_1_out[15:0]),
        .PORTEN                         (gpio_1_en[15:0]),
        .PORTFUNC                       (),
        .GPIOINT                        (),
        .COMBINT                        (),

        // Inputs
        .HCLK                           (CLK),
        .HRESETn                        (PORESETn),
        .FCLK                           (CLK),
        .HSEL                           (hsel_gpio_1),
        .HREADY                         (hready_mux),
        .HTRANS                         (htrans[1:0]),
        .HSIZE                          (hsize[2:0]),
        .HWRITE                         (hwrite),
        .HADDR                          (haddr[11:0]),
        .HWDATA                         (hwdata[31:0]),
        .ECOREVNUM                      (4'h0),
        .PORTIN                         (gpio_1_in[15:0])
        );


//-----------------------------------------------------------------------------
// GPIO connections
//-----------------------------------------------------------------------------
//
// GPIO 0
//
// Outputs:
//        gpio_0_out[15]           - Drives DBGRUNNING - Running
//        gpio_0_out[14]           - Drives DBGERROR - Error
//        gpio_0_out[13:7]         - Not Used
//        gpio_0_out[6]            - Drives SWDIOTMS enable
//        gpio_0_out[5]            - Drives SWDIOTMS
//        gpio_0_out[4:3]          - Not Used
//        gpio_0_out[2]            - Drives TDI
//        gpio_0_out[1]            - Drives SWCLKTCK
//        gpio_0_out[0]            - Drives nTRST
// Inputs:
//        gpio_0_in[15:14]         - Not Used
//        gpio_0_in[13]            - Reads DBGCMD[5] - Function Strobe
//        gpio_0_in[12]            - Reads DBGCMD[4] \
//        gpio_0_in[11]            - Reads DBGCMD[3]  \
//        gpio_0_in[10]            - Reads DBGCMD[2]   > Function Select
//        gpio_0_in[ 9]            - Reads DBGCMD[1]  /
//        gpio_0_in[ 8]            - Reads DBGCMD[0] /
//        gpio_0_in[7:5]           - Not Used
//        gpio_0_in[4]             - Reads SWDIOTMS
//        gpio_0_in[3]             - Reads TDO
//        gpio_0_in[2:0]           - Not Used
// Enables:
//        gpio_0_en[15:0]          - Drives bufif1's
//

  //
  // Pull down inputs from MCU to avoid capturing X at start of simulation
  //
  pulldown (DBGCMD[5]);
  pulldown (DBGCMD[4]);
  pulldown (DBGCMD[3]);
  pulldown (DBGCMD[2]);
  pulldown (DBGCMD[1]);
  pulldown (DBGCMD[0]);

  //Tri-state buffers for GPIO pins : bufif1(out, in, control)
  bufif1 (extgpio[ 0], gpio_0_out[ 0], gpio_0_en[ 0]);
  bufif1 (extgpio[ 1], gpio_0_out[ 1], gpio_0_en[ 1]);
  bufif1 (extgpio[ 2], gpio_0_out[ 2], gpio_0_en[ 2]);
  bufif1 (extgpio[ 3], gpio_0_out[ 3], gpio_0_en[ 3]);
  bufif1 (extgpio[ 4], gpio_0_out[ 4], gpio_0_en[ 4]);
  bufif1 (extgpio[ 5], gpio_0_out[ 5], gpio_0_en[ 5]);
  bufif1 (extgpio[ 6], gpio_0_out[ 6], gpio_0_en[ 6]);
  bufif1 (extgpio[ 7], gpio_0_out[ 7], gpio_0_en[ 7]);
  bufif1 (extgpio[ 8], gpio_0_out[ 8], gpio_0_en[ 8]);
  bufif1 (extgpio[ 9], gpio_0_out[ 9], gpio_0_en[ 9]);
  bufif1 (extgpio[10], gpio_0_out[10], gpio_0_en[10]);
  bufif1 (extgpio[11], gpio_0_out[11], gpio_0_en[11]);
  bufif1 (extgpio[12], gpio_0_out[12], gpio_0_en[12]);
  bufif1 (extgpio[13], gpio_0_out[13], gpio_0_en[13]);
  bufif1 (extgpio[14], gpio_0_out[14], gpio_0_en[14]);
  bufif1 (extgpio[15], gpio_0_out[15], gpio_0_en[15]);


  // GPIO pin connection for debug tester handshaking signals
  assign  DBGRUNNING      = extgpio[15];
  assign  gpio_0_in[15]   = extgpio[15];

  assign  DBGERROR        = extgpio[14];
  assign  gpio_0_in[14]   = extgpio[14];

  assign  gpio_0_in[13:8] = DBGCMD[5:0];


  // GPIO pin connection for JTAG/SW-JTAG connection

  assign  gpio_0_in[7]   = 1'b0;

  bufif1 (SWDIOTMS, extgpio[5], extgpio[6]);
  assign  gpio_0_in[6]   = extgpio[6];
  assign  gpio_0_in[5]   = extgpio[5];

  assign  gpio_0_in[4]   = SWDIOTMS;

  assign  gpio_0_in[3]   = TDO;

  assign  TDI            = extgpio[2];
  assign  gpio_0_in[2]   = extgpio[2];

  assign  SWCLKTCK       = extgpio[1];
  assign  gpio_0_in[1]   = extgpio[1];

  assign  nTRST          = extgpio[0];
  assign  gpio_0_in[0]   = extgpio[0];


// GPIO 1
//
// Outputs:
//        gpio_1_out[15:8]         - Not Used
//        gpio_1_out[7]            - Character Strobe
//        gpio_1_out[6:0]          - Character Data[6:0]
// Inputs:
//        gpio_1_in[15:0]          - Not Used
// Enables:
//        gpio_1_en[15:8]          - Not Used
//        gpio_1_en[7]             - Used to gate Character Strobe
//        gpio_1_en[6:0]           - Used to gate Character Date[6:0]
//

  // Tie off all inputs (not used)
  assign gpio_1_in = 16'h0000;


 // --------------------------------------------------------------------------------
 // TARMAC for the Cortex-M0 or Cortex-M0+
 // --------------------------------------------------------------------------------

`ifdef CORTEX_M0PLUS
`ifdef USE_TARMAC

`define ARM_CM0PIK_DBG_PATH u_cm0pmtb_int.u_cm0pintegration.u_imp.u_cortexm0plus

  cm0p_tarmac
   u_tarmac
     (.en_i           (1'b1),
      .echo_i         (1'b0),
      .id_i           (32'h1),
      .use_time_i     (1'b1),
      .tube_i         (32'h40400000),
      .halted_i       (`ARM_CM0PIK_DBG_PATH.HALTED),
      .lockup_i       (`ARM_CM0PIK_DBG_PATH.LOCKUP),
      .hclk           (`ARM_CM0PIK_DBG_PATH.HCLK),
      .hready_i       (`ARM_CM0PIK_DBG_PATH.HREADY),
      .haddr_i        (`ARM_CM0PIK_DBG_PATH.HADDR[31:0]),
      .hprot_i        (`ARM_CM0PIK_DBG_PATH.HPROT[3:0]),
      .hsize_i        (`ARM_CM0PIK_DBG_PATH.HSIZE[2:0]),
      .hwrite_i       (`ARM_CM0PIK_DBG_PATH.HWRITE),
      .htrans_i       (`ARM_CM0PIK_DBG_PATH.HTRANS[1:0]),
      .hresetn_i      (`ARM_CM0PIK_DBG_PATH.HRESETn),
      .hresp_i        (`ARM_CM0PIK_DBG_PATH.HRESP),
      .hrdata_i       (`ARM_CM0PIK_DBG_PATH.HRDATA[31:0]),
      .hwdata_i       (`ARM_CM0PIK_DBG_PATH.HWDATA[31:0]),
      .ppb_trans_i    (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_matrix.ppb_trans),
      .scs_rdata_i    (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_matrix.scs_rdata),
      .ahb_trans_i    (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.ahb_trans),
      .ipsr_i         (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.ipsr_q[5:0]),
      .tbit_i         (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.tbit_q),
      .fault_i        (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.fault_q),
      .cc_pass_i      (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.cc_pass),
      .spsel_i        (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.spsel_q),
      .npriv_i        (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.npriv_q),
      .primask_i      (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.primask_q),
      .apsr_i         (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.apsr_q[3:0]),
      .state_i        (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.state_q[3:0]),
      .op_i           (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.op_q[15:0]),
      .op_s_i         (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.op_s_q),
      .iq_i           (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.iq_q[15:0]),
      .iq_s_i         (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.iq_s_q),
      .psp_en_i       (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.psp_en),
      .msp_en_i       (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.msp_en),
      .wr_data_i      (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.wr_data[31:0]),
      .wr_data_sp_i   (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.wr_data_sp[29:0]),
      .wr_addr_en_i   (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.wr_addr_en[3:0]),
      .iaex_i         (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.iaex_q[30:0]),
      .preempt_i      (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.preempt),
      .int_ready_i    (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.int_ready_q),
      .irq_ack_i      (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.irq_ack),
      .rfe_ack_i      (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.rfe_ack),
      .int_pend_num_i (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.nvm_int_pend_num_i[5:0]),
      .atomic_i       (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.atomic_q),
      .hardfault_i    (`ARM_CM0PIK_DBG_PATH.u_top.u_sys.u_core.hdf_req),
      .iotrans_i      (`ARM_CM0PIK_DBG_PATH.IOTRANS),
      .iowrite_i      (`ARM_CM0PIK_DBG_PATH.IOWRITE),
      .iosize_i       (`ARM_CM0PIK_DBG_PATH.IOSIZE[1:0]),
      .ioaddr_i       (`ARM_CM0PIK_DBG_PATH.IOADDR[31:0]),
      .iordata_i      (`ARM_CM0PIK_DBG_PATH.IORDATA[31:0]),
      .iowdata_i      (`ARM_CM0PIK_DBG_PATH.IOWDATA[31:0]),
      .slvtrans_i     (`ARM_CM0PIK_DBG_PATH.SLVTRANS[1:0]),
      .slvwrite_i     (`ARM_CM0PIK_DBG_PATH.SLVWRITE),
      .slvsize_i      (`ARM_CM0PIK_DBG_PATH.SLVSIZE[1:0]),
      .slvaddr_i      (`ARM_CM0PIK_DBG_PATH.SLVADDR[31:0]),
      .slvrdata_i     (`ARM_CM0PIK_DBG_PATH.SLVRDATA[31:0]),
      .slvwdata_i     (`ARM_CM0PIK_DBG_PATH.SLVWDATA[31:0]),
      .slvready_i     (`ARM_CM0PIK_DBG_PATH.SLVREADY),
      .slvresp_i      (`ARM_CM0PIK_DBG_PATH.SLVRESP)
  );

`endif // USE_TARMAC
`else

`ifdef CORTEX_M0
`ifdef USE_TARMAC

`define ARM_CM0IK_DBG_PATH u_cortex_m0_int.u_cortexm0

  cm0_tarmac #(.LOGFILENAME("tarmac1.log"))
    u_tarmac
      (.enable_i      (1'b1),

       .hclk_i        (`ARM_CM0IK_DBG_PATH.HCLK),
       .hready_i      (`ARM_CM0IK_DBG_PATH.HREADY),
       .haddr_i       (`ARM_CM0IK_DBG_PATH.HADDR[31:0]),
       .hprot_i       (`ARM_CM0IK_DBG_PATH.HPROT[3:0]),
       .hsize_i       (`ARM_CM0IK_DBG_PATH.HSIZE[2:0]),
       .hwrite_i      (`ARM_CM0IK_DBG_PATH.HWRITE),
       .htrans_i      (`ARM_CM0IK_DBG_PATH.HTRANS[1:0]),
       .hresetn_i     (`ARM_CM0IK_DBG_PATH.HRESETn),
       .hresp_i       (`ARM_CM0IK_DBG_PATH.HRESP),
       .hrdata_i      (`ARM_CM0IK_DBG_PATH.HRDATA[31:0]),
       .hwdata_i      (`ARM_CM0IK_DBG_PATH.HWDATA[31:0]),
       .lockup_i      (`ARM_CM0IK_DBG_PATH.LOCKUP),
       .halted_i      (`ARM_CM0IK_DBG_PATH.HALTED),
       .codehintde_i  (`ARM_CM0IK_DBG_PATH.CODEHINTDE[2:0]),
       .codenseq_i    (`ARM_CM0IK_DBG_PATH.CODENSEQ),

       .hdf_req_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.ctl_hdf_request),
       .int_taken_i   (`ARM_CM0IK_DBG_PATH.u_top.u_sys.dec_int_taken_o),
       .int_return_i  (`ARM_CM0IK_DBG_PATH.u_top.u_sys.dec_int_return_o),
       .int_pend_i    (`ARM_CM0IK_DBG_PATH.u_top.u_sys.nvm_int_pend),
       .pend_num_i    (`ARM_CM0IK_DBG_PATH.u_top.u_sys.nvm_int_pend_num[5:0]),
       .ipsr_i        (`ARM_CM0IK_DBG_PATH.u_top.u_sys.psr_ipsr[5:0]),

       .ex_last_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.ctl_ex_last),
       .iaex_en_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.ctl_iaex_en),
       .reg_waddr_i   (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.ctl_wr_addr[3:0]),
       .reg_write_i   (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.ctl_wr_en),
       .xpsr_en_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.ctl_xpsr_en),
       .fe_addr_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.pfu_fe_addr[30:0]),
       .int_delay_i   (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.pfu_int_delay),
       .special_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.pfu_op_special),
       .opcode_i      (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.pfu_opcode[15:0]),
       .reg_wdata_i   (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.psr_gpr_wdata[31:0]),

       .atomic_i      (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_ctl.atomic),
       .atomic_nxt_i  (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_ctl.atomic_nxt),
       .dabort_i      (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_ctl.data_abort),
       .ex_last_nxt_i (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_ctl.ex_last_nxt),
       .int_preempt_i (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_ctl.int_preempt),

       .psp_sel_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_gpr.psp_sel),
       .xpsr_i        (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_gpr.xpsr[31:0]),

       .iaex_i        (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_pfu.iaex[30:0]),
       .iaex_nxt_i    (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_pfu.iaex_nxt[30:0]),
       .opcode_nxt_i  (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_pfu.ibuf_de_nxt[15:0]),
       .delay_count_i (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_pfu.ibuf_lo[13:6]),
       .tbit_en_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_pfu.tbit_en),

       .cflag_en_i    (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_psr.cflag_ena),
       .ipsr_en_i     (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_psr.ipsr_ena),
       .nzflag_en_i   (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_psr.nzflag_ena),
       .vflag_en_i    (`ARM_CM0IK_DBG_PATH.u_top.u_sys.u_core.u_psr.vflag_ena)
  );

`endif // USE_TARMAC
`endif // CORTEX_M0
`endif // CORTEX_M0PLUS

`ifdef USE_TARMAC
`ifdef CORTEX_M3
  //synthesis translate_off
  tarmac #("tarmac1.log")
    utarmac ();
  //synthesis translate_on
`endif
`endif

//---------------------------------------------------------------------------
// TracePort capturing buffer
//---------------------------------------------------------------------------
`ifdef ARM_CMSDK_DEBUG_TESTER_TRACE

   cmsdk_debug_tester_trace_capture
     u_trace_capture
       (
        // Outputs
        .HREADYOUT                      (hready_out_tcb),
        .HRESP                          (hresp_tcb),
        .HRDATA                         (hrdata_tcb),
        // Inputs
        .HCLK                           (CLK),
        .HRESETn                        (PORESETn),
        .HSEL                           (hsel_tcb),
        .HADDR                          (haddr[10:0]),
        .HWRITE                         (hwrite),
        .HTRANS                         (htrans[1:0]),
        .HSIZE                          (hsize[2:0]),
        .HWDATA                         (hwdata[31:0]),
        .HREADY                         (hready_mux),
        .TRACECLK                       (TRACECLK),
        .TRACEDATA                      (TRACEDATA),
        .SWV                            (SWV)
        );

`else

   assign hready_out_tcb = hready_out_def_slv;
   assign hresp_tcb = hresp_def_slv;
   assign hrdata_tcb = 32'h00000000;

`endif


//-----------------------------------------------------------------------------
// Character Output - debug_tester block, for debug purpose
//-----------------------------------------------------------------------------
  reg [7:0]        tube_string [127:0];  // buffer to hold printed message
  reg [6:0]        string_length;        // Number of character in buffer
  reg              nxt_end_simulation;   // end simulation signal (0x4 detected)
  reg              reg_end_simulation;   // Delayed end simulation signal
  integer          i;                    // loop counter
  reg [7:0]        text_char;            // temp variable for display
  wire [7:0]       d_chardata = {1'b0, (gpio_1_out[6:0] & gpio_1_en[6:0])};  // Data from GPIO
  wire             d_charstrobe = (gpio_1_out[7] & gpio_1_en[7]);          // Strobe from GPIO
  reg              last_d_charstrobe;    // last d_charstrobe for edge detection

  // Registering d_charstrobe for edge detection
  always @ (posedge CLK or negedge PORESETn)
    begin
    if (~PORESETn)
      last_d_charstrobe <= 1'b0;
    else
      last_d_charstrobe <= d_charstrobe;
    end

  // Message display
  always @ (posedge CLK or negedge PORESETn)
  begin: p_tube
  if (~PORESETn)
    begin
    string_length = {7{1'b0}};
    nxt_end_simulation <= 1'b0;
      for (i=0; i<= 127; i=i+1)
       begin
          tube_string[i] = 8'h00;
       end
    end
  else
    if (d_charstrobe & (~last_d_charstrobe))
        begin
        if  (d_chardata==8'h04) // Stop simulation if 0x04 is received
          nxt_end_simulation <= 1'b1;
        else if ((d_chardata==13)|(d_chardata==10))
          // New line
          begin
          tube_string[string_length] = 8'h00;
          $write("%t     DEBUG TESTER: ",$time);
          for (i=0; i<= string_length; i=i+1)
            begin
            text_char = tube_string[i];
            $write("%s",text_char);
            end
          $write("\n");
          string_length <= {7{1'b0}};
          end
        else
          begin
          tube_string[string_length] = d_chardata;
          string_length = string_length + 1;
          if (string_length >79) // line too long, display and clear buffer
            begin
            tube_string[string_length] = 8'h00;
            $write("%t     DEBUG TESTER: ",$time);

            for (i=0; i<= string_length; i=i+1)
              begin
              text_char = tube_string[i];
              $write("%s",text_char);
              end
            $write("\n");
            string_length <= {7{1'b0}};
            end
          end
        end
  end // p_TUBE

  // Delay for simulation end
  always @ (posedge CLK or negedge PORESETn)
  begin: p_sim_end
  if (~PORESETn)
    begin
    reg_end_simulation <= 1'b0;
    end
  else
    begin
    reg_end_simulation  <= nxt_end_simulation;
    if (reg_end_simulation==1'b1)
      begin
      $write("%t     DEBUG TESTER: Test Ended\n",$time);
      $stop;
      end
    end
  end

endmodule
