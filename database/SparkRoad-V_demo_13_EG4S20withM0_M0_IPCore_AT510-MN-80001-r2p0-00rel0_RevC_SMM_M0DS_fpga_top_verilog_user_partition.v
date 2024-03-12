//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2013-2017 ARM Limited or its affiliates.
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
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Abstract : V2M-MPS2 FPGA System Level
//------------------------------------------------------------------------------

`include "cmsdk_mcu_defs.v"

module user_partition #(
  //-----------------------------------------
  // CPU options

`ifdef ARM_CMSDK_INCLUDE_CLKGATE
  parameter CLKGATE_PRESENT = 1,
`else
  parameter CLKGATE_PRESENT = 0,
`endif

  parameter BASEADDR_GPIO0  = 32'h4001_0000, // GPIO0 peripheral base address
  parameter BASEADDR_GPIO1  = 32'h4001_1000, // GPIO1 peripheral base address
  parameter BE              = 0,   // 1: Big endian 0: little endian
  parameter BKPT            = 4,   // Number of breakpoint comparators
  parameter DBG             = 1,   // Debug configuration
  parameter NUMIRQ          = 32,  // NUM of IRQ
  parameter SMUL            = 0,   // Multiplier configuration
  parameter SYST            = 1,   // SysTick
  parameter WIC             = 1,   // Wake-up interrupt controller support
  parameter WICLINES        = 34,  // Supported WIC lines
  parameter WPT             = 2,   // Number of DWT comparators

  //-----------------------------------------
  // Memory options - see cmsdk_mcu_defs.v

  //  This is defined in systems/cortex_m_mcu/cmsdk_mcu_defs.v
  //  Based on the definition constants in logical/models/memories/cmsdk_ahb_memory_model_defs.v
  //  0) AHB_ROM_NONE             - memory not present
  //  1) AHB_ROM_BEH_MODEL        - behavioural ROM memory
  //  2) AHB_ROM_FPGA_SRAM_MODEL  - behavioural FPGA SRAM model with SRAM wrapper
  //  3) AHB_ROM_FLASH32_MODEL    - behavioural 32-bit flash memory
  parameter BOOT_MEM_TYPE   = `ARM_CMSDK_BOOT_MEM_TYPE,   // Boot loader memory type

  //  This is defined in systems/cortex_m_mcu/cmsdk_mcu_defs.v
  //  Based on the definition constants in logical/models/memories/cmsdk_ahb_memory_model_defs.v
  //  0) AHB_ROM_NONE             - memory not present (Not valid for a Cortex-M3/M4 system)
  //  1) AHB_ROM_BEH_MODEL        - behavioural ROM memory
  //  2) AHB_ROM_FPGA_SRAM_MODEL  - behavioural FPGA SRAM model with SRAM wrapper
  //  3) AHB_ROM_FLASH32_MODEL    - behavioural 32-bit flash memory
  parameter ROM_MEM_TYPE    = `ARM_CMSDK_ROM_MEM_TYPE,   // ROM memory type

  //  This is defined in systems/cortex_m_mcu/cmsdk_mcu_defs.v
  //  Based on the definition constants in logical/models/memories/cmsdk_ahb_memory_model_defs.v
  //  0) AHB_RAM_NONE             - memory not present  (Not valid for a Cortex-M3/M4 system)
  //  1) AHB_RAM_BEH_MODEL        - behavioural RAM memory
  //  2) AHB_RAM_FPGA_SRAM_MODEL  - behavioural SRAM model with SRAM wrapper
  //  3) AHB_RAM_EXT_SRAM16_MODEL - for benchmarking using 16-bit external asynchronous SRAM
  //  4) AHB_RAM_EXT_SRAM16_MODEL - for benchmarking using 8-bit external asynchronous SRAM
  parameter RAM_MEM_TYPE    = `ARM_CMSDK_RAM_MEM_TYPE,   // RAM memory type

  // Generate BOOT_LOADER_PRESENT based on BOOT_MEM_TYPE
  // This is a derived parameter - do not override using instantiation
  parameter BOOT_LOADER_PRESENT = (BOOT_MEM_TYPE==0) ? 0 : 1,

  // Location of the System ROM Table.
  parameter BASEADDR_SYSROMTABLE = 32'hF000_0000,

  //-----------------------------------------
  // System options
  `ifdef ARM_CMSDK_INCLUDE_DMA
    parameter INCLUDE_DMA = 1, // Include instantiation of DMA-230
    // This option also add a number of bus components
    parameter DMA_CHANNEL_NUM = 1,
  `else
    parameter INCLUDE_DMA = 0, // Do not instantiation DMA-230
    parameter DMA_CHANNEL_NUM = 1,
  `endif

  `ifdef ARM_CMSDK_INCLUDE_BITBAND
    parameter INCLUDE_BITBAND = 1,
    // Include instantiation of Bit-band wrapper
    // This option add bit band wrapper to CPU interface
  `else
    parameter INCLUDE_BITBAND = 0,
  `endif

  `ifdef ARM_CMSDK_INCLUDE_JTAG
    parameter INCLUDE_JTAG = 1 // Include JTAG feature
  `else
    parameter INCLUDE_JTAG = 0 // Do not Include JTAG feature
  `endif

 )
    (
    input  wire          fclk,                  // Free running clock
    input  wire          fpga_npor,             // delayed CB_nPOR reset
    input  wire          fpga_reset_n,          // CB_nRST system reset
    input  wire          cs_nsrst_sync,         // debug connector system reset
    input  wire          clk_100hz,             // 100Hz clock
    // --------------------------------------------------------------------
    // I/Os
    // --------------------------------------------------------------------
    output wire [1:0]    leds,                  // LEDs
    input  wire [1:0]    buttons,               // Push buttons
    input  wire [7:0]    dll_locked,            // DLL/PLL locked information

    // User expansion ports
    input  wire [51:0]   io_exp_port_i,         // I/O port inputs
    output wire [51:0]   io_exp_port_o,         // I/O port outputs
    output wire [51:0]   io_exp_port_oen,       // I/O port output enables

    output wire [6:0]    fpga_misc,
    input  wire          ts_interrupt,
    // --------------------------------------------------------------------
    // Debug and Trace
    // --------------------------------------------------------------------
    input  wire          dbg_gnd_detect,        // Ground detect
    input  wire          dbg_ntrst,             // JTAG nTRST
    input  wire          dbg_tdi,               // JTAG TDI
    input  wire          dbg_swclk_tck,         // SWD Clk / JTAG TCK
    input  wire          dbg_swio_tms_i,        // SWD I/O / JTAG TMS
    output wire          dbg_swio_tms_o,        // SWD I/O tristata output
    output wire          dbg_swio_tms_en,       // SWD I/O tristata enable
    output wire          dbg_swo_tdo_o,         // SWV / JTAG TDO
    output wire          dbg_swo_tdo_en,        // SWV / JTAG TDO 3-state enable
    output wire          trc_clk,               // Trace clock
    output wire          trc_ctrl,              // Trace control
    output wire [15:0]   trc_data,              // Trace data

    // --------------------------------------------------------------------
    // ZBT Synchronous SRAM
    // --------------------------------------------------------------------

    // 64-bit ZBT Synchronous SRAM1 connections
    //output wire [1:0]    zbt_sram1_CLK,       // Clock
    output wire [19:0]   zbt_sram1_a,           // Address
    input  wire [63:0]   zbt_sram1_dq_i,        // Data input
    output wire [63:0]   zbt_sram1_dq_o,        // Data Output
    output wire          zbt_sram1_dq_oen,      // 3-state Buffer Enable
    output wire [7:0]    zbt_sram1_bwn,         // Byte lane writes (active low)
    output wire          zbt_sram1_cen,         // Chip Select (active low)
    output wire          zbt_sram1_wen,         // Write enable
    output wire          zbt_sram1_oen,         // Output enable (active low)
    output wire          zbt_sram1_lbon,        // Not used (tied to 0)
    output wire          zbt_sram1_adv,         // Not used (tied to 0)
    output wire          zbt_sram1_zz,          // Not used (tied to 0)
    output wire          zbt_sram1_cken,        // Not used (tied to 0)

    // 32-bit ZBT Synchronous SRAM2 connections
    //output wire          zbt_sram2_CLK,       // Clock
    output wire [19:0]   zbt_sram2_a,           // Address
    input  wire [31:0]   zbt_sram2_dq_i,        // Data input
    output wire [31:0]   zbt_sram2_dq_o,        // Data Output
    output wire          zbt_sram2_dq_oen,      // 3-state Buffer Enable
    output wire  [3:0]   zbt_sram2_bwn,         // Byte lane writes (active low)
    output wire          zbt_sram2_cen,         // Chip Select (active low)
    output wire          zbt_sram2_wen,         // Write enable
    output wire          zbt_sram2_oen,         // Output enable (active low)
    output wire          zbt_sram2_lbon,        // Not used (tied to 0)
    output wire          zbt_sram2_adv,         // Not used (tied to 0)
    output wire          zbt_sram2_zz,          // Not used (tied to 0)
    output wire          zbt_sram2_cken,        // Not used (tied to 0)

    // 32-bit ZBT Synchronous SRAM3 connections
    //output wire          zbt_sram3_CLK,       // Clock
    output wire [19:0]   zbt_sram3_a,           // Address
    input  wire [31:0]   zbt_sram3_dq_i,        // Data input
    output wire [31:0]   zbt_sram3_dq_o,        // Data Output
    output wire          zbt_sram3_dq_oen,      // 3-state Buffer Enable
    output wire  [3:0]   zbt_sram3_bwn,         // Byte lane writes (active low)
    output wire          zbt_sram3_cen,         // Chip Select (active low)
    output wire          zbt_sram3_wen,         // Write enable
    output wire          zbt_sram3_oen,         // Output enable (active low)
    output wire          zbt_sram3_lbon,        // Not used (tied to 0)
    output wire          zbt_sram3_adv,         // Not used (tied to 0)
    output wire          zbt_sram3_zz,          // Not used (tied to 0)
    output wire          zbt_sram3_cken,        // Not used (tied to 0)

    // 16-bit smb connections
    output wire [25:0]   smb_addr,              // Address
    input  wire [15:0]   smb_data_i,            // Read Data
    output wire [15:0]   smb_data_o,            // Write Data
    output wire          smb_data_o_nen,        // Write Data 3-state ctrl
    output wire          smb_cen,               // Active low chip enable
    output wire          smb_oen,               // Active low output enable (read)
    output wire          smb_wen,               // Active low write enable
    output wire          smb_ubn,               // Active low Upper Byte Enable
    output wire          smb_lbn,               // Active low Upper Byte Enable
    output wire          smb_nrd,               // Active low read enable
    output wire          smb_nreset,            // Active low reset

    // --------------------------------------------------------------------
    // UART
    // --------------------------------------------------------------------
    input  wire          uart_rxd,              // UART receive data
    output wire          uart_txd,              // UART transmit data

    input  wire          uart_rxd_mcu,          // Microcontroller UART receive data
    output wire          uart_txd_mcu,          // Microcontroller UART transmit data
    output wire          uart_txd_enable,       // TX enable (enable 3-state buffer)

    // --------------------------------------------------------------------
    // SPI
    // --------------------------------------------------------------------
    output wire          spi0_clk_out,          // SPI clock
    output wire          spi0_clk_out_en_n,     // SPI clock output enable (active low)
    output wire          spi0_data_out,         // SPI data out
    output wire          spi0_data_out_en_n,    // SPI data output enable (active low)
    input  wire          spi0_data_in,          // SPI data in
    output wire          spi0_sel,              // SPI device select

    input  wire          config_spiclk,
    input  wire          config_spidi,
    output wire          config_spido,

    // --------------------------------------------------------------------
    // VGA
    // --------------------------------------------------------------------
    output wire          vga_hsync,             // VGA H-Sync
    output wire          vga_vsync,             // VGA V-Sync
    output wire [3:0]    vga_r,                 // VGA red data
    output wire [3:0]    vga_g,                 // VGA green data
    output wire [3:0]    vga_b,                 // VGA blue data

    // --------------------------------------------------------------------
    // Ethernet
    // --------------------------------------------------------------------
    input  wire          SMB_ETH_IRQ_n,
    // --------------------------------------------------------------------
    // Audio
    // --------------------------------------------------------------------
    input  wire          audio_mclk,            // Audio codec master clock (12.288MHz)
    input  wire          audio_sclk,            // Audio interface bit clock
    output wire          audio_lrck,            // Audio Left/Right clock
    output wire          audio_sdout,           // Audio DAC data
    input  wire          audio_sdin,            // Audio ADC data
    output wire          audio_nrst,            // Audio reset

    output wire          audio_scl,
    input  wire          audio_sda_i,
    output wire          audio_sda_o_en_n,      // When audio_sda_o_en_n=0, pull SDA low

    // --------------------------------------------------------------------
    // CLCD
    // --------------------------------------------------------------------
    output wire          clcd_scl,
    input  wire          clcd_sda_i,
    output wire          clcd_sda_o_en_n,

    output wire          spi1_clk_out,          //CLCD SPI clock
    output wire          spi1_clk_out_en_n,     //CLCD SPI clock output enable (active low)
    output wire          spi1_data_out,         //CLCD SPI data out
    output wire          spi1_data_out_en_n,    //CLCD SPI data output enable (active low)
    input  wire          spi1_data_in,          //CLCD SPI data in
    output wire          spi1_sel,              //CLCD SPI device select

    // --------------------------------------------------------------------
    // Serial Communication Controller interface
    // --------------------------------------------------------------------
    input  wire          CFGCLK,
    input  wire          nCFGRST,

    input  wire          CFGLOAD,
    input  wire          CFGWnR,
    input  wire          CFGDATAIN,
    output wire          CFGDATAOUT,

    output wire          cfgint
  ); // end of top level pin list

  //---------------------------------------------------
  // Internal wires
  //---------------------------------------------------
  wire            hclk_cpu;                     // CPU system clock
  wire            hclk_sys_cmsdk;               // CMSDK system HCLK
  wire            hclk_sys;                     // AHB system clock
  wire            pclk;                         // PCLK (continuous)
  wire            pclk_gated;                   // Gated PCLK (bus clock, runs when APB is active)
  wire            hresetn;                      // HRESETn for system
  wire            cpu0_hresetn;                 // HRESETn for CPU #0
  wire            poresetn;                     // Power On reset
  wire            presetn;                      // Peripheral system reset
  wire            sys_reset_req;                // System reset request (from NVIC)
  wire            wdog_reset_req;               // Watchdog reset request

  // Common AHB signals
  wire    [31:0]  flash_haddr;                  // AHB to flash blocks - address
  wire     [1:0]  flash_htrans;                 // AHB to flash blocks - transfer ctrl
  wire     [2:0]  flash_hsize;                  // AHB to flash blocks - transfer size
  wire            flash_hwrite;                 // AHB to flash blocks - write ctrl
  wire    [31:0]  flash_hwdata;                 // AHB to flash blocks - write data
  wire            flash_hready;                 // AHB to flash blocks - AHB ready

  // Flash memory AHB signals - goto SSRAM1
  wire            flash_hsel;
  wire            flash_hreadyout;
  wire    [31:0]  flash_hrdata;
  wire            flash_hresp;
  wire    [63:0]  flash_hrdata_64;

  // Static Memory Interface (SMI) for PSRAM and Ethernet
  wire            smi_hsel;
  wire    [25:0]  smi_haddr;                    // Remapped HADDR to include chip select info
  wire            smi_hresp;
  wire            smi_hreadyout;
  wire    [31:0]  smi_hrdata;

  // CMSDK system AHB signals
  //  (AHB Lite bus signals from Cortex-M system bus.
  //   Covers SRAM region memory and FPGA level peripherals,
  //   exclude CMSDK level peripherals)
  wire            cpusys_hsel;                  // select
  wire            cpusys_hreadyout;             // ready
  wire    [31:0]  cpusys_hrdata;                // read data output from SRAM
  wire            cpusys_hresp;                 // response

  // FPGA system AHB signals
  //  (AHB Lite bus from CPU/CMSDK / from SPI to AHB)
  wire    [31:0]  fpgasys_haddr;                // address
  wire     [1:0]  fpgasys_htrans;               // transfer control
  wire     [2:0]  fpgasys_hsize;                // size
  wire            fpgasys_hwrite;               // write control
  wire    [31:0]  fpgasys_hwdata;               // write data
  wire            fpgasys_hready;               // ready

  wire            fpgasys_hsel;                 // select
  wire            fpgasys_hreadyout;            // ready
  wire    [31:0]  fpgasys_hrdata;               // read data output from SRAM
  wire            fpgasys_hresp;                // response

  // Boot loader/firmware AHB signals (FPGA block RAM)
  wire            boot_hsel;
  wire            boot_hreadyout;
  wire    [31:0]  boot_hrdata;
  wire            boot_hresp;

  // SPI to APB bridge bus - allows MCU on board to access memories
  //                         via an APB interface, which also convert
  //                         to AHB for accessing ethernet, PSRAM, etc
  //    APB section
  wire    [31:0]  spi2mem_paddr;
  wire    [31:0]  spi2mem_pwdata;
  wire            spi2mem_psel;
  wire            spi2mem_penable;
  wire            spi2mem_pwrite;
  wire     [3:0]  spi2mem_pstrb;

  wire    [31:0]  spi2mem_prdata;
  wire            spi2mem_pready;

  //    APB section - slave 0 - 64-bit ZBTRAM
  wire            spi2mem_s0_psel;
  wire    [31:0]  spi2mem_s0_prdata;
  wire            spi2mem_s0_pready;
  wire            spi2mem_s0_pslverr;

  //    APB section - slave 1 - to converter which convert bus transfers to AHB
  wire            spi2mem_s1_psel;
  wire    [31:0]  spi2mem_s1_prdata;
  wire            spi2mem_s1_pready;
  wire            spi2mem_s1_pslverr;

  //    AHB Lite driven by SPI (from MCU on board)
  wire            spi2mem_s1_hsel;
  wire    [31:0]  spi2mem_s1_haddr;
  wire            spi2mem_s1_hwrite;
  wire    [31:0]  spi2mem_s1_hwdata;
  wire     [1:0]  spi2mem_s1_hsize;
  wire     [1:0]  spi2mem_s1_htrans;
  wire    [31:0]  spi2mem_s1_hrdata;
  wire            spi2mem_s1_hready;
  wire            spi2mem_s1_hresp;
  
  // --------------------------------------------------------------------
  // ADC SPI
  // --------------------------------------------------------------------
  wire            adc_spi2_clk_out;           //ADC SPI clock
  wire            adc_spi2_clk_out_en_n;      //ADC SPI clock output enable (active low)
  wire            adc_spi2_data_out;          //ADC SPI data out
  wire            adc_spi2_data_out_en_n;     //ADC SPI data output enable (active low)
  wire            adc_spi2_data_in;           //ADC SPI data in
  wire            adc_spi2_sel;               //ADC SPI device select

  // --------------------------------------------------------------------
  // Shield 0 
  // --------------------------------------------------------------------
  wire            shield0_scl;
  wire            shield0_sda_i;
  wire            shield0_sda_o_en_n;
                  
  wire            shield0_spi3_clk_out;       // shield0 SPI clock
  wire            shield0_spi3_clk_out_en_n;  // shield0 SPI clock output enable (active low)
  wire            shield0_spi3_data_out;      // shield0 SPI data out
  wire            shield0_spi3_data_out_en_n; // shield0 SPI data output enable (active low)
  wire            shield0_spi3_data_in;       // shield0 SPI data in
  wire            shield0_spi3_sel;           // shield0 SPI device select
  // When audio_sda_o_en_n=0, pull SDA low
  
  // --------------------------------------------------------------------
  // Shield 1
  // --------------------------------------------------------------------
  wire            shield1_scl;
  wire            shield1_sda_i;
  wire            shield1_sda_o_en_n;
                  
  wire            shield1_spi4_clk_out;       // shield1 SPI clock
  wire            shield1_spi4_clk_out_en_n;  // shield1 SPI clock output enable (active low)
  wire            shield1_spi4_data_out;      // shield1 SPI data out
  wire            shield1_spi4_data_out_en_n; // shield1 SPI data output enable (active low)
  wire            shield1_spi4_data_in;       // shield1 SPI data in
  wire            shield1_spi4_sel;           // shield1 SPI device select

  // --------------------------------------------------------------------
  // Arduino UARTs
  // --------------------------------------------------------------------
  wire            uart1_rxd;                  // UART 1 receive data
  wire            uart1_txd;                  // UART 1 transmit data
  wire            uart3_rxd;                  // UART 2 receive data
  wire            uart3_txd;                  // UART 2 transmit data
  wire            uart4_rxd;                  // UART 3 receive data
  wire            uart4_txd;                  // UART 3 transmit data

  // Cortex-M processor signals
  // These are signals which either are on Cortex M0+, (which has not been migrated to the core_partition)
  // and not on Cortex-M0 or M0 DesignStart
  // Or they are output from cmsdk_mcu_system to the processor core 
  wire            APBACTIVE;                    // Indicate APB has an active transfer
  wire            LOCKUPRESET;                  // Control signal to enable automatic reset at lockup
  wire            PMUENABLE;                    // Power Management Unit enable (set to 1 to enable WIC mode deel sleep)
  wire            GATEHCLK;                     // Gated HCLK
  wire            WICENREQ;                     // WIC enable request (from PMU to WIC)
  wire            SLEEPHOLDREQn;                // Sleep extension handshaking : hold request
  wire            CDBGPWRUPREQ;                 // Power up request
  wire            CDBGPWRUPACK;                 // Power up acknowledge
  wire            LOCKUP;                       // Lock up status

  wire            DBGRESTART;                   // multi-core synchronous restart from halt
  wire            EDBGRQ;                       // multi-core synchronous halt request
  wire            DFTSE;                        // Design For Test Enable
  wire            RSTBYPASS;                    // Reset bypass (for testing)
  
  // User expansion I/O interface
  wire    [15:0]  gpio2_in;
  wire    [15:0]  gpio2_out;
  wire    [15:0]  gpio2_outen;
  wire    [15:0]  gpio2_altfunc;
  wire            gpio2_interrupt;

  wire    [15:0]  gpio3_in;
  wire    [15:0]  gpio3_out;
  wire    [15:0]  gpio3_outen;
  wire    [15:0]  gpio3_altfunc;
  wire            gpio3_interrupt;

  wire            dbg_swo_tdo_nen;              // SWV / JTAG TDO 3-state disable

  wire            zbt_boot_ctrl;                // Use this to override internal boot ROM so that
                                                // the processor start program execution from ZBT SRAM.

  wire            spi_interrupt;                // Interrupt from FPGA APB subsystem to processor
  wire            i2s_interrupt;                // Interrupt from FPGA APB subsystem to processor
  wire            eth_interrupt;                // Interrupt from off chip ethernet to processor
  wire            ts_interrupt_sync;            // Interrupt from touch screen to processor
  
  wire            fpga_npor_sync;               // Resynchronise the fpga_npor reset

  // Internally we need 10 bits for fpga_misc, but only 7 go out to the top level
  wire [9:0]      fpga_misc_int;
  assign fpga_misc = fpga_misc_int[6:0];

  //---------------------------------------------------
  // Clock
  //---------------------------------------------------
