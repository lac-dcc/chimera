//*****************************************************************************
// (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 3.4
//  \   \         Application        : MIG
//  /   /         Filename           : memc_ui_top.v
// /___/   /\     Date Last Modified : $Date: 2010/02/26 08:58:33 $
// \   \  /  \    Date Created       : Mon Jun 23 2008
//  \___\/\___\
//
// Device           : Virtex-6
// Design Name      : DDR2 SDRAM & DDR3 SDRAM
// Purpose          :
//                   Top level memory interface block. Instantiates a clock and
//                   reset generator, the memory controller, the phy and the
//                   user interface blocks.
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1 ps / 1 ps

module memc_ui_top #
  (
   parameter REFCLK_FREQ             = 200,
                                       // # = 200 when design frequency <= 533 MHz,
                                       //   = 300 when design frequency > 533 MHz.
   parameter SIM_INIT_OPTION         = "NONE",
                                       // # = "SKIP_PU_DLY" - Skip the memory
                                       //                     initilization sequence,
                                       //   = "NONE" - Complete the memory
                                       //              initilization sequence.
   parameter SIM_CAL_OPTION          = "NONE",
                                       // # = "FAST_CAL" - Skip the delay
                                       //                  Calibration process,
                                       //   = "NONE" - Complete the delay
                                       //              Calibration process.
   parameter IODELAY_GRP             = "IODELAY_MIG",
                                       //to phy_top
   parameter nCK_PER_CLK             = 2,
                                       // # of memory CKs per fabric clock.
                                       // # = 2, 1.
   parameter DRAM_TYPE               = "DDR3",
                                       // SDRAM type. # = "DDR3", "DDR2".
   parameter nCS_PER_RANK            = 1,
                                       // # of unique CS outputs per Rank for
                                       // phy.
   parameter DQ_CNT_WIDTH            = 6,
                                       // # = ceil(log2(DQ_WIDTH)).
   parameter DQS_CNT_WIDTH           = 3,
                                       // # = ceil(log2(DQS_WIDTH)).
   parameter RANK_WIDTH              = 1,
                                       // # = ceil(log2(RANKS)).
   parameter BANK_WIDTH              = 3,
                                       // # of memory Bank Address bits.
   parameter CK_WIDTH                = 1,
                                       // # of CK/CK# outputs to memory.
   parameter CKE_WIDTH               = 1,
                                       // # of CKE outputs to memory.
   parameter COL_WIDTH               = 10,
                                       // # of memory Column Address bits.
   parameter CS_WIDTH                = 1,
                                       // # of unique CS outputs to memory.
   parameter DM_WIDTH                = 8,
                                       // # of Data Mask bits.
   parameter USE_DM_PORT             = 1,
                                       // # = 1, When Data Mask option is enabled
                                       //   = 0, When Data Mask option is disbaled
                                       // When Data Mask option is disbaled in
                                       // MIG Controller Options page, the logic
                                       // related to Data Mask should not get
                                       // synthesized
   parameter DQ_WIDTH                = 64,
                                       // # of Data (DQ) bits.
   parameter DRAM_WIDTH              = 8,
                                       // # of DQ bits per DQS.
   parameter DQS_WIDTH               = 8,
                                       // # of DQS/DQS# bits.
   parameter ROW_WIDTH               = 13,
                                       // # of memory Row Address bits.
   parameter AL                      = "0",
                                       // DDR3 SDRAM:
                                       // Additive Latency (Mode Register 1).
                                       // # = "0", "CL-1", "CL-2".
                                       // DDR2 SDRAM:
                                       // Additive Latency (Extended Mode Register).
   parameter BURST_MODE              = "8",
                                       // DDR3 SDRAM:
                                       // Burst Length (Mode Register 0).
                                       // # = "8", "4", "OTF".
                                       // DDR2 SDRAM:
                                       // Burst Length (Mode Register).
                                       // # = "8", "4".
   parameter BURST_TYPE              = "SEQ",
                                       // DDR3 SDRAM: Burst Type (Mode Register 0).
                                       // DDR2 SDRAM: Burst Type (Mode Register).
                                       // # = "SEQ" - (Sequential),
                                       //   = "INT" - (Interleaved).
   parameter IBUF_LPWR_MODE          = "OFF",
                                       // to phy_top
   parameter IODELAY_HP_MODE         = "ON",
                                       // to phy_top
   parameter nAL                     = 0,
                                       // # Additive Latency in number of clock
                                       // cycles.
   parameter CL                      = 6,
                                       // DDR3 SDRAM: CAS Latency (Mode Register 0).
                                       // DDR2 SDRAM: CAS Latency (Mode Register).
   parameter CWL                     = 5,
                                       // DDR3 SDRAM: CAS Write Latency (Mode Register 2).
                                       // DDR2 SDRAM: Can be ignored
   parameter DATA_BUF_ADDR_WIDTH     = 8,
                                       // # = 8,9,10,11,12.
   parameter DATA_BUF_OFFSET_WIDTH   = 1,
                                       // # = 0,1.
   //parameter DELAY_WR_DATA_CNTRL     = 0, //This parameter is made as MC local parameter
                                       // # = 0,1.
   parameter BM_CNT_WIDTH            = 2,
                                       // # = ceil(log2(nBANK_MACHS)).
   parameter ADDR_CMD_MODE           = "UNBUF",
                                       // # = "UNBUF", "REG".
   parameter nBANK_MACHS             = 4,
                                       // # = 2,3,4,5,6,7,8.
   parameter ORDERING                = "NORM",
                                       // # = "NORM", "STRICT", "RELAXED".
   parameter RANKS                   = 1,
                                       // # of Ranks.
   parameter WRLVL                   = "ON",
                                       // # = "ON" - DDR3 SDRAM
                                       //   = "OFF" - DDR2 SDRAM.
   parameter PHASE_DETECT            = "ON",
                                       // # = "ON", "OFF".
   parameter CAL_WIDTH               = "HALF",
                                       // # = "HALF", "FULL".
   parameter RTT_NOM                 = "60",
                                       // DDR3 SDRAM:
                                       // RTT_NOM (ODT) (Mode Register 1).
                                       // # = "DISABLED" - RTT_NOM disabled,
                                       //   = "120" - RZQ/2,
                                       //   = "60"  - RZQ/4,
                                       //   = "40"  - RZQ/6.
                                       // DDR2 SDRAM:
                                       // RTT (Nominal) (Extended Mode Register).
                                       // # = "DISABLED" - RTT disabled,
                                       //   = "150" - 150 Ohms,
                                       //   = "75" - 75 Ohms,
                                       //   = "50" - 50 Ohms.
   parameter RTT_WR                  = "OFF",
                                       // DDR3 SDRAM:
                                       // RTT_WR (ODT) (Mode Register 2).
                                       // # = "OFF" - Dynamic ODT off,
                                       //   = "120" - RZQ/2,
                                       //   = "60"  - RZQ/4,
                                       // DDR2 SDRAM:
                                       // Can be ignored. Always set to "OFF".
   parameter OUTPUT_DRV              = "HIGH",
                                       // DDR3 SDRAM:
                                       // Output Drive Strength (Mode Register 1).
                                       // # = "HIGH" - RZQ/7,
                                       //   = "LOW" - RZQ/6.
                                       // DDR2 SDRAM:
                                       // Output Drive Strength (Extended Mode Register).
                                       // # = "HIGH" - FULL,
                                       //   = "LOW" - REDUCED.
   parameter REG_CTRL                = "OFF",
                                       // # = "ON" - RDIMMs,
                                       //   = "OFF" - Components, SODIMMs, UDIMMs.
   parameter nDQS_COL0               = 6,
                                       // Number of DQS groups in I/O column #1.
   parameter nDQS_COL1               = 2,
                                       // Number of DQS groups in I/O column #2.
   parameter nDQS_COL2               = 0,
                                       // Number of DQS groups in I/O column #3.
   parameter nDQS_COL3               = 0,
                                       // Number of DQS groups in I/O column #4.
   parameter DQS_LOC_COL0            = 48'h050403020100,
                                       // DQS groups in column #1.
   parameter DQS_LOC_COL1            = 48'h050403020100,
                                       // DQS groups in column #2.
   parameter DQS_LOC_COL2            = 48'h050403020100,
                                       // DQS groups in column #3.
   parameter DQS_LOC_COL3            = 48'h050403020100,
                                       // DQS groups in column #4.
   parameter tCK                     = 2500,
                                       // memory tCK paramter.
                                       // # = Clock Period.
   parameter tFAW                    = 45000,
                                       // memory tRAW paramter.
   parameter tPRDI                   = 1_000_000,
                                       // memory tPRDI paramter.
   parameter tRRD                    = 7500,
                                       // memory tRRD paramter.
   parameter tRAS                    = 37500,
                                       // memory tRAS paramter.
   parameter tRCD                    = 13130,
                                       // memory tRCD paramter.
   parameter tREFI                   = 7800000,
                                       // memory tREFI paramter.
   parameter tRFC                    = 110000,
                                       // memory tRFC paramter.
   parameter tRP                     = 13130,
                                       // memory tRP paramter.
   parameter tRTP                    = 7500,
                                       // memory tRTP paramter.
   parameter tWTR                    = 7500,
                                       // memory tWTR paramter.
   parameter tZQI                    = 128_000_000,
                                       // memory tZQI paramter.
   parameter tZQCS                   = 64,
                                       // memory tZQCS paramter.
   parameter SLOT_0_CONFIG           = 8'b0000_0001,
                                       // Mapping of Ranks.
   parameter SLOT_1_CONFIG           = 8'b0000_0000,
                                       // Mapping of Ranks.
   parameter DEBUG_PORT              = "ON",
                                       // # = "ON" Enable debug signals/controls.
                                       //   = "OFF" Disable debug signals/controls.
   parameter ADDR_WIDTH              = 27,
                                       // # = RANK_WIDTH + BANK_WIDTH
                                       //     + ROW_WIDTH + COL_WIDTH;
   parameter STARVE_LIMIT            = 2,
                                       // # = 2,3,4.
   parameter TCQ                     = 100,
   parameter ECC                     = "OFF",
   parameter DATA_WIDTH              = 64,
                                       // # = DQ_WIDTH + ECC_WIDTH, if ECC="ON";
                                       //   = DQ_WIDTH, if ECC="OFF".
   parameter ECC_TEST                = "OFF",
   parameter PAYLOAD_WIDTH           = 64,
  // UI_INTFC Parameters
   parameter APP_DATA_WIDTH          = PAYLOAD_WIDTH*4,
   parameter APP_MASK_WIDTH          = APP_DATA_WIDTH/8
  )
  (
   input                              clk,
   input                              clk_mem,
   input                              clk_rd_base,
   input                              rst,
   output [ROW_WIDTH-1:0]             ddr_addr,
   output [BANK_WIDTH-1:0]            ddr_ba,
   output                             ddr_cas_n,
   output [CK_WIDTH-1:0]              ddr_ck_n,
   output [CK_WIDTH-1:0]              ddr_ck,
   output [CKE_WIDTH-1:0]             ddr_cke,
   output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_cs_n,
   output [DM_WIDTH-1:0]              ddr_dm,
   output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_odt,
   output                             ddr_ras_n,
   output                             ddr_reset_n,
   output                             ddr_parity,
   output                             ddr_we_n,
   inout [DQ_WIDTH-1:0]               ddr_dq,
   inout [DQS_WIDTH-1:0]              ddr_dqs_n,
   inout [DQS_WIDTH-1:0]              ddr_dqs,
   output                             pd_PSEN,
   output                             pd_PSINCDEC,
   input                              pd_PSDONE,
   output                             dfi_init_complete,
   output [BM_CNT_WIDTH-1:0]          bank_mach_next,
   output [3:0]                       app_ecc_multiple_err,
   output [APP_DATA_WIDTH-1:0]        app_rd_data,
   output                             app_rd_data_end,
   output                             app_rd_data_valid,
   output                             app_full,
   output                             app_wdf_full,
   input [ADDR_WIDTH-1:0]             app_addr,
   input [2:0]                        app_cmd,
   input                              app_en,
   input                              app_hi_pri,
   input                              app_sz,
   input [APP_DATA_WIDTH-1:0]         app_wdf_data,
   input                              app_wdf_end,
   input [APP_MASK_WIDTH-1:0]         app_wdf_mask,
   input                              app_wdf_wren,
   input [5*DQS_WIDTH-1:0]            dbg_wr_dqs_tap_set,
   input [5*DQS_WIDTH-1:0]            dbg_wr_dq_tap_set,
   input                              dbg_wr_tap_set_en,
   output                             dbg_wrlvl_start,
   output                             dbg_wrlvl_done,
   output                             dbg_wrlvl_err,   
   output [DQS_WIDTH-1:0]             dbg_wl_dqs_inverted,
   output [2*DQS_WIDTH-1:0]           dbg_wr_calib_clk_delay,
   output [5*DQS_WIDTH-1:0]           dbg_wl_odelay_dqs_tap_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_wl_odelay_dq_tap_cnt,
   output [1:0]                       dbg_rdlvl_start,
   output [1:0]                       dbg_rdlvl_done,
   output [1:0]                       dbg_rdlvl_err,
   output [5*DQS_WIDTH-1:0]           dbg_cpt_tap_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_cpt_first_edge_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_cpt_second_edge_cnt,
   output [3*DQS_WIDTH-1:0]           dbg_rd_bitslip_cnt,
   output [2*DQS_WIDTH-1:0]           dbg_rd_clkdly_cnt,
   output [4:0]                       dbg_rd_active_dly,
   input                              dbg_pd_off,
   input                              dbg_pd_maintain_off,
   input                              dbg_pd_maintain_0_only,
   input                              dbg_inc_cpt,
   input                              dbg_dec_cpt,
   input                              dbg_inc_rd_dqs,
   input                              dbg_dec_rd_dqs,
   input [DQS_CNT_WIDTH-1:0]          dbg_inc_dec_sel,
   input                              dbg_inc_rd_fps,
   input                              dbg_dec_rd_fps,
   output [5*DQS_WIDTH-1:0]           dbg_dqs_tap_cnt,
   output [5*DQS_WIDTH-1:0]           dbg_dq_tap_cnt,
   output [4*DQ_WIDTH-1:0]            dbg_rddata
   );

  localparam nPHY_WRLAT = 0;

  localparam MC_ERR_ADDR_WIDTH = ((CS_WIDTH == 1) ? 0 : RANK_WIDTH) + BANK_WIDTH
                                 + ROW_WIDTH + COL_WIDTH + DATA_BUF_OFFSET_WIDTH;

  localparam ECC_WIDTH = (ECC == "OFF")?
                           0 : (DATA_WIDTH <= 4)?
                            4 : (DATA_WIDTH <= 10)?
                             5 : (DATA_WIDTH <= 26)?
                              6 : (DATA_WIDTH <= 57)?
                               7 : (DATA_WIDTH <= 120)?
                                8 : (DATA_WIDTH <= 247)?
                                 9 : 10;

