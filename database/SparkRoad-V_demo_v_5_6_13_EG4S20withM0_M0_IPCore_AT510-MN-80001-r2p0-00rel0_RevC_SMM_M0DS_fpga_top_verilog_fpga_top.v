//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2014-2015 ARM Limited or its affiliates.
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
// Abstract : V2M-MPS2 FPGA Top Level
//------------------------------------------------------------------------------
// Note : Verilog2K coding style used
`include "fpga_options_defs.v"
module fpga_top (
    input  wire [2:0]    OSCCLK,         // Oscillator #0 - 50MHz
                                         // Oscillator #1 - 24.576MHz
                                         // Oscillator #2 - 25MHz Reference
    input  wire          CB_nRST,        // Reset
    input  wire          CB_nPOR,        // Power on reset - this is released first

    // Note: CB_nPOR is released first. Code is downloaded to ZBTRAM, then
    //       CB_nRST is released afterwards.

    output wire [1:0]    CLKOUT,         // PLL generated clock
    input  wire [1:0]    CLKIN,          // Loop back clock from CLKOUT

    // --------------------------------------------------------------------
    // I/Os
    // --------------------------------------------------------------------
    output wire [1:0]    USER_LED,       // LEDs
    input  wire [1:0]    USER_PB,        // Push buttons

    // User expansion ports
    inout  wire [51:0]   EXP,            // I/O expansion port
    inout  wire [17:0]   TP,             // Unused test points
    // --------------------------------------------------------------------
    // Debug and Trace
    // --------------------------------------------------------------------
    input  wire          CS_GNDDETECT,   // Ground detect
    input  wire          CS_nTRST,       // JTAG nTRST
    input  wire          CS_TDI,         // JTAG TDI
    input  wire          CS_TCK,         // SWD Clk / JTAG TCK
    inout  wire          CS_TMS,         // SWD I/O / JTAG TMS
    output wire          CS_TDO,         // SWV     / JTAG TDO
    input  wire          CS_nSRST,       // Not required for Cortex-M
    output wire          CS_TRACECLK,    // Trace clock
    output wire          CS_TRACECTL,    // Trace control
    output wire [15:0]   CS_TRACEDATA,   // Trace data

    // --------------------------------------------------------------------
    // ZBT Synchronous SRAM
    // --------------------------------------------------------------------
    // 64-bit ZBT Synchronous SRAM1 connections
    output wire [1:0]    SSRAM1_CLK,     // Clocks
    output wire [20:0]   SSRAM1_A,       // Address
    inout  wire [63:0]   SSRAM1_DQ,      // Data
    output wire [7:0]    SSRAM1_nBW,     // Byte lane writes (active low)
    inout  wire [7:0]    SSRAM1_DQP,     // Parity - not used
    output wire          SSRAM1_nCE1,    // Chip Select (active low)
    output wire          SSRAM1_nWE,     // Write enable (lower 32-bit, active low)
    output wire          SSRAM1_nCEN,    // Write clock enable (active low, tied to 0)
    output wire          SSRAM1_nOE,     // Output enable (active low)
    output wire          SSRAM1_MODE,    // Not used (tied to 0)
    output wire          SSRAM1_ADVnLD,  // Not used (tied to 0)
    output wire          SSRAM1_ZZ,      // Not used (tied to 0)

    // 32-bit ZBT Synchronous SRAM0 connections
    output wire          SSRAM2_CLK,     // Clock
    output wire [20:0]   SSRAM2_A,       // Address
    inout  wire [31:0]   SSRAM2_DQ,      // Data (byte lane #A)
    output wire [3:0]    SSRAM2_nBW,     // Byte lane writes (active low)
    inout  wire [3:0]    SSRAM2_DQP,     // not used
    output wire          SSRAM2_nCE1,    // Chip Select (active low)
    output wire          SSRAM2_nWE,     // Write enable (active low)
    output wire          SSRAM2_nCEN,    // Write clock enable (active low, tied to 0)
    output wire          SSRAM2_nOE,     // Output enable (active low)
    output wire          SSRAM2_MODE,    // Not used (tied to 0)
    output wire          SSRAM2_ADVnLD,  // Not used (tied to 0)
    output wire          SSRAM2_ZZ,      // Not used (tied to 0)

    // 32-bit ZBT Synchronous SRAM3 connections
    output wire          SSRAM3_CLK,     // ClockSSRAM1_CLK
    output wire [20:0]   SSRAM3_A,       // Address
    inout  wire [31:0]   SSRAM3_DQ,      // Data (byte lane #A)
    output wire [3:0]    SSRAM3_nBW,     // Byte lane writes (active low)
    inout  wire [3:0]    SSRAM3_DQP,     // not used
    output wire          SSRAM3_nCE1,    // Chip Select (active low)
    output wire          SSRAM3_nWE,     // Write enable (active low)
    output wire          SSRAM3_nCEN,    // Write clock enable (active low, tied to 0)
    output wire          SSRAM3_nOE,     // Output enable (active low)
    output wire          SSRAM3_MODE,    // Not used (tied to 0)
    output wire          SSRAM3_ADVnLD,  // Not used (tied to 0)
    output wire          SSRAM3_ZZ,      // Not used (tied to 0)

    // --------------------------------------------------------------------
    // SMB
    // --------------------------------------------------------------------
    output wire  [22:0]  SMB_A,          // Address
    inout  wire  [15:0]  SMB_DQ,         // Data
    input  wire          SMB_ETH_IRQ,    // Ethernet IRQ
    output wire          SMB_ETH_nCS,    // Ethernet chip select (active low)
    output wire          SMB_nLB,        // Lower byte select (active low)
    output wire          SMB_nOE,        // Output enable (active low)
    output wire          SMB_nRD,        // Read (active low)
    output wire          SMB_nRESET,     // Reset (active low)
    output wire          SMB_nUB,        // Upper byte select (active low)
    output wire          SMB_nWE,        // Write enable (active low)
    output wire  [1:0]   SMB_PSRAM_nCE,  // PSRAM chip select (active low)
    output wire          SMB_nZZ,        // Sleep (active low)

    // --------------------------------------------------------------------
    // UART
    // --------------------------------------------------------------------
    input  wire          UART_RXD,       // UART receive data
    output wire          UART_TXD,       // UART transmit data

    // --------------------------------------------------------------------
    // SPI
    // --------------------------------------------------------------------
    output wire          SPI_SCK,        // SPI clock
    output wire          SPI_MOSI,       // SPI data out
    input  wire          SPI_MISO,       // SPI data in
    output wire          SPI_nSS,        // SPI device select

    // --------------------------------------------------------------------
    // VGA
    // --------------------------------------------------------------------
    output reg           VGA_HSYNC,      // VGA H-Sync
    output reg           VGA_VSYNC,      // VGA V-Sync
    output reg  [3:0]    VGA_R,          // VGA red data
    output reg  [3:0]    VGA_G,          // VGA green data
    output reg  [3:0]    VGA_B,          // VGA blue data

    // --------------------------------------------------------------------
    // Audio
    // --------------------------------------------------------------------
    output wire          AUD_MCLK,       // Audio codec master clock (12MHz)
    output wire          AUD_SCLK,       // Audio interface bit clock
    output wire          AUD_LRCK,       // Audio Left/Right clock
    input  wire          AUD_SDOUT,      // Audio DAC data
    output wire          AUD_SDIN,       // Audio ADC data
    output wire          AUD_nRESET,     // Audio Reset (active low)
    output wire          AUD_SCL,        // Serial Control Port Clock
    inout  wire          AUD_SDA,        // Serial Control Data

    // --------------------------
    // Colour LCD
    // --------------------------
    // Display
    output wire          CLCD_CS,        // Chip select
    output wire          CLCD_RS,        // Command / display data selection
    output wire          CLCD_WR_SCL,    // Serial clock out
    output wire          CLCD_RD,        // Read
    output wire          CLCD_RESET,     // Reset
    inout  wire [17:10]  CLCD_PDH,       // Configuration signals
    inout  wire [8:1]    CLCD_PDL,       // CLCD_PL[5:1] connect to CLCD header
                                         // CLCD_PL[8:6] are configuration signals
                                         // CLCD_PD[LH] signals have this name for legacy reasons
    output wire          CLCD_BL_CTRL,   // Back-light enable
    input  wire          CLCD_SDO,       // Data out of CLCD into FPGA
    output wire          CLCD_SDI,       // Data out of FPGA into CLCD
    // Touch screen
    output wire          CLCD_T_SCL,     // Serial clock
    inout  wire          CLCD_T_SDA,     // Serial data
    input wire           CLCD_T_CS,      // Interrupt
    output wire          CLCD_T_SCK,     // Not used

    // --------------------------------------------------------------------
    // FPGA config
    // --------------------------------------------------------------------
    output wire          FPGA_CONFIG_nLRST,     // Config interrupt

    // Partial reconfiguration Pins
    // input  wire          DCLK,                  // Config clock
    output wire          PR_ERROR,              // PR config error
    input  wire [15:5]   PR_DATA,               // PR_DATA
    input  wire          PR_REQUEST,            // PR_REQUEST
    output wire          PR_READY,              // PR_READY
    output wire          CRC_ERROR,             // PR config CRC error
    output wire          PR_DONE                // PR_DONE

    ); // end of top level pin list

    // --------------------------------------------------------------------
    // internal wires
    // --------------------------------------------------------------------
    wire          clk_system;                    // Clock for system
    wire          clk_zbtout;                    // To allow phase shift
    wire          clk_25mhz_ref;                 // 25MHz clock for reference
    wire          clk_100hz;                     // Reference clock
    wire          fclk;                          // Free running clock
    wire          audio_mclk;                    // 12.288MHz
    wire          audio_sclk;                    //  3.072MHz
    wire [7:0]    pll_locked;                    // Individual PLL locks
    wire          pll_all_locked;                // PLL is locked
    wire          cs_traceclk_link;              // Trace clock to DDR output pad driver
    wire          aud_lrck_link;                 // Audio Left/Right clock to DDR output pad driver

    reg           fpga_reset_n;                  // FPGA reset (active low)
    reg           fpga_npor;                     // Power on reset (active low)
    reg  [7:0]    board_rst_counter;             // Counts till reset
    wire          board_rst_counter_done;        // Flag
    wire          cb_npor_sync;                  // Internal reset sync
    wire          cb_nrst_sync;                  // Internal reset sync
    wire          cs_nsrst_sync;                 // internal reset sync

    wire [51:0]   io_exp_port_i;                 // I/O port outputs
    wire [51:0]   io_exp_port_o;                 // I/O port outputs
    wire [51:0]   io_exp_port_oen;               // I/O port output enables
    wire [6:0]    fpga_misc;                     // Control signals
    wire          cfgint;                        // Interrupt from FPGA to MCU

    wire          dbg_swio_tms_o;                // SWD I/O 3-state output
    wire          dbg_swio_tms_en;               // SWD I/O 3-state enable
    wire          dbg_swo_tdo_o;                 // SWV / JTAG TDO
    wire          dbg_swo_tdo_en;                // SWV / JTAG TDO tristata enable

    wire [63:0]   zbt_sram1_dq_o;                // Data Output (byte lane #A)
    wire          zbt_sram1_dq_oen;              // 3-state Buffer Enable (active low)
    wire [31:0]   zbt_sram2_dq_o;                // Data Output
    wire          zbt_sram2_dq_oen;              // 3-state Buffer Enable (active low)
    wire [31:0]   zbt_sram3_dq_o;                // Data Output
    wire          zbt_sram3_dq_oen;              // 3-state Buffer Enable (active low)

    wire          audio_sda_o_en_n;              // Serial data output 3-state enable
    wire          clcd_sda_o_en_n;               // Serial data output 3-state enable

    wire          uart_rxd_mcu_i;                // Microcontroller UART receive data
    wire          uart_txd_mcu_o;                // Microcontroller UART transmit data
    wire          uart_txd_mcu_o_en;             // Microcontroller UART transmit data output enable

    wire          CFGCLK;                        // Serial communication i/f clock
    wire          nCFGRST;                       // Serial communication i/f reset
    wire          CFGLOAD;                       // Serial communication i/f LOAD
    wire          CFGWnR;                        // Serial communication i/f Write (1), Read (0)
    wire          CFGDATAIN;                     // Serial communication i/f Data In
    wire          CFGDATAOUT;                    // Serial communication i/f Data Out

    wire          spi0_clk_out;                  // SPI clock output
    wire          spi0_clk_out_en_n;             // SPI clock output 3-state enable
    wire          spi0_data_out;                 // SPI data output
    wire          spi0_data_out_en_n;            // SPI data output  3-state enable
    wire          spi1_clk_out;                  // SPI clock output
    wire          spi1_clk_out_en_n;             // SPI clock output 3-state enable
    wire          spi1_data_out;                 // SPI data output
    wire          spi1_data_out_en_n;            // SPI data output  3-state enable

    wire [15:0]   smb_data_o;                    // Static Memory Bus data out
    wire          smb_data_o_nen;                // Static Memory Bus data out enable (3-state ctrl)
    wire [25:0]   smb_addr_extra;                // Static Memory Bus address with extra bit used as chip select
    wire          smb_nce;                       // Static Memory Bus chip enable

    // SPI to memory : for MCU to access memory
    wire          config_spiclk;                 // SPI to memory : clock
    wire          config_spidi;                  // SPI to memory : data in
    wire          config_spido;                  // SPI to memory : data out

    wire [3:0]    ivga_r;                        // VGA red data
    wire [3:0]    ivga_g;                        // VGA green data
    wire [3:0]    ivga_b;                        // VGA blue data
    wire          ivga_h;                        // VGA horizontal sync
    wire          ivga_v;                        // VGA vertical sync

    wire          pr_active;         // PR programming taking place
    wire          reset_100hz_n;                 // Synced reset for 100Hz gen

    // Unused output
    assign CLCD_T_SCK = 1'b0;

    // --------------------------------------------------------------------
    // PLL
    // --------------------------------------------------------------------

    fpga_pll u_fpga_pll (
      .osc         (OSCCLK[2:0]),     // Oscillator #0 : 50MHz
                                      // Oscillator #1 : 24.576MHz
                                      // Oscillator #2 : 25 MHz (Not used)
      .reset_n     (CB_nPOR),
      .fclk        (clk_system),      // Free running clock (25MHz)
      .clk_zbtout  (clk_zbtout),      // phase shifted clock (25MHz)
      .mclk        (audio_mclk),      // 12.288MHz clock for audio
      .sclk        (audio_sclk),      // 3.072MHz clock for audio
      .pll_locked  (pll_locked[1:0])  // PLL locked
      );

    assign fclk            = clk_system;
    assign clk_25mhz_ref   = OSCCLK[2]; // Reference 25MHz
    assign pll_locked[7:2] = 6'b111111; // Unused locks
    assign pll_all_locked  = (pll_locked[7:0] == 8'hFF);

    `ifndef SIMULATION
      ddr_out  u_ddr_out_inst0 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (clk_zbtout),
        .dataout  (SSRAM1_CLK[0])
      );
      ddr_out  u_ddr_out_inst1 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (clk_zbtout),
        .dataout  (SSRAM1_CLK[1])
      );
      ddr_out  u_ddr_out_inst2 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (clk_zbtout),
        .dataout  (SSRAM2_CLK)
      );
      ddr_out  u_ddr_out_inst3 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (clk_zbtout),
        .dataout  (SSRAM3_CLK)
      );
      ddr_out  u_ddr_out_inst4 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (clk_system),
        .dataout  (CLKOUT[0])
      );
      ddr_out  u_ddr_out_inst5 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (audio_sclk),
        .dataout  (CLKOUT[1])
      );
      ddr_out  u_ddr_out_inst6 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (cs_traceclk_link),
        .dataout  (CS_TRACECLK)
      );
      ddr_out  u_ddr_out_inst7 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (audio_mclk),
        .dataout  (AUD_MCLK)
      );
      ddr_out  u_ddr_out_inst8 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (audio_sclk),
        .dataout  (AUD_SCLK)
      );
      ddr_out  u_ddr_out_inst9 (
        .datain_h (1'b1),
        .datain_l (1'b0),
        .outclock (aud_lrck_link),
        .dataout  (AUD_LRCK)
      );
   `else
      assign SSRAM1_CLK[0] = clk_zbtout;
      assign SSRAM1_CLK[1] = clk_zbtout;
      assign SSRAM2_CLK    = clk_zbtout;
      assign SSRAM3_CLK    = clk_zbtout;
      // Loop back connection
      assign CLKOUT[0]     = clk_system;
      assign CLKOUT[1]     = audio_sclk;
      assign CS_TRACECLK   = cs_traceclk_link;
      assign AUD_MCLK      = audio_mclk;
      assign AUD_SCLK      = audio_sclk;
      assign AUD_LRCK      = aud_lrck_link;
  `endif
    // --------------------------------------------------------------------
    // FPGA resets
    // --------------------------------------------------------------------

    fpga_rst_sync  u_fpga_rst_sync_1 (
      .clk        (fclk),
      .rst_n_in   (CB_nPOR),
      .rst_request(1'b0),
      .rst_n_out  (cb_npor_sync)
      );

    fpga_rst_sync  u_fpga_rst_sync_2 (
      .clk        (fclk),
      .rst_n_in   (CB_nRST),
      .rst_request(1'b0),
      .rst_n_out  (cb_nrst_sync)
      );

    fpga_rst_sync  u_fpga_rst_sync_3 (
      .clk        (fclk),
      .rst_n_in   (CS_nSRST),
      .rst_request(1'b0),
      .rst_n_out  (cs_nsrst_sync)
      );

    // Reset count
    always @(posedge fclk or negedge cb_npor_sync)
    begin // Assert reset if reset button pressed or PLL is not locked

    if (~cb_npor_sync)
      board_rst_counter <= 8'h00;
    else
      begin
      if (pll_all_locked == 1'b0)
        board_rst_counter <= 8'h00;
      else if (board_rst_counter != 8'hff)
        board_rst_counter <= board_rst_counter + 8'h01;
      end
    end

    assign board_rst_counter_done = (board_rst_counter==8'hff);

    // FPGA nPOR reset register
    always @(posedge fclk or negedge CB_nPOR)
    begin
    if (~CB_nPOR)
      fpga_npor <= 1'b0;
    else begin
      if (~board_rst_counter_done)
        fpga_npor <= 1'b0; // Reset for 255 cycles
      else
        fpga_npor <= 1'b1; // Release Information : Cortex-M0 DesignStart-r2p0-00rel0
      end
    end

    // FPGA reset register
    always @(posedge fclk or negedge cb_nrst_sync)
    begin
    if (~cb_nrst_sync)
      fpga_reset_n <= 1'b0;
    else begin
      if (~board_rst_counter_done)
        fpga_reset_n <= 1'b0; // Reset for 255 cycles after CB_nPOR released
                              // or reset by CB_nRST
      else
        fpga_reset_n <= 1'b1; // Release Information : Cortex-M0 DesignStart-r2p0-00rel0
      end
    end

    // --------------------------------------------------------------------
    // 100Hz clock generator
    // --------------------------------------------------------------------

    // Synchronise the reset
    fpga_rst_sync  u_fpga_rst_sync_4 (
      .clk        (clk_25mhz_ref),
      .rst_n_in   (fpga_reset_n),
      .rst_request(1'b0),
      .rst_n_out  (reset_100hz_n)
      );

    // Generator
    fpga_100hz_gen u_fpga_100hz_gen(
      .clk25mhz   (clk_25mhz_ref),
      .reset_n    (reset_100hz_n),
      .clk100hz   (clk_100hz)
      );

    // --------------------------------------------------------------------
    // FPGA system
    // --------------------------------------------------------------------
    // Make pr_active turn off the lower USER_LED during programming
    wire [1:0] user_led_int;
    assign USER_LED = {user_led_int[1],(user_led_int[0] & ~pr_active) };

    fpga_system u_fpga_system (
      .fclk              (fclk),
      .fpga_npor         (fpga_npor),
      .fpga_reset_n      (fpga_reset_n),
      .cs_nsrst_sync     (cs_nsrst_sync),
      .clk_100hz         (clk_100hz),
      .leds              (user_led_int),
      .buttons           (USER_PB),
      .dll_locked        (pll_locked),  // NOTE: name change from PLL to DLL
      .io_exp_port_i     (io_exp_port_i),
      .io_exp_port_o     (io_exp_port_o),
      .io_exp_port_oen   (io_exp_port_oen),
      .fpga_misc         (fpga_misc),

      .dbg_gnd_detect    (CS_GNDDETECT),
      .dbg_ntrst         (CS_nTRST),
      .dbg_tdi           (CS_TDI),
      .dbg_swclk_tck     (CS_TCK),
      .dbg_swio_tms_i    (CS_TMS),
      .dbg_swio_tms_o    (dbg_swio_tms_o),
      .dbg_swio_tms_en   (dbg_swio_tms_en),
      .dbg_swo_tdo_o     (dbg_swo_tdo_o),
      .dbg_swo_tdo_en    (dbg_swo_tdo_en),
      .trc_clk           (cs_traceclk_link),
      .trc_ctrl          (CS_TRACECTL),
      .trc_data          (CS_TRACEDATA),

    // 64-bit ZBT Synchronous SRAM2 connections
      .zbt_sram1_a       (SSRAM1_A[19:0]),  // Address
      .zbt_sram1_dq_i    (SSRAM1_DQ),       // Data (byte lane #A)
      .zbt_sram1_dq_o    (zbt_sram1_dq_o),  // Data Output
      .zbt_sram1_dq_oen  (zbt_sram1_dq_oen),// Tristate Buffer Enable
      .zbt_sram1_bwn     (SSRAM1_nBW),      // Byte lane writes (active low)
      .zbt_sram1_cen     (SSRAM1_nCE1),     // Chip Select (active low)
      .zbt_sram1_wen     (SSRAM1_nWE),      // Write enable
      .zbt_sram1_oen     (SSRAM1_nOE),      // Output enable (active low)
      .zbt_sram1_lbon    (SSRAM1_MODE),     // Not used (tied to 0)
      .zbt_sram1_adv     (SSRAM1_ADVnLD),   // Not used (tied to 0)
      .zbt_sram1_zz      (SSRAM1_ZZ),       // Not used (tied to 0)
      .zbt_sram1_cken    (SSRAM1_nCEN),     // Not used (tied to 0)

    // 32-bit ZBT Synchronous SRAM2 connections
      .zbt_sram2_a       (SSRAM2_A[19:0]),  // Address
      .zbt_sram2_dq_i    (SSRAM2_DQ),       // Data (byte lane #A)
      .zbt_sram2_dq_o    (zbt_sram2_dq_o),  // Data Output (byte lane #A)
      .zbt_sram2_dq_oen  (zbt_sram2_dq_oen),// Tristate Buffer Enable
      .zbt_sram2_bwn     (SSRAM2_nBW),      // Byte lane writes (active low)
      .zbt_sram2_cen     (SSRAM2_nCE1),     // Chip Select (active low)
      .zbt_sram2_wen     (SSRAM2_nWE),      // Write enable
      .zbt_sram2_oen     (SSRAM2_nOE),      // Output enable (active low)
      .zbt_sram2_lbon    (SSRAM2_MODE),     // Not used (tied to 0)
      .zbt_sram2_adv     (SSRAM2_ADVnLD),   // Not used (tied to 0)
      .zbt_sram2_zz      (SSRAM2_ZZ),       // Not used (tied to 0)
      .zbt_sram2_cken    (SSRAM2_nCEN),     // Not used (tied to 0)

    // 32-bit ZBT Synchronous SRAM3 connections
      .zbt_sram3_a       (SSRAM3_A[19:0]),  // Address
      .zbt_sram3_dq_i    (SSRAM3_DQ),       // Data (byte lane #A)
      .zbt_sram3_dq_o    (zbt_sram3_dq_o),  // Data Output (byte lane #A)
      .zbt_sram3_dq_oen  (zbt_sram3_dq_oen),// Tristate Buffer Enable
      .zbt_sram3_bwn     (SSRAM3_nBW),      // Byte lane writes (active low)
      .zbt_sram3_cen     (SSRAM3_nCE1),     // Chip Select (active low)
      .zbt_sram3_wen     (SSRAM3_nWE),      // Write enable
      .zbt_sram3_oen     (SSRAM3_nOE),      // Output enable (active low)
      .zbt_sram3_lbon    (SSRAM3_MODE),     // Not used (tied to 0)
      .zbt_sram3_adv     (SSRAM3_ADVnLD),   // Not used (tied to 0)
      .zbt_sram3_zz      (SSRAM3_ZZ),       // Not used (tied to 0)
      .zbt_sram3_cken    (SSRAM3_nCEN),     // Not used (tied to 0)

    // smb
      .smb_addr          (smb_addr_extra), // Address
      .smb_data_i        (SMB_DQ),         // Data read
      .smb_data_o        (smb_data_o),     // Data write
      .smb_data_o_nen    (smb_data_o_nen), // Write data tristate control
      .smb_cen           (smb_nce),        // Active low chip enable
      .smb_oen           (SMB_nOE),        // Active low output enable (read)
      .smb_wen           (SMB_nWE),        // Active low write enable
      .smb_ubn           (SMB_nUB),        // Active low Upper Byte Enable
      .smb_lbn           (SMB_nLB),        // Active low Upper Byte Enable
      .smb_nrd           (SMB_nRD),        // Active low read enable
      .smb_nreset        (SMB_nRESET),     // Active low reset

    // UART
      .uart_rxd          (UART_RXD),
      .uart_txd          (UART_TXD),
      .uart_rxd_mcu      (uart_rxd_mcu_i),
      .uart_txd_mcu      (uart_txd_mcu_o),
      .uart_txd_enable   (uart_txd_mcu_o_en),

    // SPI
      .spi0_clk_out       (spi0_clk_out),
      .spi0_clk_out_en_n  (spi0_clk_out_en_n),
      .spi0_data_out      (spi0_data_out),
      .spi0_data_out_en_n (spi0_data_out_en_n),
      .spi0_data_in       (SPI_MISO),
      .spi0_sel           (), // Controlled by fpga_misc register

      .config_spiclk      (config_spiclk),
      .config_spidi       (config_spidi),
      .config_spido       (config_spido),

    // VGA
      .vga_hsync         (ivga_h),
      .vga_vsync         (ivga_v),
      .vga_r             (ivga_r),
      .vga_g             (ivga_g),
      .vga_b             (ivga_b),

    // Ethernet
      .SMB_ETH_IRQ_n     (SMB_ETH_IRQ), // Active low

    // Audio
      .audio_mclk        (audio_mclk),
      .audio_sclk        (audio_sclk),
      .audio_lrck        (aud_lrck_link),
      .audio_sdout       (AUD_SDIN), //ldill swapped in & out
      .audio_sdin        (AUD_SDOUT),
      .audio_nrst        (AUD_nRESET),
      .audio_scl         (AUD_SCL),
      .audio_sda_i       (AUD_SDA),
      .audio_sda_o_en_n  (audio_sda_o_en_n),

   //CLCD
      .clcd_scl           (CLCD_T_SCL),
      .clcd_sda_i         (CLCD_T_SDA),
      .clcd_sda_o_en_n    (clcd_sda_o_en_n),

      .spi1_clk_out       (spi1_clk_out),
      .spi1_clk_out_en_n  (spi1_clk_out_en_n),
      .spi1_data_out      (spi1_data_out),
      .spi1_data_out_en_n (spi1_data_out_en_n),
      .spi1_data_in       (CLCD_SDO),
      .spi1_sel           (),              // Set from fpga_misc register

      .ts_interrupt       (!CLCD_T_CS),

   // SCC Serial Communication Controller interface
      .CFGCLK            (CFGCLK),
      .nCFGRST           (nCFGRST),
      .CFGLOAD           (CFGLOAD),
      .CFGWnR            (CFGWnR),
      .CFGDATAIN         (CFGDATAIN),
      .CFGDATAOUT        (CFGDATAOUT),
   // Interrupt from FPGA to MCU
      .cfgint            (cfgint)
    );

    assign SMB_A[21:0]      = smb_addr_extra[22:1]; // An address pin is swapped for an extra CE.
    assign SMB_A[22]    = 1'b0;      // Reserved. Not connected on PCB.
    assign SMB_ETH_nCS      = smb_nce |                      ~smb_addr_extra[24] |  smb_addr_extra[25];
    assign SMB_PSRAM_nCE[0] = smb_nce |  smb_addr_extra[23] | smb_addr_extra[24] | ~smb_addr_extra[25];
    assign SMB_PSRAM_nCE[1] = smb_nce | ~smb_addr_extra[23] | smb_addr_extra[24] | ~smb_addr_extra[25];
    assign SMB_nZZ      = 1'b1;      // Keep PSRAM out of sleep mode.
    assign SSRAM1_A[20] = 1'b0;      // Reserved for larger SRAM parts.
    assign SSRAM2_A[20] = 1'b0;      // Reserved for larger SRAM parts.
    assign SSRAM3_A[20] = 1'b0;      // Reserved for larger SRAM parts.
    assign SSRAM1_DQP   = {8{1'bz}}; // Unused parity
    assign SSRAM2_DQP   = {4{1'bz}}; // Unused parity
    assign SSRAM3_DQP   = {4{1'bz}}; // Unused parity

    // --------------------------------------------------------------------
    // 3-state buffers
    // --------------------------------------------------------------------
    genvar i1;

    // I/O expansion port
    generate
      for (i1=0;i1<52;i1=i1+1)
        begin: gen_port_3state
        assign EXP[i1] =
          (io_exp_port_oen[i1]) ? io_exp_port_o[i1] : 1'bz;
        end
    endgenerate

    assign io_exp_port_i = EXP;

    // Debug connection
    assign CS_TMS    = dbg_swio_tms_en ? dbg_swio_tms_o : 1'bz;
    assign CS_TDO    = dbg_swo_tdo_en  ? dbg_swo_tdo_o  : 1'bz;

    // ZBT Synchronous SRAM #1 (3-state control is active low)
    assign SSRAM1_DQ = zbt_sram1_dq_oen ? {64{1'bz}} : zbt_sram1_dq_o;

    // ZBT Synchronous SRAM #2 (3-state control is active low)
    assign SSRAM2_DQ = zbt_sram2_dq_oen ? {32{1'bz}} : zbt_sram2_dq_o;

    // ZBT Synchronous SRAM #3 (3-state control is active low)
    assign SSRAM3_DQ = zbt_sram3_dq_oen ? {32{1'bz}} : zbt_sram3_dq_o;


    // SMB 3-state control
    assign SMB_DQ    = smb_data_o_nen   ? {16{1'bz}} : smb_data_o;

    // Audio config data
    assign AUD_SDA   = audio_sda_o_en_n ? 1'bz : 1'b0;

    // CLCD config data
    assign CLCD_T_SDA   = clcd_sda_o_en_n ? 1'bz : 1'b0;
    assign CLCD_WR_SCL  = (spi1_clk_out_en_n)  ? 1'bz : spi1_clk_out;
    assign CLCD_SDI     = (spi1_data_out_en_n) ? 1'bz : spi1_data_out;

    // Register controlled lines
    assign CLCD_CS      = fpga_misc[0];
    assign SPI_nSS      = fpga_misc[1];
    assign CLCD_RESET   = fpga_misc[3];
    assign CLCD_RS      = fpga_misc[4];
    assign CLCD_RD      = fpga_misc[5];
    assign CLCD_BL_CTRL = fpga_misc[6];

    // SPI
    assign SPI_SCK  = (spi0_clk_out_en_n)  ? 1'bz : spi0_clk_out;
    assign SPI_MOSI = (spi0_data_out_en_n) ? 1'bz : spi0_data_out;

    //VGA output registers. 3-State output is required.
    always @(posedge fclk or negedge fpga_npor)
    begin
    if (~fpga_npor)
      begin
        VGA_R[0]  <= 1'bz;
        VGA_R[1]  <= 1'bz;
        VGA_R[2]  <= 1'bz;
        VGA_R[3]  <= 1'bz;
        VGA_G[0]  <= 1'bz;
        VGA_G[1]  <= 1'bz;
        VGA_G[2]  <= 1'bz;
        VGA_G[3]  <= 1'bz;
        VGA_B[0]  <= 1'bz;
        VGA_B[1]  <= 1'bz;
        VGA_B[2]  <= 1'bz;
        VGA_B[3]  <= 1'bz;
        VGA_HSYNC <= 1'b0;
        VGA_HSYNC <= 1'b0;
      end
    else
      begin
        VGA_R[0]  <= ivga_r[0] ? 1'b1 : 1'bz;
        VGA_R[1]  <= ivga_r[1] ? 1'b1 : 1'bz;
        VGA_R[2]  <= ivga_r[2] ? 1'b1 : 1'bz;
        VGA_R[3]  <= ivga_r[3] ? 1'b1 : 1'bz;
        VGA_G[0]  <= ivga_g[0] ? 1'b1 : 1'bz;
        VGA_G[1]  <= ivga_g[1] ? 1'b1 : 1'bz;
        VGA_G[2]  <= ivga_g[2] ? 1'b1 : 1'bz;
        VGA_G[3]  <= ivga_g[3] ? 1'b1 : 1'bz;
        VGA_B[0]  <= ivga_b[0] ? 1'b1 : 1'bz;
        VGA_B[1]  <= ivga_b[1] ? 1'b1 : 1'bz;
        VGA_B[2]  <= ivga_b[2] ? 1'b1 : 1'bz;
        VGA_B[3]  <= ivga_b[3] ? 1'b1 : 1'bz;
        VGA_HSYNC <= ivga_h;
        VGA_VSYNC <= ivga_v;
      end
    end

    // --------------------------------------------------------------------
    // MCC to FPGA interface
    // --------------------------------------------------------------------
    // SCC interface
    // NOTE : CLCD_PDH/L are joined to PR_DATA[15:5].  Therefore any of them that
    // are output must be set as tristates during PR programming.
    // No PR
    assign pr_active = 1'b0;
    
    assign CFGCLK         = (pr_active) ? 1'b0 : CLCD_PDH[13];
    assign nCFGRST        = (pr_active) ? 1'b0 : CLCD_PDH[14];
    assign CFGLOAD        = (pr_active) ? 1'b0 : CLCD_PDH[15];
    assign CFGWnR         = (pr_active) ? 1'b0 : CLCD_PDH[16];
    assign CFGDATAIN      = (pr_active) ? 1'b0 : CLCD_PDH[17];
    assign CLCD_PDH[17:13] = 5'bz;
    assign CLCD_PDH[12]   = (pr_active) ? 1'bz : CFGDATAOUT;
    // SPI interface to FPGA buses
    // Auxiliary UART
    assign uart_rxd_mcu_i = (pr_active) ? 1'b0 : CLCD_PDH[11];
    assign CLCD_PDH[11]   = 1'bz;
    assign CLCD_PDH[10]   = (uart_txd_mcu_o_en & ~pr_active) ? uart_txd_mcu_o : 1'bz;

    assign config_spiclk  = (pr_active) ? 1'b0 : CLCD_PDL[6];
    assign CLCD_PDL[6]    = 1'bz;
    assign config_spidi   = (pr_active) ? 1'b0 : CLCD_PDL[8];
    assign CLCD_PDL[8]    = 1'bz;
    assign CLCD_PDL[7]    = (pr_active) ? 1'bz : config_spido;

    // FPGA config and partial reconfiguration
    assign FPGA_CONFIG_nLRST   = cfgint; // Duplicated for compatibility with rev A MCC code

    // --------------------------------------------------------------------
    // Unused signals
    // --------------------------------------------------------------------
    // NOTE - these signals are also connected to PR_DATA[15:5].  They must be set as tristate
    // during PR programming.
    assign CLCD_PDL[1] = 1'bz;
    assign CLCD_PDL[2] = 1'bz;
    assign CLCD_PDL[3] = 1'bz;
    assign CLCD_PDL[4] = 1'bz;
    assign CLCD_PDL[5] = 1'bz;

    // Unused PR programming signals
    // Weak pull-ups assigned to stop signals floating
    assign CRC_ERROR   = 1'bz;
    assign PR_READY    = 1'bz;
    assign PR_ERROR    = 1'bz;
    assign PR_DONE     = 1'bz;
    
    // Tie off test points
    assign TP[17:0]    = {18{1'b1}};

endmodule

// --------------------------------------------------------------------
// EOF
// --------------------------------------------------------------------