`ifdef ARM_CMSDK_INCLUDE_CLKGATE
  wire clock_enable = ~GATEHCLK;                // From Cortex-M Integration
  // Clock gating for CPU's HCLK
  cmsdk_clock_gate  #(
   .CLKGATE_PRESENT (CLKGATE_PRESENT))          // Define in cmsdk_mcu_defs.v
   u_cmsdk_cg_hclk_cpu (
   .CLK        (fclk),
   .CLKENABLE  (clock_enable),
   .DISABLEG   (1'b0),                          // In ASIC design this could be control by SCANMODE
   .GATEDCLK   (hclk_cpu)
   );

  // Clock gating for CMSDK system clock
  cmsdk_clock_gate  #(
   .CLKGATE_PRESENT (CLKGATE_PRESENT))          // Define in cmsdk_mcu_defs.v
   u_cmsdk_cg_hclk_sys (
   .CLK        (fclk),
   .CLKENABLE  (clock_enable),
   .DISABLEG   (1'b0),                          // In ASIC design this could be control by SCANMODE
   .GATEDCLK   (hclk_sys_cmsdk)
   );


  // Clock gating for CMSDK APB bus clock
  cmsdk_clock_gate  #(
   .CLKGATE_PRESENT (CLKGATE_PRESENT))          // Define in cmsdk_mcu_defs.v
   u_cmsdk_cg_pclk_gated (
   .CLK        (fclk),
   .CLKENABLE  (APBACTIVE),
   .DISABLEG   (1'b0),                          // In ASIC design this could be control by SCANMODE
   .GATEDCLK   (pclk_gated)
   );
`else

  assign hclk_cpu       = fclk;
  assign hclk_sys_cmsdk = fclk;
  assign pclk_gated     = fclk;