//  localparam PAYLOAD_WIDTH = (ECC_TEST == "OFF") ? DATA_WIDTH : DQ_WIDTH;

  wire                             correct_en;
  wire [3:0]                       raw_not_ecc;
  wire [3:0]                       ecc_single;
  wire [3:0]                       ecc_multiple;
  wire [MC_ERR_ADDR_WIDTH-1:0]     ecc_err_addr;
  wire [3:0]                       app_raw_not_ecc;
  wire                             app_correct_en;


  wire [DATA_BUF_OFFSET_WIDTH-1:0] wr_data_offset;
  wire                             wr_data_en;
  wire [DATA_BUF_ADDR_WIDTH-1:0]   wr_data_addr;
  wire [DATA_BUF_OFFSET_WIDTH-1:0] rd_data_offset;
  wire                             rd_data_en;
  wire [DATA_BUF_ADDR_WIDTH-1:0]   rd_data_addr;
  wire                             accept;
  wire                             accept_ns;
  wire [(4*PAYLOAD_WIDTH)-1:0]     rd_data;
  wire                             rd_data_end;
  wire                             use_addr;
  wire                             size;
  wire [ROW_WIDTH-1:0]             row;
  wire [RANK_WIDTH-1:0]            rank;
  wire                             hi_priority;
  wire [DATA_BUF_ADDR_WIDTH-1:0]   data_buf_addr;
  wire [COL_WIDTH-1:0]             col;
  wire [2:0]                       cmd;
  wire [BANK_WIDTH-1:0]            bank;
  wire [(4*PAYLOAD_WIDTH)-1:0]     wr_data;
  wire [(4*(DATA_WIDTH/8))-1:0]    wr_data_mask;
  wire                             app_wdf_rdy;
  wire                             app_rdy;

  assign app_full = ~app_rdy;
  assign app_wdf_full = ~app_wdf_rdy;

  mem_intfc #
    (
     .TCQ                   (TCQ),
     .ADDR_CMD_MODE         (ADDR_CMD_MODE),
     .AL                    (AL),
     .BANK_WIDTH            (BANK_WIDTH),
     .BM_CNT_WIDTH          (BM_CNT_WIDTH),
     .BURST_MODE            (BURST_MODE),
     .BURST_TYPE            (BURST_TYPE),
     .CK_WIDTH              (CK_WIDTH),
     .CKE_WIDTH             (CKE_WIDTH),
     .CL                    (CL),
     .COL_WIDTH             (COL_WIDTH),
     .CS_WIDTH              (CS_WIDTH),
     .CWL                   (CWL),
     .DATA_WIDTH            (DATA_WIDTH),
     .DATA_BUF_ADDR_WIDTH   (DATA_BUF_ADDR_WIDTH),
     .DATA_BUF_OFFSET_WIDTH (DATA_BUF_OFFSET_WIDTH),
     //.DELAY_WR_DATA_CNTRL   (DELAY_WR_DATA_CNTRL),
     .DM_WIDTH              (DM_WIDTH),
     .USE_DM_PORT           (USE_DM_PORT),
     .DQ_CNT_WIDTH          (DQ_CNT_WIDTH),
     .DQ_WIDTH              (DQ_WIDTH),
     .DQS_CNT_WIDTH         (DQS_CNT_WIDTH),
     .DQS_WIDTH             (DQS_WIDTH),
     .DRAM_TYPE             (DRAM_TYPE),
     .DRAM_WIDTH            (DRAM_WIDTH),
     .ECC                   (ECC),
     .PAYLOAD_WIDTH         (PAYLOAD_WIDTH),
     .ECC_WIDTH             (ECC_WIDTH),
     .MC_ERR_ADDR_WIDTH     (MC_ERR_ADDR_WIDTH),
     .nAL                   (nAL),
     .nBANK_MACHS           (nBANK_MACHS),
     .nCK_PER_CLK           (nCK_PER_CLK),
     .nCS_PER_RANK          (nCS_PER_RANK),
     .ORDERING              (ORDERING),
     .PHASE_DETECT          (PHASE_DETECT),
     .IBUF_LPWR_MODE        (IBUF_LPWR_MODE),
     .IODELAY_HP_MODE       (IODELAY_HP_MODE),
     .IODELAY_GRP           (IODELAY_GRP),
     .OUTPUT_DRV            (OUTPUT_DRV),
     .REG_CTRL              (REG_CTRL),
     .RTT_NOM               (RTT_NOM),
     .RTT_WR                (RTT_WR),
     .STARVE_LIMIT          (STARVE_LIMIT),
     .tCK                   (tCK),
     .tFAW                  (tFAW),
     .tPRDI                 (tPRDI),
     .tRAS                  (tRAS),
     .tRCD                  (tRCD),
     .tREFI                 (tREFI),
     .tRFC                  (tRFC),
     .tRP                   (tRP),
     .tRRD                  (tRRD),
     .tRTP                  (tRTP),
     .tWTR                  (tWTR),
     .tZQI                  (tZQI),
     .tZQCS                 (tZQCS),
     .WRLVL                 (WRLVL),
     .DEBUG_PORT            (DEBUG_PORT),
     .CAL_WIDTH             (CAL_WIDTH),
     .RANK_WIDTH            (RANK_WIDTH),
     .RANKS                 (RANKS),
     .ROW_WIDTH             (ROW_WIDTH),
     .SLOT_0_CONFIG         (SLOT_0_CONFIG),
     .SLOT_1_CONFIG         (SLOT_1_CONFIG),
     .SIM_INIT_OPTION       (SIM_INIT_OPTION),
     .SIM_CAL_OPTION        (SIM_CAL_OPTION),
     .REFCLK_FREQ           (REFCLK_FREQ),
     .nDQS_COL0             (nDQS_COL0),
     .nDQS_COL1             (nDQS_COL1),
     .nDQS_COL2             (nDQS_COL2),
     .nDQS_COL3             (nDQS_COL3),
     .DQS_LOC_COL0          (DQS_LOC_COL0),
     .DQS_LOC_COL1          (DQS_LOC_COL1),
     .DQS_LOC_COL2          (DQS_LOC_COL2),
     .DQS_LOC_COL3          (DQS_LOC_COL3)
    )
    u_mem_intfc
    (
     .wr_data_offset            (wr_data_offset),
     .wr_data_en                (wr_data_en),
     .wr_data_addr              (wr_data_addr),
     .rd_data_offset            (rd_data_offset),
     .rd_data_en                (rd_data_en),
     .rd_data_addr              (rd_data_addr),
     .ddr_we_n                  (ddr_we_n),
     .ddr_parity                (ddr_parity),
     .ddr_reset_n               (ddr_reset_n),
     .ddr_ras_n                 (ddr_ras_n),
     .ddr_odt                   (ddr_odt),
     .ddr_dm                    (ddr_dm),
     .ddr_cs_n                  (ddr_cs_n),
     .ddr_cke                   (ddr_cke),
     .ddr_ck                    (ddr_ck),
     .ddr_ck_n                  (ddr_ck_n),
     .ddr_cas_n                 (ddr_cas_n),
     .ddr_ba                    (ddr_ba),
     .ddr_addr                  (ddr_addr),
     .dbg_wr_dqs_tap_set        (dbg_wr_dqs_tap_set),
     .dbg_wr_dq_tap_set         (dbg_wr_dq_tap_set),
     .dbg_wr_tap_set_en         (dbg_wr_tap_set_en),  
     .dbg_wrlvl_start           (dbg_wrlvl_start),
     .dbg_wrlvl_done            (dbg_wrlvl_done),
     .dbg_wrlvl_err             (dbg_wrlvl_err),
     .dbg_wl_dqs_inverted       (dbg_wl_dqs_inverted),
     .dbg_wr_calib_clk_delay    (dbg_wr_calib_clk_delay),
     .dbg_wl_odelay_dqs_tap_cnt (dbg_wl_odelay_dqs_tap_cnt),
     .dbg_wl_odelay_dq_tap_cnt  (dbg_wl_odelay_dq_tap_cnt),
     .dbg_tap_cnt_during_wrlvl  (),
     .dbg_wl_edge_detect_valid  (),
     .dbg_rd_data_edge_detect   (),
     .dbg_rdlvl_start           (dbg_rdlvl_start),
     .dbg_rdlvl_done            (dbg_rdlvl_done),
     .dbg_rdlvl_err             (dbg_rdlvl_err),
     .dbg_cpt_first_edge_cnt    (dbg_cpt_first_edge_cnt),
     .dbg_cpt_second_edge_cnt   (dbg_cpt_second_edge_cnt),
     .dbg_rd_bitslip_cnt        (dbg_rd_bitslip_cnt),
     .dbg_rd_clkdly_cnt         (dbg_rd_clkdly_cnt),
     .dbg_rd_active_dly         (dbg_rd_active_dly),
     .dbg_rddata                (dbg_rddata),
     // Currently CPT clock IODELAY taps must be moved on per-DQS group
     // basis-only - i.e. all CPT clocks cannot be moved simultaneously
     // If desired to change this, rewire dbg_idel_*_all, and 
     // dbg_sel_idel_*_* accordingly. Also no support for changing DQS 
     // and CPT taps via phase detector. Note: can change CPT taps via 
     // dbg_idel_*_cpt, but PD must off when this happens     
     .dbg_idel_up_all           (1'b0),
     .dbg_idel_down_all         (1'b0),
     .dbg_idel_up_cpt           (dbg_inc_cpt),
     .dbg_idel_down_cpt         (dbg_dec_cpt),
     .dbg_idel_up_rsync         (1'b0),
     .dbg_idel_down_rsync       (1'b0),
     .dbg_sel_idel_cpt          (dbg_inc_dec_sel),
     .dbg_sel_all_idel_cpt      (1'b0),
     .dbg_sel_idel_rsync        ({DQS_CNT_WIDTH{1'b0}}),
     .dbg_sel_all_idel_rsync    (1'b0),
     .dbg_cpt_tap_cnt           (dbg_cpt_tap_cnt),
     .dbg_rsync_tap_cnt         (),
     .dbg_dqs_tap_cnt           (dbg_dqs_tap_cnt),
     .dbg_dq_tap_cnt            (dbg_dq_tap_cnt),
     .dbg_pd_off                (dbg_pd_off),
     .dbg_pd_maintain_off       (dbg_pd_maintain_off),
     .dbg_pd_maintain_0_only    (dbg_pd_maintain_0_only),
     .dbg_pd_inc_cpt            (1'b0),
     .dbg_pd_dec_cpt            (1'b0),
     .dbg_pd_inc_dqs            (dbg_inc_rd_dqs),
     .dbg_pd_dec_dqs            (dbg_inc_rd_dqs),
     .dbg_pd_disab_hyst         (1'b0),
     .dbg_pd_disab_hyst_0       (1'b0),
     .dbg_pd_msb_sel            (4'b0000),
     .dbg_pd_byte_sel           (dbg_inc_dec_sel),
     .dbg_inc_rd_fps            (dbg_inc_rd_fps),
     .dbg_dec_rd_fps            (dbg_dec_rd_fps),
     .dbg_phy_pd                (),    
     .dbg_phy_read              (),  
     .dbg_phy_rdlvl             (), 
     .dbg_phy_top               (),
     .bank_mach_next            (bank_mach_next),
     .accept                    (accept),
     .accept_ns                 (accept_ns),
     .rd_data                   (rd_data[APP_DATA_WIDTH-1:0]),
     .rd_data_end               (rd_data_end),
     .pd_PSEN                   (pd_PSEN),
     .pd_PSINCDEC               (pd_PSINCDEC),
     .dfi_init_complete         (dfi_init_complete),
     .ecc_single                (ecc_single),
     .ecc_multiple              (ecc_multiple),
     .ecc_err_addr              (ecc_err_addr),
     .ddr_dqs                   (ddr_dqs),
     .ddr_dqs_n                 (ddr_dqs_n),
     .ddr_dq                    (ddr_dq),
     .use_addr                  (use_addr),
     .size                      (size),
     .rst                       (rst),
     .row                       (row),
     .rank                      (rank),
     .hi_priority               (1'b0),
     .data_buf_addr             (data_buf_addr),
     .col                       (col),
     .cmd                       (cmd),
     .clk_mem                   (clk_mem),
     .clk                       (clk),
     .clk_rd_base               (clk_rd_base),
     .bank                      (bank),
     .wr_data                   (wr_data),
     .wr_data_mask              (wr_data_mask),
     .pd_PSDONE                 (pd_PSDONE),
     .slot_0_present            (SLOT_0_CONFIG),
     .slot_1_present            (SLOT_1_CONFIG),
     .correct_en                (correct_en),
     .raw_not_ecc               (raw_not_ecc)
    );

  ui_top #
    (
     .TCQ            (TCQ),
     .APP_DATA_WIDTH (APP_DATA_WIDTH),
     .APP_MASK_WIDTH (APP_MASK_WIDTH),
     .BANK_WIDTH     (BANK_WIDTH),
     .COL_WIDTH      (COL_WIDTH),
     .CWL            (CWL),
     .ECC            (ECC),
     .ECC_TEST       (ECC_TEST),
     .ORDERING       (ORDERING),
     .RANKS          (RANKS),
     .RANK_WIDTH     (RANK_WIDTH),
     .ROW_WIDTH      (ROW_WIDTH)
    )
   u_ui_top
     (
      .wr_data_mask         (wr_data_mask[APP_MASK_WIDTH-1:0]),
      .wr_data              (wr_data[APP_DATA_WIDTH-1:0]),
      .use_addr             (use_addr),
      .size                 (size),
      .row                  (row[ROW_WIDTH-1:0]),
      .rank                 (rank[RANK_WIDTH-1:0]),
      .hi_priority          (hi_priority),
      .data_buf_addr        (data_buf_addr[3:0]),
      .col                  (col),
      .cmd                  (cmd),
      .bank                 (bank),
      .app_wdf_rdy          (app_wdf_rdy),
      .app_rdy              (app_rdy),
      .app_rd_data_valid    (app_rd_data_valid),
      .app_rd_data_end      (app_rd_data_end),
      .app_rd_data          (app_rd_data),
      .wr_data_offset       (wr_data_offset),
      .wr_data_en           (wr_data_en),
      .wr_data_addr         (wr_data_addr[3:0]),
      .rst                  (rst),
      .rd_data_offset       (rd_data_offset),
      .rd_data_end          (rd_data_end),
      .rd_data_en           (rd_data_en),
      .rd_data_addr         (rd_data_addr[3:0]),
      .rd_data              (rd_data[APP_DATA_WIDTH-1:0]),
      .clk                  (clk),
      .raw_not_ecc          (raw_not_ecc),
      .app_ecc_multiple_err (app_ecc_multiple_err),
      .correct_en           (correct_en),
      .ecc_multiple         (ecc_multiple),
      .app_raw_not_ecc      (app_raw_not_ecc),
      .app_correct_en       (app_correct_en),
      .app_wdf_wren         (app_wdf_wren),
      .app_wdf_mask         (app_wdf_mask),
      .app_wdf_end          (app_wdf_end),
      .app_wdf_data         (app_wdf_data),
      .app_sz               (app_sz),
      .app_hi_pri           (app_hi_pri),
      .app_en               (app_en),
      .app_cmd              (app_cmd),
      .app_addr             (app_addr),
      .accept_ns            (accept_ns),
      .accept               (accept)
      );

endmodule