`endif

  assign hclk_sys     = fclk;                   // Not gated because SPI or SCC might need access to bus
  assign pclk         = fclk;                   // Not gated - clock for Peripheral operations
  
  // --------------------------------------------------------------------
  // Reset
  // --------------------------------------------------------------------

  //                    PLL locked
  //                       |
  //                       V
  //  CB_nPOR -> sync -> delay -> fpga_npor -> reg_sys_rst -> hresetn, presetn (this level)
  //                       |                       ^
  //                       |                       |
  //                       |         design generated reset
  //                       |                       |
  //                       V                       V
  //  CB_nRST -> sync -> fpga_reset_n -> reg_cpu0_rst -> SYSRESETn (CMSDK)
  //                       |
  //                       \---------------------------> PORESETn (CMSDK)
  //
  reg    reg_sys_rst;  // System reset
  reg    reg_cpu0_rst; // CPU reset

  // FPGA system level reset
  // This is controlled by fpga_npor because we want to download code
  // to ZBTRAM via SPI after CB_nPOR released, and before CB_nRST is released.
  always @(posedge fclk or negedge fpga_npor)
    begin
    if (~fpga_npor)
      reg_sys_rst <= 1'b0;
    else
      if ( sys_reset_req | wdog_reset_req | (LOCKUP & LOCKUPRESET))
        reg_sys_rst <= 1'b0;
      else
        reg_sys_rst <= 1'b1;
    end

  // RESETn for CPU #0 - This is released after CB_nRST deasserted.
  // You can also add addition reset control here.
  always @(posedge fclk or negedge fpga_reset_n)
    begin
    if (~fpga_reset_n)
      reg_cpu0_rst <= 1'b0;
    else
      if ( sys_reset_req | wdog_reset_req | (LOCKUP & LOCKUPRESET) | ~cs_nsrst_sync)
        reg_cpu0_rst <= 1'b0;
      else
        reg_cpu0_rst <= 1'b1;
    end

  assign hresetn      = reg_sys_rst;  // Current level - release after CB_nPOR
  assign presetn      = reg_sys_rst;  // Current level - release after CB_nPOR
  assign cpu0_hresetn = reg_cpu0_rst; // For CPU only - release after CB_nRST
  assign poresetn     = fpga_reset_n; // For CPU only - release after CB_nRST

  //---------------------------------------------------
  // Loop back of debug power up request to acknowledge
  //---------------------------------------------------
  reg    reg_cdbgpwrup_req;

  always @(posedge fclk or negedge fpga_reset_n)
    begin
    if (~fpga_reset_n)
      reg_cdbgpwrup_req <= 1'b0;
    else
      reg_cdbgpwrup_req <= CDBGPWRUPREQ;
    end

  assign CDBGPWRUPACK   = reg_cdbgpwrup_req;

  //---------------------------------------------------
  // Unused features of Cortex-M System Design Kit (CMSDK)
  //---------------------------------------------------
  assign WICENREQ       = 1'b0; // Not used
  assign SLEEPHOLDREQn  = 1'b1; // Not used

  //---------------------------------------------------
  // Expansion pin mapping
  // Necessary since Arduino board uses many of the expansion pins
  // Inputs are common to both Arduino board and GPIO modules
  //---------------------------------------------------
  wire [31:0]  io_exp_port_mcu_o;
  wire [31:0]  io_exp_port_mcu_oen;
  wire [31:0]  io_exp_port_mcu_altfunc;
  
  // Mapping
  assign io_exp_port_o[3:1]     = io_exp_port_mcu_o[3:1]; 
  assign io_exp_port_oen[3:1]   = io_exp_port_mcu_oen[3:1]; 
  assign io_exp_port_o[10:6]    = io_exp_port_mcu_o[10:6]; 
  assign io_exp_port_oen[10:6]  = io_exp_port_mcu_oen[10:6]; 
  assign io_exp_port_o[14]      = io_exp_port_mcu_o[14]; 
  assign io_exp_port_oen[14]    = io_exp_port_mcu_oen[14]; 
  assign io_exp_port_o[22:20]   = io_exp_port_mcu_o[22:20]; 
  assign io_exp_port_oen[22:20] = io_exp_port_mcu_oen[22:20]; 
  assign io_exp_port_o[25]      = io_exp_port_mcu_o[25]; 
  assign io_exp_port_oen[25]    = io_exp_port_mcu_oen[25]; 
  assign io_exp_port_o[29:27]   = io_exp_port_mcu_o[29:27]; 
  assign io_exp_port_oen[29:27] = io_exp_port_mcu_oen[29:27]; 

  //---------------------------------------------------
  // Reference system design from Cortex-M System Design Kit (CMSDK)
  //---------------------------------------------------
  cmsdk_mcu_system
   #(.CLKGATE_PRESENT       (CLKGATE_PRESENT),
     .BE                    (BE),
     .BASEADDR_GPIO0        (BASEADDR_GPIO0),   // GPIO0 Base Address
     .BASEADDR_GPIO1        (BASEADDR_GPIO1),   // GPIO1 Base Address
     .BKPT                  (BKPT),             // Number of breakpoint comparators
     .DBG                   (DBG),              // Debug configuration
     .NUMIRQ                (NUMIRQ),           // NUMIRQ
     .SMUL                  (SMUL),             // Multiplier configuration
     .SYST                  (SYST),             // SysTick
     .WIC                   (WIC),              // Wake-up interrupt controller support
     .WICLINES              (WICLINES),         // Supported WIC lines
     .WPT                   (WPT),              // Number of DWT comparators
     .BOOT_MEM_TYPE         (BOOT_MEM_TYPE),    // Boot loader memory type
     .INCLUDE_DMA           (INCLUDE_DMA),      // Include DMA feature
     .DMA_CHANNEL_NUM       (DMA_CHANNEL_NUM),  // Number of DMA channels
     .INCLUDE_BITBAND       (INCLUDE_BITBAND),  // Include bit band wrapper
     .INCLUDE_JTAG          (INCLUDE_JTAG),     // Include JTAG feature
     .BASEADDR_SYSROMTABLE  (BASEADDR_SYSROMTABLE) // System ROM Table base address
   )
    u_cmsdk_mcu_system (
    .FCLK                   (fclk),
    .HCLK                   (hclk_cpu),
    .DCLK                   (fclk),
    .SCLK                   (hclk_sys_cmsdk),
    .HRESETn                (cpu0_hresetn),
    .PORESETn               (poresetn),
    .DBGRESETn              (poresetn),
    .RSTBYPASS              (RSTBYPASS),        // Reset bypass control,

    .zbt_boot_ctrl          (zbt_boot_ctrl),    // MODIFICATION :
                                                // extra boot control to disable Block RAM at address 0

    .PCLK                   (pclk),
    .PCLKG                  (pclk_gated),
    .SLOWCLK                (pclk),             // Will need to change for non M0 cores
    .SLOWCLKG               (pclk_gated),       // Will need to change for non M0 cores
    .PRESETn                (presetn),
    .PCLKEN                 (1'b1),

    // Common AHB signals
    .HADDR                  (flash_haddr),
    .HTRANS                 (flash_htrans),
    .HSIZE                  (flash_hsize),
    .HWRITE                 (flash_hwrite),
    .HWDATA                 (flash_hwdata),
    .HREADY                 (flash_hready),

    // Flash
    .flash_hsel             (flash_hsel),
    .flash_hreadyout        (flash_hreadyout),
    .flash_hrdata           (flash_hrdata),
    .flash_hresp            (flash_hresp),

    // Optional boot loader
    // Only use if BOOT_MEM_TYPE is not zero
    .boot_hsel              (boot_hsel),
    .boot_hreadyout         (boot_hreadyout),
    .boot_hrdata            (boot_hrdata),
    .boot_hresp             (boot_hresp),

    // SRAM
    .sram_hsel              (cpusys_hsel),
    .sram_hreadyout         (cpusys_hreadyout),
    .sram_hrdata            (cpusys_hrdata),
    .sram_hresp             (cpusys_hresp),
    
    // Status
    .APBACTIVE              (APBACTIVE),
    .SLEEPING               (/* Unused */),
    .SYSRESETREQ            (sys_reset_req),
    .WDOGRESETREQ           (wdog_reset_req),
    .LOCKUP                 (LOCKUP),
    .LOCKUPRESET            (LOCKUPRESET),
    .PMUENABLE              (PMUENABLE),
    .SLEEPDEEP              (/* Unused */),

    .GATEHCLK               (GATEHCLK),
    .WAKEUP                 (/* Unused */),
    .WICENREQ               (WICENREQ),
    .WICENACK               (/* Unused */),
    .CDBGPWRUPREQ           (CDBGPWRUPREQ),
    .CDBGPWRUPACK           (CDBGPWRUPACK),
    .SLEEPHOLDREQn          (SLEEPHOLDREQn),
    .SLEEPHOLDACKn          (/* Unused */),

    // UART
    .uart0_rxd              (uart_rxd),
    .uart0_txd              (uart_txd),
    .uart0_txen             (/* Unused */),
    .uart1_rxd              (uart1_rxd),
    .uart1_txd              (uart1_txd),
    .uart1_txen             (/* Unused */),
    .uart2_rxd              (uart_rxd_mcu),
    .uart2_txd              (uart_txd_mcu),
    .uart2_txen             (uart_txd_enable),
    .uart3_rxd              (uart3_rxd),
    .uart3_txd              (uart3_txd),
    .uart3_txen             (/* Unused */),
    .uart4_rxd              (uart4_rxd),
    .uart4_txd              (uart4_txd),
    .uart4_txen             (/* Unused */),

    // Timer
    .timer0_extin           (io_exp_port_i[24]), // p1_in[8] in CMSDK example system
    .timer1_extin           (io_exp_port_i[25]), // p1_in[9] in CMSDK example system

    // IO Ports
    .p0_in                  (io_exp_port_i[15:0]),
    .p0_out                 (io_exp_port_mcu_o[15:0]),
    .p0_outen               (io_exp_port_mcu_oen[15:0]),
    .p0_altfunc             (io_exp_port_mcu_altfunc[15:0]),

    .p1_in                  (io_exp_port_i[31:16]),
    .p1_out                 (io_exp_port_mcu_o[31:16]),
    .p1_outen               (io_exp_port_mcu_oen[31:16]),
    .p1_altfunc             (io_exp_port_mcu_altfunc[31:16]),

    .spi_interrupt          (spi_interrupt),    // V2M-MPS2 interrupts
    .i2s_interrupt          (i2s_interrupt),    // V2M-MPS2 interrupts
    .eth_interrupt          (eth_interrupt),    // V2M-MPS2 interrupts
    .ts_interrupt           (ts_interrupt_sync),// V2M-MPS2 interrupts
    .gpio2_interrupt        (gpio2_interrupt),
    .gpio3_interrupt        (gpio3_interrupt),
    


    .nTRST                  (dbg_ntrst),
    .TDI                    (dbg_tdi),
    .SWCLKTCK               (dbg_swclk_tck),
    .SWDITMS                (dbg_swio_tms_i),
    .SWDO                   (dbg_swio_tms_o),
    .SWDOEN                 (dbg_swio_tms_en),
    .TDO                    (dbg_swo_tdo_o),
    .nTDOEN                 (dbg_swo_tdo_nen),
    
    .DBGRESTART             (DBGRESTART),
    .DBGRESTARTED           (/* Unused */),
    .EDBGRQ                 (EDBGRQ),

    .DFTSE                  (DFTSE)
  );
  
  // Unused debug feature
  assign DBGRESTART     = 1'b0;     // multi-core synchronous restart from halt
  assign EDBGRQ         = 1'b0;     // multi-core synchronous halt request

  assign DFTSE          = 1'b0;     // Design For Test Enable
  assign RSTBYPASS      = 1'b0;     // Reset bypass (for testing)

  // Tie off trace signals. Unused for M0 designs.
  assign trc_clk        = 1'b0;
  assign trc_data[15:0] = {16{1'b0}};
  assign trc_ctrl       = 1'b0;

  assign dbg_swo_tdo_en  = ~dbg_swo_tdo_nen;

  // Higher expansion IO ports, connected to local GPIO peripherals
  assign io_exp_port_o[51:45]   = {gpio3_out[ 3:0], gpio2_out[15:13]};
  assign io_exp_port_o[43:42]   = gpio2_out[11:10];
  assign io_exp_port_o[40]      = gpio2_out[8];
  assign io_exp_port_o[37:32]   = gpio2_out[5:0];
  assign io_exp_port_oen[51:45] = {gpio3_outen[ 3:0], gpio2_outen[15:13]};
  assign io_exp_port_oen[43:42] = gpio2_outen[11:10];
  assign io_exp_port_oen[40]    = gpio2_outen[8];
  assign io_exp_port_oen[37:32] = gpio2_outen[5:0];

  assign gpio2_in[15:0]         = io_exp_port_i[47:32];
  assign gpio3_in[15:0]         = {{12{1'b0}}, io_exp_port_i[51:48]};

 
  // Expansion port connections for Arduino board
  // Input pins have the output port driven to reduce Quartus warnings
  // ADC SPI
  assign  io_exp_port_o[19]   = ~io_exp_port_mcu_altfunc[19]  ? io_exp_port_mcu_o[19]
                                                              : adc_spi2_clk_out;          // ADC_SPI_SCK signal
                                                                
  assign  io_exp_port_oen[19] = ~io_exp_port_mcu_altfunc[19]  ? io_exp_port_mcu_oen[19]
                                                              : ~adc_spi2_clk_out_en_n;    // ADC_SPI_SCK OE

  assign  io_exp_port_o[18]   = ~io_exp_port_mcu_altfunc[18]  ? io_exp_port_mcu_o[18]
                                                              : adc_spi2_data_out;         // ADC_SPI_MOSI signal
                                                              
  assign  io_exp_port_oen[18] = ~io_exp_port_mcu_altfunc[18]  ? io_exp_port_mcu_oen[18]
                                                              : ~adc_spi2_data_out_en_n;   // ADC_SPI_MOSI OE
  
  assign  adc_spi2_data_in    = ~io_exp_port_mcu_altfunc[17]  ? 1'b0                    
                                                              : io_exp_port_i[17];         // ADC_SPI_MISO signal
                                                              
  assign  io_exp_port_o[17]   = ~io_exp_port_mcu_altfunc[17]  ? io_exp_port_mcu_o[17]   
                                                              : 1'b0;                      // ADC_SPI_MISO output not used
  assign  io_exp_port_oen[17] = ~io_exp_port_mcu_altfunc[17]  ? io_exp_port_mcu_oen[17]
                                                              : 1'b0;                      // ADC_SPI_MISO OE

  // SHIELD 0 I2C
  assign  io_exp_port_o[15]   = ~io_exp_port_mcu_altfunc[15]  ? io_exp_port_mcu_o[15]
                                                              : 1'b0;                        // SHIELD_0_SDA
                                                              
  assign  io_exp_port_oen[15] = ~io_exp_port_mcu_altfunc[15]  ? io_exp_port_mcu_oen[15] 
                                                              : ~shield0_sda_o_en_n;         // SHIELD_0_SDA
                                                              
  assign  shield0_sda_i       = ~io_exp_port_mcu_altfunc[15]  ? 1'b0
                                                              : io_exp_port_i[15];           // SHIELD_0_SDA

  assign  io_exp_port_o[5]    = ~io_exp_port_mcu_altfunc[5]   ? io_exp_port_mcu_o[5]
                                                              : shield0_scl;                 // SHIELD_0_SCL
                                                              
  assign  io_exp_port_oen[5]  = ~io_exp_port_mcu_altfunc[5]   ? io_exp_port_mcu_oen[5]
                                                              : 1'b1;                        // SHIELD_0_SCL

  // SHIELD 0 SPI
  assign  io_exp_port_o[11]   = ~io_exp_port_mcu_altfunc[11]  ? io_exp_port_mcu_o[11]
                                                              : shield0_spi3_clk_out;        // SHIELD_0_SPI_SCK
                                                              
  assign  io_exp_port_oen[11] = ~io_exp_port_mcu_altfunc[11]  ? io_exp_port_mcu_oen[11]
                                                              : ~shield0_spi3_clk_out_en_n;  // SHIELD_0_SPI_SCK

  assign  io_exp_port_o[13]   = ~io_exp_port_mcu_altfunc[13]  ? io_exp_port_mcu_o[13]
                                                              : shield0_spi3_data_out;       // SHIELD_0_SPI_MOSI
                                                              
  assign  io_exp_port_oen[13] = ~io_exp_port_mcu_altfunc[13]  ? io_exp_port_mcu_oen[13]
                                                              : ~shield0_spi3_data_out_en_n; // SHIELD_0_SPI_MOSI
  
  assign  shield0_spi3_data_in = 1'b0;                                                       // SHIELD_0_SPI_MISO - unused

  // SHIELD 1 I2C
  assign  io_exp_port_o[41]   = ~gpio2_altfunc[9]             ? gpio2_out[9]
                                                              : 1'b0;                        // SHIELD_1_SDA
                                                              
  assign  io_exp_port_oen[41] = ~gpio2_altfunc[9]             ? gpio2_outen[9]
                                                              : ~shield1_sda_o_en_n;         // SHIELD_1_SDA
                                                              
  assign  shield1_sda_i       = ~gpio2_altfunc[9]             ? 1'b0
                                                              : io_exp_port_i[41];           // SHIELD_1_SDA

  assign  io_exp_port_o[31]   = ~io_exp_port_mcu_altfunc[31]  ? io_exp_port_mcu_o[31]
                                                              : shield1_scl;                 // SHIELD_1_SCL
                                                              
  assign  io_exp_port_oen[31] = ~io_exp_port_mcu_altfunc[31]  ? io_exp_port_mcu_oen[31]
                                                              : 1'b1;                        // SHIELD_1_SCL

  // SHIELD 1 SPI
  assign  io_exp_port_o[44]   = ~gpio2_altfunc[12]            ? gpio2_out[12]
                                                              : shield1_spi4_clk_out;        // SHIELD_1_SPI_SCK
                                                              
  assign  io_exp_port_oen[44] = ~gpio2_altfunc[12]            ? gpio2_outen[12]
                                                              : ~shield1_spi4_clk_out_en_n;  // SHIELD_1_SPI_SCK

  assign  io_exp_port_o[39]   = ~gpio2_altfunc[7]             ? gpio2_out[7]
                                                              : shield1_spi4_data_out;       // SHIELD_1_SPI_MOSI
                                                              
  assign  io_exp_port_oen[39] = ~gpio2_altfunc[7]             ? gpio2_outen[7]
                                                              : ~shield1_spi4_data_out_en_n; // SHIELD_1_SPI_MOSI

  assign  shield1_spi4_data_in = 1'b0;                                                       // SHIELD_1_SPI_MISO - unused

  // Register controlled lines
  assign  io_exp_port_o[16]   = ~io_exp_port_mcu_altfunc[16]  ? io_exp_port_mcu_o[16]
                                                              : fpga_misc_int[7];            // ADC_SPI_nCS
                                                              
  assign  io_exp_port_oen[16] = ~io_exp_port_mcu_altfunc[16]  ? io_exp_port_mcu_oen[16]
                                                              : 1'b1;
                                                              
  assign  io_exp_port_o[12]   = ~io_exp_port_mcu_altfunc[12]  ? io_exp_port_mcu_o[12]
                                                              : fpga_misc_int[8];            // SHIELD_0_SPI_nCS
                                                              
  assign  io_exp_port_oen[12] = ~io_exp_port_mcu_altfunc[12]  ? io_exp_port_mcu_oen[12]
                                                              : 1'b1;
                                                              
  assign  io_exp_port_o[38]   = ~gpio2_altfunc[6]             ? gpio2_out[6]
                                                              : fpga_misc_int[9];            // SHIELD_1_SPI_nCS
                                                              
  assign  io_exp_port_oen[38] = ~gpio2_altfunc[6]             ? gpio2_outen[6]
                                                              : 1'b1;

  // UARTs
  assign  uart1_rxd           = ~io_exp_port_mcu_altfunc[23]  ? 1'b0
                                                              : io_exp_port_i[23];           // BT_UART_RXD
                                                              
  assign  io_exp_port_oen[23] = ~io_exp_port_mcu_altfunc[23]  ? io_exp_port_mcu_oen[23]
                                                              : 1'b0;                        // BT_UART_RXD
                                                              
  assign  io_exp_port_o[23]   = ~io_exp_port_mcu_altfunc[23]  ? io_exp_port_mcu_o[23]
                                                              : 1'b0;                        // BT_UART_RXD
                                                             
  assign  io_exp_port_o[24]   = ~io_exp_port_mcu_altfunc[24]  ? io_exp_port_mcu_o[24]
                                                              : uart1_txd;                   // BT_UART_TXD
                                                              
  assign  io_exp_port_oen[24] = ~io_exp_port_mcu_altfunc[24]  ? io_exp_port_mcu_oen[24]
                                                              : 1'b1;                        // BT_UART_TXD
                                                             
  assign  uart3_rxd           = ~io_exp_port_mcu_altfunc[0]   ? 1'b0
                                                              : io_exp_port_i[0];            // SHIELD_0_UART_RXD
                                                              
  assign  io_exp_port_oen[0]  = ~io_exp_port_mcu_altfunc[0]   ? io_exp_port_mcu_oen[0]
                                                              : 1'b0;                        // SHIELD_0_UART_RXD
                                                              
  assign  io_exp_port_o[0]    = ~io_exp_port_mcu_altfunc[0]   ? io_exp_port_mcu_o[0]
                                                              : 1'b0;                        // SHIELD_0_UART_RXD

  assign  io_exp_port_o[4]    = ~io_exp_port_mcu_altfunc[4]   ? io_exp_port_mcu_o[4]
                                                              : uart3_txd;                   // SHIELD_0_UART_TXD
                                                              
  assign  io_exp_port_oen[4]  = ~io_exp_port_mcu_altfunc[4]   ? io_exp_port_mcu_oen[4]
                                                              : 1'b1;                        // SHIELD_0_UART_TXD
                                                             
  assign  uart4_rxd           = ~io_exp_port_mcu_altfunc[26]  ? 1'b0
                                                              : io_exp_port_i[26];           // SHIELD_1_UART_RXD
                                                              
  assign  io_exp_port_oen[26] = ~io_exp_port_mcu_altfunc[26]  ? io_exp_port_mcu_oen[26]
                                                              : 1'b0;                        // SHIELD_1_UART_RXD
                                                              
  assign  io_exp_port_o[26]   = ~io_exp_port_mcu_altfunc[26]  ? io_exp_port_mcu_o[26]
                                                              : 1'b0;                        // SHIELD_1_UART_RXD
                                                             
  assign  io_exp_port_o[30]   = ~io_exp_port_mcu_altfunc[30]  ? io_exp_port_mcu_o[30]
                                                              : uart4_txd;                   // SHIELD_1_UART_TXD
                                                              
  assign  io_exp_port_oen[30] = ~io_exp_port_mcu_altfunc[30]  ? io_exp_port_mcu_oen[30]
                                                              : 1'b1;                        // SHIELD_1_UART_TXD


  // --------------------------------------------------------------------
  // Boot ROM - for booting up the system
  // --------------------------------------------------------------------

  ahb_blockram_32 #(
    .ADDRESSWIDTH      (14) // 16KB
  )  u_ahb_blockram_32 (
   //Inputs
   .HCLK                (hclk_sys),
   .HRESETn             (hresetn),
   .HSELBRAM            (boot_hsel),
   .HREADY              (flash_hready),
   .HTRANS              (flash_htrans),
   .HSIZE               (flash_hsize[1:0]),
   .HWRITE              (flash_hwrite),
   .HADDR               (flash_haddr[13:0]),
   .HWDATA              (flash_hwdata),
   //Outputs
   .HREADYOUT           (boot_hreadyout),
   .HRESP               (boot_hresp),
   .HRDATA              (boot_hrdata)
  );

  // --------------------------------------------------------------------
  // ZBT Synchronous SRAM for CODE region
  // --------------------------------------------------------------------
  wire            rdmux_sel;  // Mux ctrl for read data
  wire     [1:0]  zbt_sram1_ce_n;

  ahb_zbtram_64 #(
    .AW                 (23)                // 23 is 8MB
  ) u_ahb_zbtram_64 (
    // Inputs
    .HCLK               (hclk_sys),

    .HRESETn            (hresetn),
    .HSELSSRAM          (flash_hsel),
    .HREADYIn           (flash_hready),
    .HTRANS             (flash_htrans),
    .HSIZE              (flash_hsize[1:0]),
    .HWRITE             (flash_hwrite),
    .HADDR              (flash_haddr),

    .HWDATA             ({flash_hwdata[31:0],flash_hwdata[31:0]}),

    // Outputs
    .HREADYOut          (flash_hreadyout),   // always ready (zero wait state
    .HRESP              (flash_hresp),       // always okay
    .HRDATA             (flash_hrdata_64),


    .PADDR              (spi2mem_paddr),
    .PSEL               (spi2mem_s0_psel),
    .PENABLE            (spi2mem_penable),
    .PWRITE             (spi2mem_pwrite),
    .PSTRB              (spi2mem_pstrb),
    .PWDATA             (spi2mem_pwdata),
    .PRDATA             (spi2mem_s0_prdata),
    .PREADY             (spi2mem_s0_pready),
    .PSLVERR            (spi2mem_s0_pslverr),

    .SADDR              (zbt_sram1_a),
    .SDATAEN            (zbt_sram1_dq_oen),  // Active low 3-state enable
    .SnWBYTE            (zbt_sram1_bwn),
    .SnOE               (zbt_sram1_oen),     // Active low Output Enable
    .SnCE               (zbt_sram1_ce_n),    // Active low chip select
    .SADVnLD            (zbt_sram1_adv),     // Always 0
    .SnWR               (zbt_sram1_wen),     // Write enable
    .SnCKE              (zbt_sram1_cken),    // Always 0

    .SWDATA             (zbt_sram1_dq_o[63:0]),
    .SRDATA             (zbt_sram1_dq_i[63:0]),
    .rdmux_sel          (rdmux_sel)
  );

  // Since we are using a 32-bit bus master, we need to
  // do this read mux
  assign flash_hrdata = (rdmux_sel) ?
    flash_hrdata_64[63:32] : flash_hrdata_64[31:0];

  assign zbt_sram1_cen   =  &zbt_sram1_ce_n[1:0];
  assign zbt_sram1_zz    =  1'b0;
  assign zbt_sram1_lbon  =  1'b0;

  // --------------------------------------------------------------------
  // System Bus infrastructure
  // --------------------------------------------------------------------
  // SRAM AHB signals
  wire            sram2_hsel;
  wire    [31:0]  sram2_haddr;    // 4MB range
  wire            sram2_hresp;
  wire            sram2_hreadyout;
  wire    [31:0]  sram2_hrdata;

  wire            sram3_hsel;
  wire    [31:0]  sram3_haddr;    // 4MB range
  wire            sram3_hresp;
  wire            sram3_hreadyout;
  wire    [31:0]  sram3_hrdata;

  wire            fpga_apbsys_hsel;
  wire            fpga_apbsys_hresp;
  wire            fpga_apbsys_hreadyout;
  wire    [31:0]  fpga_apbsys_hrdata;


  wire            vga_hsel;
  wire            vga_hresp;
  wire            vga_hreadyout;
  wire    [31:0]  vga_hrdata;

  wire            gpio2_hsel;     // AHB GPIO bus interface signals
  wire            gpio2_hreadyout;
  wire    [31:0]  gpio2_hrdata;
  wire            gpio2_hresp;

  wire            gpio3_hsel;     // AHB GPIO bus interface signals
  wire            gpio3_hreadyout;
  wire    [31:0]  gpio3_hrdata;
  wire            gpio3_hresp;

  wire            defslv_hsel;
  wire            defslv_hresp;
  wire            defslv_hreadyout;
  wire    [31:0]  defslv_hrdata;

  wire            psram_hsel;
  wire            ethen_hsel;

  // SRAM2 and SRAM3 are both in SRAM region
  assign sram2_hsel = fpgasys_hsel & (fpgasys_haddr[31:23]==9'b0010_0000_0) & (~fpgasys_haddr[2]);
  assign sram3_hsel = fpgasys_hsel & (fpgasys_haddr[31:23]==9'b0010_0000_0) & ( fpgasys_haddr[2]);

  // SMI address range include PSRAM and ethernet
  assign psram_hsel = fpgasys_hsel & (fpgasys_haddr[31:24]==8'h21);
  assign ethen_hsel = fpgasys_hsel & (fpgasys_haddr[31:20]==12'h402);
  assign smi_hsel   = psram_hsel|ethen_hsel;

`ifdef INCLUDE_VGA
  // VGA
  assign vga_hsel = fpgasys_hsel & ((fpgasys_haddr[31:20]==12'h411)|(fpgasys_haddr[31:20]==12'h410));
`else
  assign vga_hsel = 1'b0;
`endif

  assign fpga_apbsys_hsel = fpgasys_hsel & (fpgasys_haddr[31:16]==16'h4002);
  assign gpio2_hsel       = fpgasys_hsel & (fpgasys_haddr[31:12]==20'h40012);
  assign gpio3_hsel       = fpgasys_hsel & (fpgasys_haddr[31:12]==20'h40013);
  assign defslv_hsel      = fpgasys_hsel &~(sram2_hsel|sram3_hsel|vga_hsel|
     fpga_apbsys_hsel|smi_hsel|gpio2_hsel|gpio3_hsel);

  // Addresses are interleave between two ZBT SSRAM
  assign sram2_haddr[31:0] = {{10{1'b0}},fpgasys_haddr[22:3],fpgasys_haddr[1:0]};
  assign sram3_haddr[31:0] = {{10{1'b0}},fpgasys_haddr[22:3],fpgasys_haddr[1:0]};


  // AHB Slave Mux
  cmsdk_ahb_slave_mux #(
    .PORT0_ENABLE       (1),                    // SRAM - lower word
    .PORT1_ENABLE       (1),                    // SRAM - upper word
    .PORT2_ENABLE       (1),                    // VGA
    .PORT3_ENABLE       (1),                    // APB subsystem
    .PORT4_ENABLE       (1),                    // Static Memory Interface
    .PORT5_ENABLE       (1),                    // GPIO #2
    .PORT6_ENABLE       (1),                    // GPIO #3
    .PORT7_ENABLE       (0),
    .PORT8_ENABLE       (0),
    .PORT9_ENABLE       (1))
    u_ahb_slave_mux_sys_bus (
    .HCLK               (hclk_sys),
    .HRESETn            (hresetn),
    .HREADY             (fpgasys_hready),
    .HSEL0              (sram2_hsel),           // Input Port 0
    .HREADYOUT0         (sram2_hreadyout),
    .HRESP0             (sram2_hresp),
    .HRDATA0            (sram2_hrdata),
    .HSEL1              (sram3_hsel),           // Input Port 1
    .HREADYOUT1         (sram3_hreadyout),
    .HRESP1             (sram3_hresp),
    .HRDATA1            (sram3_hrdata),
    .HSEL2              (vga_hsel),             // Input Port 2
    .HREADYOUT2         (vga_hreadyout),
    .HRESP2             (vga_hresp),
    .HRDATA2            (vga_hrdata),
    .HSEL3              (fpga_apbsys_hsel),     // Input Port 3
    .HREADYOUT3         (fpga_apbsys_hreadyout),
    .HRESP3             (fpga_apbsys_hresp),
    .HRDATA3            (fpga_apbsys_hrdata),
    .HSEL4              (smi_hsel),             // Input Port 4
    .HREADYOUT4         (smi_hreadyout),
    .HRESP4             (smi_hresp),
    .HRDATA4            (smi_hrdata),
    .HSEL5              (gpio2_hsel),           // Input Port 5
    .HREADYOUT5         (gpio2_hreadyout),
    .HRESP5             (gpio2_hresp),
    .HRDATA5            (gpio2_hrdata),
    .HSEL6              (gpio3_hsel),           // Input Port 6
    .HREADYOUT6         (gpio3_hreadyout),
    .HRESP6             (gpio3_hresp),
    .HRDATA6            (gpio3_hrdata),
    .HSEL7              (1'b0),                 // Input Port 7
    .HREADYOUT7         (1'b1),
    .HRESP7             (1'b0),
    .HRDATA7            ({32{1'b0}}),
    .HSEL8              (1'b0),                 // Input Port 8
    .HREADYOUT8         (1'b1),
    .HRESP8             (1'b0),
    .HRDATA8            ({32{1'b0}}),
    .HSEL9              (defslv_hsel),          // Input Port 9
    .HREADYOUT9         (defslv_hreadyout),
    .HRESP9             (defslv_hresp),
    .HRDATA9            (defslv_hrdata),

    .HREADYOUT          (fpgasys_hreadyout),    // Outputs
    .HRESP              (fpgasys_hresp),
    .HRDATA             (fpgasys_hrdata)
  );

  // Default slave
  cmsdk_ahb_default_slave u_ahb_default_slave_0 (
    .HCLK               (hclk_sys),
    .HRESETn            (hresetn),
    .HSEL               (defslv_hsel),
    .HTRANS             (fpgasys_htrans),
    .HREADY             (fpgasys_hready),
    .HREADYOUT          (defslv_hreadyout),
    .HRESP              (defslv_hresp)
  );

  assign defslv_hrdata = {32{1'b0}};

  // --------------------------------------------------------------------
  // ZBT Synchronous SRAM for System Bus
  // --------------------------------------------------------------------

  //-----------------------------
  // Lower word
  // Controller for ZBT SSRAM 2
  //
  ahb_zbtram_32 #(
    .AW                 (22)                // 4MB
  ) u_ahb_zbt_2 (
    // Inputs
    .HCLK               (hclk_sys),

    .HRESETn            (hresetn),
    .HSELSSRAM          (sram2_hsel),
    .HREADYIn           (fpgasys_hready),
    .HTRANS             (fpgasys_htrans),
    .HPROT              (4'b0000),          // Not used
    .HSIZE              (fpgasys_hsize[1:0]),
    .HWRITE             (fpgasys_hwrite),
    .HADDR              (sram2_haddr),

    // Outputs
    .HREADYOut          (sram2_hreadyout),  // always ready (zero wait state)
    .HRESP              (sram2_hresp),      // always okay

    .SADDR              (zbt_sram2_a),
    .SDATAEN            (zbt_sram2_dq_oen), // Active low 3-state enable
    .SnWBYTE            (zbt_sram2_bwn),
    .SnOE               (zbt_sram2_oen),    // Active low Output Enable
    .SnCE               (zbt_sram2_cen),    // Active low chip select
    .SADVnLD            (zbt_sram2_adv),    // Always 0
    .SnWR               (zbt_sram2_wen),    // Write
    .SnCKE              (zbt_sram2_cken)    // Always 0
  );

  assign zbt_sram2_dq_o  = fpgasys_hwdata[31: 0];
  assign sram2_hrdata    = zbt_sram2_dq_i;
  assign zbt_sram2_zz    =  1'b0;
  assign zbt_sram2_lbon  =  1'b0;

  //-----------------------------
  // Upper word
  // Controller for ZBT SSRAM 3
  //
  ahb_zbtram_32 #(
    .AW                 (22)                // 4MB
  ) u_ahb_zbt_3 (
    // Inputs
    .HCLK               (hclk_sys),

    .HRESETn            (hresetn),
    .HSELSSRAM          (sram3_hsel),
    .HREADYIn           (fpgasys_hready),
    .HTRANS             (fpgasys_htrans),
    .HPROT              (4'b0000),          // Not used
    .HSIZE              (fpgasys_hsize[1:0]),
    .HWRITE             (fpgasys_hwrite),
    .HADDR              (sram3_haddr),

    // Outputs
    .HREADYOut          (sram3_hreadyout),  // always ready (zero wait state)
    .HRESP              (sram3_hresp),      // always okay

    .SADDR              (zbt_sram3_a),
    .SDATAEN            (zbt_sram3_dq_oen), // Active low 3-state enable
    .SnWBYTE            (zbt_sram3_bwn),
    .SnOE               (zbt_sram3_oen),    // Active low Output Enable
    .SnCE               (zbt_sram3_cen),    // Active low chip select
    .SADVnLD            (zbt_sram3_adv),    // Always 0
    .SnWR               (zbt_sram3_wen),    // Write
    .SnCKE              (zbt_sram3_cken)    // Always 0
  );

  assign zbt_sram3_dq_o  = fpgasys_hwdata[31: 0];
  assign sram3_hrdata    = zbt_sram3_dq_i;
  assign zbt_sram3_zz    =  1'b0;
  assign zbt_sram3_lbon  =  1'b0;


  //-----------------------------
  // PSRAM interface
  // Use asynchronous read/write mode

  assign smi_haddr[25] = ~ethen_hsel; // Chip select for Ethernet
  assign smi_haddr[24] = ~psram_hsel; // Chip select for PSRAM
  assign smi_haddr[23:0] = fpgasys_haddr[23:0];

`ifdef INCLUDE_PSRAM
  // Note: actual address is 24 bit [23:0], but added two MSB for chip select
  cmsdk_ahb_to_extmem16_psram #(
    .AW                 (26)
  ) u_cmsdk_ahb_to_extmem16 (
    .HCLK               (hclk_sys),
    .HRESETn            (hresetn),

    .HSEL               (smi_hsel),
    .HADDR              (smi_haddr[25:0]),
    .HTRANS             (fpgasys_htrans),
    .HSIZE              (fpgasys_hsize), // [2:0]
    .HWRITE             (fpgasys_hwrite),
    .HWDATA             (fpgasys_hwdata),
    .HREADY             (fpgasys_hready),

    .HREADYOUT          (smi_hreadyout),
    .HRDATA             (smi_hrdata),
    .HRESP              (smi_hresp),

    .CFGREADCYCLE       (3'b111),
    .CFGWRITECYCLE      (3'b111),
    .CFGTURNAROUNDCYCLE (3'b111),
    .CFGSIZE            (1'b1), // 1 = 16-bit

    .DATAIN             (smb_data_i),
    .ADDR               (smb_addr),
    .DATAOUT            (smb_data_o),
    .DATAOEn            (smb_data_o_nen),
    .WEn                (smb_wen),
    .OEn                (smb_oen),
    .CEn                (smb_cen),
    .LBn                (smb_lbn),
    .UBn                (smb_ubn)
    );


  assign smb_nrd       = smb_cen | ~smb_wen;
  assign smb_nreset    = hresetn;

`else

  assign smb_addr      = {25{1'b0}};
  assign smb_data_o    = {16{1'b0}};
  assign smb_data_o_nen = 1'b1; // Active low
  assign smb_cen       = 1'b1;
  assign smb_oen       = 1'b1;
  assign smb_wen       = 1'b1;
  assign smb_ubn       = 1'b1;
  assign smb_lbn       = 1'b1;
  assign smb_nrd       = 1'b1;
  assign smb_nreset    = hresetn;


`endif
  // --------------------------------------------------------------------
  // VGA
  // --------------------------------------------------------------------
`ifdef INCLUDE_VGA
`ifdef VGA_8BIT_IMAGE
  wire   [7:0]  vga_scr_data;
`else
  wire   [11:0] vga_scr_data;
`endif

  AHBVGA u_ahbvga(
    .HCLK               (hclk_sys),         // 25MHz
    .HRESETn            (hresetn),
    .HCLKEN             (1'b1),
    .HADDR              (fpgasys_haddr[23:0]),
    .HWDATA             (fpgasys_hwdata),
    .HREADY             (fpgasys_hready),
    .HWRITE             (fpgasys_hwrite),
    .HTRANS             (fpgasys_htrans),
    .HSEL               (vga_hsel),

    .HRDATA             (vga_hrdata),       // Note: Not used, tied low
    .HREADYOUT          (vga_hreadyout),

    .hsync              (vga_hsync),
    .vsync              (vga_vsync),
    .rgb                (vga_scr_data)
  );

`ifdef VGA_8BIT_IMAGE
  assign vga_r     = {vga_scr_data[7:5], 1'b0};
  assign vga_g     = {vga_scr_data[4:2], 1'b0};
  assign vga_b     = {vga_scr_data[1:0], 2'b00};
`else
  assign vga_r     = vga_scr_data[11:8];
  assign vga_g     = vga_scr_data[7:4];
  assign vga_b     = vga_scr_data[3:0];
`endif

  assign vga_hresp = 1'b0;

`else
  assign vga_hsync = 1'b0;
  assign vga_vsync = 1'b0;
  assign vga_r     = {4{1'b0}};
  assign vga_g     = {4{1'b0}};
  assign vga_b     = {4{1'b0}};

  assign vga_hresp     = 1'b0;
  assign vga_hreadyout = 1'b1;
  assign vga_hrdata    = {32{1'b0}};

`endif

  // --------------------------------------------------------------------
  // FPGA level GPIO
  // --------------------------------------------------------------------

  cmsdk_ahb_gpio #(
    .ALTERNATE_FUNC_MASK     (16'hFFFF),    // Allow pin muxing for Port #2
    .ALTERNATE_FUNC_DEFAULT  (16'h0000),    // All pins default to GPIO
    .BE                      (BE)
    )
    u_ahb_gpio_2  (
   // AHB Inputs
    .HCLK               (hclk_sys),
    .HRESETn            (hresetn),
    .FCLK               (fclk),
    .HSEL               (gpio2_hsel),
    .HREADY             (fpgasys_hready),
    .HTRANS             (fpgasys_htrans),
    .HSIZE              (fpgasys_hsize),
    .HWRITE             (fpgasys_hwrite),
    .HADDR              (fpgasys_haddr[11:0]),
    .HWDATA             (fpgasys_hwdata),
   // AHB Outputs
    .HREADYOUT          (gpio2_hreadyout),
    .HRESP              (gpio2_hresp),
    .HRDATA             (gpio2_hrdata),

    .ECOREVNUM          (4'h0),             // Engineering-change-order revision bits

    .PORTIN             (gpio2_in),         // GPIO Interface inputs
    .PORTOUT            (gpio2_out),        // GPIO Interface outputs
    .PORTEN             (gpio2_outen),
    .PORTFUNC           (gpio2_altfunc),    // Alternate function control

    .GPIOINT            (),                 // Interrupt outputs
    .COMBINT            (gpio2_interrupt)
  );


  cmsdk_ahb_gpio #(
    .ALTERNATE_FUNC_MASK     (16'hFFFF), // Allow pin muxing for Port #3
    .ALTERNATE_FUNC_DEFAULT  (16'h0000), // All pins default to GPIO
    .BE                      (BE)
    )
    u_ahb_gpio_3  (
   // AHB Inputs
    .HCLK               (hclk_sys),
    .HRESETn            (hresetn),
    .FCLK               (fclk),
    .HSEL               (gpio3_hsel),
    .HREADY             (fpgasys_hready),
    .HTRANS             (fpgasys_htrans),
    .HSIZE              (fpgasys_hsize),
    .HWRITE             (fpgasys_hwrite),
    .HADDR              (fpgasys_haddr[11:0]),
    .HWDATA             (fpgasys_hwdata),
   // AHB Outputs
    .HREADYOUT          (gpio3_hreadyout),
    .HRESP              (gpio3_hresp),
    .HRDATA             (gpio3_hrdata),

    .ECOREVNUM          (4'h0),// Engineering-change-order revision bits

    .PORTIN             (gpio3_in),   // GPIO Interface inputs
    .PORTOUT            (gpio3_out),  // GPIO Interface outputs
    .PORTEN             (gpio3_outen),
    .PORTFUNC           (gpio3_altfunc), // Alternate function control

    .GPIOINT            (),  // Interrupt outputs
    .COMBINT            (gpio3_interrupt)
  );

  // --------------------------------------------------------------------
  // FPGA APB subsystem
  // --------------------------------------------------------------------

  fpga_apb_subsystem u_fpga_apb_subsystem (
    .hclk               (hclk_sys),
    .hresetn            (hresetn),
    .fpga_npor          (fpga_npor),
    .clk_100hz          (clk_100hz),

    .hsel               (fpga_apbsys_hsel),
    .haddr              (fpgasys_haddr[15:0]),
    .htrans             (fpgasys_htrans),
    .hsize              (fpgasys_hsize),
    .hprot              (4'b0101), // Bufferable, unprivileged, data
    .hwrite             (fpgasys_hwrite),
    .hready             (fpgasys_hready),
    .hwdata             (fpgasys_hwdata),
    .hrdata             (fpga_apbsys_hrdata),
    .hresp              (fpga_apbsys_hresp),
    .hreadyout          (fpga_apbsys_hreadyout),

    .buttons            (buttons),
    .leds               (leds),
    .fpga_misc          (fpga_misc_int),

    .sbcon_sda_i0       (clcd_sda_i),
    .sbcon_scl0         (clcd_scl),
    .sbcon_sdaouten0_n  (clcd_sda_o_en_n),

    .sbcon_sda_i1       (audio_sda_i),
    .sbcon_scl1         (audio_scl),
    .sbcon_sdaouten1_n  (audio_sda_o_en_n),

    // New for Arduino board
    // Shield 0 I2C
    .sbcon_sda_i2       (shield0_sda_i),
    .sbcon_scl2         (shield0_scl),
    .sbcon_sdaouten2_n  (shield0_sda_o_en_n),

    // Shield 1 I2C
    .sbcon_sda_i3       (shield1_sda_i),
    .sbcon_scl3         (shield1_scl),
    .sbcon_sdaouten3_n  (shield1_sda_o_en_n),

    .ssp0_din           (spi0_data_in),
    .ssp0_dout          (spi0_data_out),
    .ssp0_dout_en_n     (spi0_data_out_en_n),
    .ssp0_clk_in        (1'b0),             // This used as SPI master only. No SPI clock in
    .ssp0_clk_out       (spi0_clk_out),
    .ssp0_clk_out_en_n  (spi0_clk_out_en_n),
    .ssp0_fss_in        (1'b0),             // Frame select in. This used as SPI master only
    .ssp0_fss_out       (spi0_sel),

    .ssp1_din           (spi1_data_in),
    .ssp1_dout          (spi1_data_out),
    .ssp1_dout_en_n     (spi1_data_out_en_n),
    .ssp1_clk_in        (1'b0),             // This used as SPI master only. No SPI clock in
    .ssp1_clk_out       (spi1_clk_out),
    .ssp1_clk_out_en_n  (spi1_clk_out_en_n),
    .ssp1_fss_in        (1'b0),             // Frame select in. This used as SPI master only
    .ssp1_fss_out       (spi1_sel),
    .ssp_interrupt      (spi_interrupt),

    // New for Arduino board
    // ADC SPI
    .ssp2_din           (adc_spi2_data_in),
    .ssp2_dout          (adc_spi2_data_out),
    .ssp2_dout_en_n     (adc_spi2_data_out_en_n),
    .ssp2_clk_in        (1'b0), // This used as SPI master only. No SPI clock in
    .ssp2_clk_out       (adc_spi2_clk_out),
    .ssp2_clk_out_en_n  (adc_spi2_clk_out_en_n),
    .ssp2_fss_in        (1'b0),// Frame select in. This used as SPI master only
    .ssp2_fss_out       (adc_spi2_sel),
    
    // Shield 0 SPI
    .ssp3_din           (shield0_spi3_data_in),
    .ssp3_dout          (shield0_spi3_data_out),
    .ssp3_dout_en_n     (shield0_spi3_data_out_en_n),
    .ssp3_clk_in        (1'b0), // This used as SPI master only. No SPI clock in
    .ssp3_clk_out       (shield0_spi3_clk_out),
    .ssp3_clk_out_en_n  (shield0_spi3_clk_out_en_n),
    .ssp3_fss_in        (1'b0),// Frame select in. This used as SPI master only
    .ssp3_fss_out       (shield0_spi3_sel),
    
    // Shield 1 SPI
    .ssp4_din           (shield1_spi4_data_in),
    .ssp4_dout          (shield1_spi4_data_out),
    .ssp4_dout_en_n     (shield1_spi4_data_out_en_n),
    .ssp4_clk_in        (1'b0), // This used as SPI master only. No SPI clock in
    .ssp4_clk_out       (shield1_spi4_clk_out),
    .ssp4_clk_out_en_n  (shield1_spi4_clk_out_en_n),
    .ssp4_fss_in        (1'b0),// Frame select in. This used as SPI master only
    .ssp4_fss_out       (shield1_spi4_sel),
   

    .audio_mclk         (audio_mclk),       // Audio codec master clock (12.288MHz)
    .audio_sclk         (audio_sclk),       // Audio interface bit clock
    .audio_lrck         (audio_lrck),       // Audio Left/Right clock
    .audio_sdout        (audio_sdout),      // Audio DAC data
    .audio_sdin         (audio_sdin),       // Audio ADC data
    .audio_nRST         (audio_nrst),       // Audio reset

    .i2s_interrupt      (i2s_interrupt),
    .cfgint             (cfgint),

    .CFGCLK             (CFGCLK),
    .nCFGRST            (nCFGRST),
    .CFGLOAD            (CFGLOAD),
    .CFGWnR             (CFGWnR),
    .CFGDATAIN          (CFGDATAIN),
    .CFGDATAOUT         (CFGDATAOUT),
    .dll_locked         (dll_locked),
    .zbt_boot_ctrl      (zbt_boot_ctrl)
    );

  // --------------------------------------------------------------------
  // SPI to APB, but no error response support
  // --------------------------------------------------------------------
  // Need to synchronise the reset to the module clock
  fpga_rst_sync  u_fpga_rst_sync (
    .clk                (hclk_sys),
    .rst_n_in           (fpga_npor),
    .rst_request        (1'b0),
    .rst_n_out          (fpga_npor_sync)
  );

  SPI2APB3 u_spi2apb3(
    .SPICLK             (config_spiclk),
    .SPIDI              (config_spidi),
    .SPIDO              (config_spido),
  //APB
    .PRESETn            (fpga_npor_sync),     // CB_nPOR with delay
    .PCLK               (hclk_sys),
    .PADDR              (spi2mem_paddr),
    .PSEL               (spi2mem_psel),
    .PENABLE            (spi2mem_penable),
    .PWRITE             (spi2mem_pwrite),
    .PSTRB              (spi2mem_pstrb),
    .PWDATA             (spi2mem_pwdata),
    .PRDATA             (spi2mem_prdata),
    .PREADY             (spi2mem_pready),
    .SPI_CFGDATA        ()
  );

  assign spi2mem_s0_psel = spi2mem_psel & (spi2mem_paddr[31:24] == 8'h00);
  assign spi2mem_s1_psel = spi2mem_psel & (~spi2mem_s0_psel);

  // Slave Mux
  assign spi2mem_prdata  = (spi2mem_s0_psel) ? spi2mem_s0_prdata : spi2mem_s1_prdata;
  assign spi2mem_pready  = (spi2mem_s0_psel) ? spi2mem_s0_pready : spi2mem_s1_pready;

  // APB to AHB - support word size only
  assign spi2mem_s1_hsel  = spi2mem_s1_psel;
  assign spi2mem_s1_haddr = spi2mem_paddr;
  assign spi2mem_s1_hsize = 2'b10; // Word size only
  assign spi2mem_s1_htrans= (spi2mem_psel & ~spi2mem_penable) ? 2'b10: 2'b00;
  assign spi2mem_s1_hwrite= spi2mem_pwrite;
  assign spi2mem_s1_hwdata= spi2mem_pwdata;
  assign spi2mem_s1_prdata= spi2mem_s1_hrdata;
  assign spi2mem_s1_pready= spi2mem_s1_hready;
  assign spi2mem_s1_pslverr=spi2mem_s1_hresp & spi2mem_s1_hready;

  // Simple bus mux
  // Note: This is not a real multi-layer AHB design
  //       It only allow the SPI to configure ethernet and download images
  //       to the memory before the system start.
  //       Once the system is running the SPI to APB/AHB bridge must not
  //       be used.

  fpga_sys_bus_mux u_fpga_sys_bus_mux (
    .hclk              (hclk_sys),
    .hresetn           (hresetn),

    .spibus_select     (spi2mem_psel), // 0 = processor, 1 = SPI

  // Bus connection from processor
    .cpusys_hsel       (cpusys_hsel),  // select
    .cpusys_haddr      (flash_haddr),  // address
    .cpusys_htrans     (flash_htrans), // transfer control
    .cpusys_hsize      (flash_hsize),  // size
    .cpusys_hwrite     (flash_hwrite), // write control
    .cpusys_hwdata     (flash_hwdata), // write data
    .cpusys_hready     (flash_hready), // ready

    .cpusys_hreadyout  (cpusys_hreadyout), // ready
    .cpusys_hrdata     (cpusys_hrdata),    // read data output from SRAM
    .cpusys_hresp      (cpusys_hresp),     // response

  // AHB connection from SPI to APB/AHB block
    .spi2mem_s1_hsel   (spi2mem_s1_hsel),
    .spi2mem_s1_haddr  (spi2mem_s1_haddr),
    .spi2mem_s1_htrans (spi2mem_s1_htrans),
    .spi2mem_s1_hwrite (spi2mem_s1_hwrite),
    .spi2mem_s1_hwdata (spi2mem_s1_hwdata),
    .spi2mem_s1_hsize  (spi2mem_s1_hsize),

    .spi2mem_s1_hrdata (spi2mem_s1_hrdata),
    .spi2mem_s1_hready (spi2mem_s1_hready),
    .spi2mem_s1_hresp  (spi2mem_s1_hresp),

  // AHB connection to FPGA system
    .fpgasys_hsel      (fpgasys_hsel),   // select
    .fpgasys_haddr     (fpgasys_haddr),  // address
    .fpgasys_htrans    (fpgasys_htrans), // transfer control
    .fpgasys_hsize     (fpgasys_hsize),  // size
    .fpgasys_hwrite    (fpgasys_hwrite), // write control
    .fpgasys_hwdata    (fpgasys_hwdata), // write data
    .fpgasys_hready    (fpgasys_hready), // ready

    .fpgasys_hreadyout (fpgasys_hreadyout), // ready
    .fpgasys_hrdata    (fpgasys_hrdata),    // read data output from SRAM
    .fpgasys_hresp     (fpgasys_hresp)      // response
  );

  // --------------------------------------------------------------------
  // Ethernet interrupt synchronisation
  // --------------------------------------------------------------------
  wire   SMB_ETH_IRQ = ~SMB_ETH_IRQ_n; // Input is active low

  // Simple interrupt signal synchroniser
  // (Reference design from CMSDK)
  cmsdk_irq_sync u_eth_irq_sync (
    .RSTn               (hresetn),
    .CLK                (hclk_sys),
    .IRQIN              (SMB_ETH_IRQ),
    .IRQOUT             (eth_interrupt)
  );

  cmsdk_irq_sync u_ts_irq_sync (
    .RSTn               (hresetn),
    .CLK                (hclk_sys),
    .IRQIN              (ts_interrupt),
    .IRQOUT             (ts_interrupt_sync)
  );

endmodule



