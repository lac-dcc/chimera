//*****************************************************************************
// (c) Copyright 2008-2009 Xilinx, Inc. All rights reserved.
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
// /___/  \  /    Vendor                : Xilinx
// \   \   \/     Version               : 3.4
//  \   \         Application           : MIG
//  /   /         Filename              : mc.v
// /___/   /\     Date Last Modified    : $date$
// \   \  /  \    Date Created          : Tue Jun 30 2009
//  \___\/\___\
//
//Device            : Virtex-6
//Design Name       : DDR3 SDRAM
//Purpose           :
//Reference         :
//Revision History  :
//*****************************************************************************

// Top level memory sequencer structural block.  This block
// instantiates the rank, bank, and column machines.

`timescale 1ps/1ps

module mc #
  (
   parameter TCQ = 100,
   parameter ADDR_CMD_MODE            = "UNBUF",
   parameter BANK_WIDTH               = 3,
   parameter BM_CNT_WIDTH             = 2,
   parameter BURST_MODE               = "8",
   parameter CL                       = 5,
   parameter COL_WIDTH                = 12,
   parameter CMD_PIPE_PLUS1           = "ON",
   parameter CS_WIDTH                 = 4,
   parameter CWL                      = 5,
   parameter DATA_WIDTH               = 64,
   parameter DATA_BUF_ADDR_WIDTH      = 8,
   parameter DATA_BUF_OFFSET_WIDTH    = 1,
   //parameter DELAY_WR_DATA_CNTRL      = 0, //Making it as a local parameter
   parameter nREFRESH_BANK            = 8, //Reverted back to 8
   parameter DRAM_TYPE                = "DDR3",
   parameter DQS_WIDTH                = 8,
   parameter DQ_WIDTH                 = 64,
   parameter ECC                      = "OFF",
   parameter ECC_WIDTH                = 8,
   parameter MC_ERR_ADDR_WIDTH        = 31,
   parameter nBANK_MACHS              = 4,
   parameter nCK_PER_CLK              = 2,
   parameter nCS_PER_RANK             = 1,
   parameter nSLOTS                   = 1,
   parameter ORDERING                 = "NORM",
   parameter PAYLOAD_WIDTH            = 64,
   parameter RANK_WIDTH               = 2,
   parameter RANKS                    = 4,
   parameter PHASE_DETECT             = "OFF",
   parameter ROW_WIDTH                = 16,
   parameter RTT_NOM                  = "40",
   parameter RTT_WR                   = "120",
   parameter STARVE_LIMIT             = 2,
   parameter SLOT_0_CONFIG            = 8'b0000_0101,
   parameter SLOT_1_CONFIG            = 8'b0000_1010,
   parameter tCK                      = 2500,         // pS
   parameter tFAW                     = 40000,        // pS
   parameter tPRDI                    = 1_000_000,    // pS
   parameter tRAS                     = 37500,        // pS
   parameter tRCD                     = 12500,        // pS
   parameter tREFI                    = 7800000,      // pS
   parameter tRFC                     = 110000,       // pS
   parameter tRP                      = 12500,        // pS
   parameter tRRD                     = 10000,        // pS
   parameter tRTP                     = 7500,         // pS
   parameter tWTR                     = 7500,         // pS
   parameter tZQI                     = 128_000_000,  // nS
   parameter tZQCS                    = 64            // CKs
  )
  (/*AUTOARG*/
  // Outputs
  rd_data_end, rd_data_en, ecc_err_addr, bank_mach_next, accept_ns,
  accept, dfi_dram_clk_disable, dfi_reset_n, io_config, dfi_we_n1,
  dfi_we_n0, dfi_ras_n1, dfi_ras_n0, dfi_odt_wr1, dfi_odt_wr0,
  dfi_odt_nom1, dfi_odt_nom0, dfi_cs_n1, dfi_cs_n0, dfi_cas_n1,
  dfi_cas_n0, dfi_bank1, dfi_bank0, dfi_address1, dfi_address0,
  io_config_strobe, dfi_wrdata_en, dfi_rddata_en, wr_data_addr,
  wr_data_en, wr_data_offset, rd_data_addr, rd_data_offset,
  dfi_wrdata, dfi_wrdata_mask, rd_data, ecc_single, ecc_multiple,
  // Inputs
  use_addr, slot_1_present, slot_0_present, size, rst, row,
  raw_not_ecc, rank, hi_priority, dfi_rddata_valid, dfi_init_complete,
  data_buf_addr, correct_en, col, cmd, clk, bank, app_zq_req,
  app_ref_req, app_periodic_rd_req, dfi_rddata, wr_data, wr_data_mask
  );


  function integer cdiv (input integer num,
                         input integer div); // ceiling divide
    begin
      cdiv = (num/div) + (((num%div)>0) ? 1 : 0);
    end
  endfunction // cdiv

// Parameters for controller to PHY dfi interface.
// nCNFG2WR_EN and nRD_EN2CNFG_RD are not directly used by this controller design.
//  localparam nRD_EN2CNFG_RD = 1;
  localparam nRD_EN2CNFG_WR = (DRAM_TYPE == "DDR2")? 5:
                              (CL <= 6) ? 7 : ((CL == 7) || (CL == 8)) ? 8 : 9;
  localparam nWR_EN2CNFG_RD = 4;
  localparam nWR_EN2CNFG_WR = 4;
  localparam nCNFG2RD_EN = 2;
//  localparam nCNFG2WR_EN = (CWL <= 6) ? 2 : 3;
  localparam nCNFG2WR = 2;
  localparam nPHY_WRLAT = (CWL < 7) ? 0 : 1;
  
  //DELAY_WR_DATA_CNTRL is made as localprameter as the values of this
  //parameter are fixed for pirticular ECC-CWL combinations.
  localparam DELAY_WR_DATA_CNTRL = ((ECC == "ON") || (CWL < 7) )? 0 : 1;

`ifdef MC_SVA
  delay_wr_data_zero_CWL_le_6: assert property
    (@(posedge clk) ((CWL > 6) || (DELAY_WR_DATA_CNTRL == 0)));
`endif

  localparam nRP = cdiv(tRP, tCK) ;
  localparam nRCD = cdiv(tRCD, tCK);
  localparam nRAS = cdiv(tRAS, tCK);
  localparam nFAW = cdiv(tFAW, tCK);
  localparam nRRD_CK = cdiv(tRRD, tCK);


//As per specification, Write recover for autoprecharge ( cycles) doesn't support 
//values of 9 and 11. Rounding off the value 9, 11 to next integer.
  localparam nWR_CK = cdiv(15000, tCK) ;
  localparam nWR = ( nWR_CK == 9) ? 10 : (nWR_CK == 11) ? 12 : nWR_CK ;
  //parameter nWR = cdiv (15000, tCK);

  localparam nRRD = (DRAM_TYPE == "DDR3") ? (nRRD_CK < 4) ? 4 : nRRD_CK
                                          : (nRRD_CK < 2) ? 2 : nRRD_CK;
  localparam nWTR_CK = cdiv(tWTR, tCK);
  localparam nWTR = (DRAM_TYPE == "DDR3") ? (nWTR_CK < 4) ? 4 : nWTR_CK
                                          : (nWTR_CK < 2) ? 2 : nWTR_CK;
  localparam nRTP_CK = cdiv(tRTP, tCK);
  localparam nRTP = (DRAM_TYPE == "DDR3") ? (nRTP_CK < 4) ? 4 : nRTP_CK
                                          : (nRTP_CK < 2) ? 2 : nRTP_CK;

  localparam nRFC = cdiv(tRFC, tCK);

  localparam EARLY_WR_DATA_ADDR = (ECC == "ON") && (CWL<7)
                                    ? "ON"
                                    : "OFF";



// Maintenance functions.
  parameter MAINT_PRESCALER_PERIOD = 200000;  // 200 nS nominal.
  localparam MAINT_PRESCALER_DIV = MAINT_PRESCALER_PERIOD/(tCK * nCK_PER_CLK);  // Round down.
  localparam REFRESH_TIMER_DIV = (tREFI)/MAINT_PRESCALER_PERIOD;
  //parameter nREFRESH_BANK = 1; //default value is changed as 1 from 8. To make the refresh logic simple
                                 //moved to the module parameter list.
  localparam PERIODIC_RD_TIMER_DIV = tPRDI/MAINT_PRESCALER_PERIOD;
  localparam MAINT_PRESCALER_PERIOD_NS = MAINT_PRESCALER_PERIOD / 1000;
  localparam ZQ_TIMER_DIV = tZQI/MAINT_PRESCALER_PERIOD_NS;

`ifdef MC_SVA
  ranks_present: assert property
    (@(posedge clk) (rst || (|(slot_0_present | slot_1_present))));
`endif

// Reserved feature control.

// Open page wait mode is reserved.
// nOP_WAIT is the number of states a bank machine will park itself
// on an otherwise inactive open page before closing the page.  If
// nOP_WAIT == 0, open page wait mode is disabled.  If nOP_WAIT == -1,
// the bank machine will remain parked until the pool of idle bank machines
// are less than LOW_IDLE_CNT.  At which point parked bank machines
// is selected to exit until the number of idle bank machines exceeds
// the LOW_IDLE_CNT.
  localparam nOP_WAIT                 = 0;
  localparam LOW_IDLE_CNT             = 0;

  localparam RANK_BM_BV_WIDTH = nBANK_MACHS * RANKS;

  /*AUTOINPUT*/
  // Beginning of automatic inputs (from unused autoinst inputs)
  input                 app_periodic_rd_req;    // To rank_mach0 of rank_mach.v
  input                 app_ref_req;            // To rank_mach0 of rank_mach.v
  input                 app_zq_req;             // To rank_mach0 of rank_mach.v
  input [BANK_WIDTH-1:0] bank;                  // To bank_mach0 of bank_mach.v
  input                 clk;                    // To rank_mach0 of rank_mach.v, ...
  input [2:0]           cmd;                    // To bank_mach0 of bank_mach.v
  input [COL_WIDTH-1:0] col;                    // To bank_mach0 of bank_mach.v
  input                 correct_en;             // To ecc_dec_fix0 of ecc_dec_fix.v
  input [DATA_BUF_ADDR_WIDTH-1:0] data_buf_addr;// To bank_mach0 of bank_mach.v
  input                 dfi_init_complete;      // To rank_mach0 of rank_mach.v, ...
  input                 dfi_rddata_valid;       // To bank_mach0 of bank_mach.v, ...
  input                 hi_priority;            // To bank_mach0 of bank_mach.v
  input [RANK_WIDTH-1:0] rank;                  // To bank_mach0 of bank_mach.v
  input [3:0]           raw_not_ecc;            // To ecc_merge_enc0 of ecc_merge_enc.v
  input [ROW_WIDTH-1:0] row;                    // To bank_mach0 of bank_mach.v
  input                 rst;                    // To rank_mach0 of rank_mach.v, ...
  input                 size;                   // To bank_mach0 of bank_mach.v
  input [7:0]           slot_0_present;         // To rank_mach0 of rank_mach.v, ...
  input [7:0]           slot_1_present;         // To rank_mach0 of rank_mach.v, ...
  input                 use_addr;               // To bank_mach0 of bank_mach.v
  // End of automatics
  /*AUTOOUTPUT*/
  // Beginning of automatic outputs (from unused autoinst outputs)
  output                accept;                 // From bank_mach0 of bank_mach.v
  output                accept_ns;              // From bank_mach0 of bank_mach.v
  output [BM_CNT_WIDTH-1:0] bank_mach_next;     // From bank_mach0 of bank_mach.v
  output [MC_ERR_ADDR_WIDTH-1:0] ecc_err_addr;  // From col_mach0 of col_mach.v
  output                rd_data_en;             // From col_mach0 of col_mach.v
  output                rd_data_end;            // From col_mach0 of col_mach.v
  // End of automatics
  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [RANK_BM_BV_WIDTH-1:0] act_this_rank_r;  // From bank_mach0 of bank_mach.v
  wire [ROW_WIDTH-1:0]  col_a;                  // From bank_mach0 of bank_mach.v
  wire [BANK_WIDTH-1:0] col_ba;                 // From bank_mach0 of bank_mach.v
  wire [DATA_BUF_ADDR_WIDTH-1:0] col_data_buf_addr;// From bank_mach0 of bank_mach.v
  wire                  col_periodic_rd;        // From bank_mach0 of bank_mach.v
  wire [RANK_WIDTH-1:0] col_ra;                 // From bank_mach0 of bank_mach.v
  wire                  col_rmw;                // From bank_mach0 of bank_mach.v
  wire [ROW_WIDTH-1:0]  col_row;                // From bank_mach0 of bank_mach.v
  wire                  col_size;               // From bank_mach0 of bank_mach.v
  wire [DATA_BUF_ADDR_WIDTH-1:0] col_wr_data_buf_addr;// From bank_mach0 of bank_mach.v
  wire                  dq_busy_data;           // From col_mach0 of col_mach.v
  wire                  ecc_status_valid;       // From col_mach0 of col_mach.v
  wire [RANKS-1:0]      inhbt_act_faw_r;        // From rank_mach0 of rank_mach.v
  wire                  inhbt_rd_config;        // From col_mach0 of col_mach.v
  wire [RANKS-1:0]      inhbt_rd_r;             // From rank_mach0 of rank_mach.v
  wire                  inhbt_wr_config;        // From col_mach0 of col_mach.v
  wire                  insert_maint_r1;        // From bank_mach0 of bank_mach.v
  wire [RANK_WIDTH-1:0] maint_rank_r;           // From rank_mach0 of rank_mach.v
  wire                  maint_req_r;            // From rank_mach0 of rank_mach.v
  wire                  maint_wip_r;            // From bank_mach0 of bank_mach.v
  wire                  maint_zq_r;             // From rank_mach0 of rank_mach.v
  wire                  periodic_rd_ack_r;      // From bank_mach0 of bank_mach.v
  wire                  periodic_rd_r;          // From rank_mach0 of rank_mach.v
  wire [RANK_WIDTH-1:0] periodic_rd_rank_r;     // From rank_mach0 of rank_mach.v
  wire [(RANKS*nBANK_MACHS)-1:0] rank_busy_r;   // From bank_mach0 of bank_mach.v
  wire                  rd_rmw;                 // From col_mach0 of col_mach.v
  wire [RANK_BM_BV_WIDTH-1:0] rd_this_rank_r;   // From bank_mach0 of bank_mach.v
  wire [nBANK_MACHS-1:0] sending_col;           // From bank_mach0 of bank_mach.v
  wire [nBANK_MACHS-1:0] sending_row;           // From bank_mach0 of bank_mach.v
  wire                  sent_col;               // From bank_mach0 of bank_mach.v
  wire                  wr_ecc_buf;             // From col_mach0 of col_mach.v
  wire [RANK_BM_BV_WIDTH-1:0] wr_this_rank_r;   // From bank_mach0 of bank_mach.v
  wire [RANKS-1:0]      wtr_inhbt_config_r;     // From rank_mach0 of rank_mach.v
  // End of automatics

  output reg dfi_dram_clk_disable = 1'b0;
  output reg dfi_reset_n = 1'b1;

  rank_mach #
    (/*AUTOINSTPARAM*/
     // Parameters
     .BURST_MODE                        (BURST_MODE),
     .CS_WIDTH                          (CS_WIDTH),
     .DRAM_TYPE                         (DRAM_TYPE),
     .MAINT_PRESCALER_DIV               (MAINT_PRESCALER_DIV),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .CL                                (CL),
     .nFAW                              (nFAW),
     .nREFRESH_BANK                     (nREFRESH_BANK),
     .nRRD                              (nRRD),
     .nWTR                              (nWTR),
     .PERIODIC_RD_TIMER_DIV             (PERIODIC_RD_TIMER_DIV),
     .RANK_BM_BV_WIDTH                  (RANK_BM_BV_WIDTH),
     .RANK_WIDTH                        (RANK_WIDTH),
     .RANKS                             (RANKS),
     .PHASE_DETECT                      (PHASE_DETECT),//to controll periodic reads
     .REFRESH_TIMER_DIV                 (REFRESH_TIMER_DIV),
     .ZQ_TIMER_DIV                      (ZQ_TIMER_DIV))
    rank_mach0
      (/*AUTOINST*/
       // Outputs
       .maint_req_r                     (maint_req_r),
       .periodic_rd_r                   (periodic_rd_r),
       .periodic_rd_rank_r              (periodic_rd_rank_r[RANK_WIDTH-1:0]),
       .inhbt_act_faw_r                 (inhbt_act_faw_r[RANKS-1:0]),
       .inhbt_rd_r                      (inhbt_rd_r[RANKS-1:0]),
       .wtr_inhbt_config_r              (wtr_inhbt_config_r[RANKS-1:0]),
       .maint_rank_r                    (maint_rank_r[RANK_WIDTH-1:0]),
       .maint_zq_r                      (maint_zq_r),
       // Inputs
       .act_this_rank_r                 (act_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
       .app_periodic_rd_req             (app_periodic_rd_req),
       .app_ref_req                     (app_ref_req),
       .app_zq_req                      (app_zq_req),
       .clk                             (clk),
       .dfi_init_complete               (dfi_init_complete),
       .insert_maint_r1                 (insert_maint_r1),
       .maint_wip_r                     (maint_wip_r),
       .periodic_rd_ack_r               (periodic_rd_ack_r),
       .rank_busy_r                     (rank_busy_r[(RANKS*nBANK_MACHS)-1:0]),
       .rd_this_rank_r                  (rd_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
       .rst                             (rst),
       .sending_col                     (sending_col[nBANK_MACHS-1:0]),
       .sending_row                     (sending_row[nBANK_MACHS-1:0]),
       .slot_0_present                  (slot_0_present[7:0]),
       .slot_1_present                  (slot_1_present[7:0]),
       .wr_this_rank_r                  (wr_this_rank_r[RANK_BM_BV_WIDTH-1:0]));

  output reg dfi_we_n1;
  output reg dfi_we_n0;
  output reg dfi_ras_n1;
  output reg dfi_ras_n0;
  output reg [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_wr1;
  output reg [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_wr0;
  output reg [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_nom1;
  output reg [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_nom0;
  output reg [CS_WIDTH*nCS_PER_RANK-1:0] dfi_cs_n1;
  output reg [CS_WIDTH*nCS_PER_RANK-1:0] dfi_cs_n0;
  output reg dfi_cas_n1;
  output reg dfi_cas_n0;
  output reg [BANK_WIDTH-1:0] dfi_bank1;
  output reg [BANK_WIDTH-1:0] dfi_bank0;
  output reg [ROW_WIDTH-1:0] dfi_address1;
  output reg [ROW_WIDTH-1:0] dfi_address0;
  output reg [RANK_WIDTH:0] io_config;  
  output reg io_config_strobe;
  output reg [DQS_WIDTH-1:0] dfi_wrdata_en;
  output reg [DQS_WIDTH-1:0] dfi_rddata_en;
  output reg [DATA_BUF_ADDR_WIDTH-1:0] wr_data_addr;
  output reg wr_data_en;
  output reg [DATA_BUF_OFFSET_WIDTH-1:0] wr_data_offset;

  wire dfi_we_n1_ns;
  wire dfi_we_n0_ns;
  wire dfi_ras_n1_ns;
  wire dfi_ras_n0_ns;
  wire [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_wr1_ns;
  wire [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_wr0_ns;
  wire [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_nom1_ns;
  wire [nSLOTS*nCS_PER_RANK-1:0] dfi_odt_nom0_ns;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] dfi_cs_n1_ns;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] dfi_cs_n0_ns;
  wire dfi_cas_n1_ns;
  wire  dfi_cas_n0_ns;
  wire [BANK_WIDTH-1:0] dfi_bank1_ns;
  wire [BANK_WIDTH-1:0] dfi_bank0_ns;
  wire [ROW_WIDTH-1:0] dfi_address1_ns;
  wire [ROW_WIDTH-1:0] dfi_address0_ns;
  wire [RANK_WIDTH:0] io_config_ns;
  wire io_config_strobe_ns;
  wire [DQ_WIDTH-1:0] dfi_rddata_en_ns;
  wire [DQ_WIDTH-1:0] dfi_wrdata_en_ns;
  wire  wr_data_en_ns;
  wire [DATA_BUF_ADDR_WIDTH-1:0] wr_data_addr_ns;
  wire [DATA_BUF_OFFSET_WIDTH-1:0] wr_data_offset_ns;

  generate
    if (CMD_PIPE_PLUS1 == "ON") begin : cmd_pipe_plus 
      always @(posedge clk) begin
        dfi_we_n1 <= #TCQ dfi_we_n1_ns;
        dfi_we_n0 <= #TCQ dfi_we_n0_ns;
        dfi_ras_n1 <= #TCQ dfi_ras_n1_ns;
        dfi_ras_n0 <= #TCQ dfi_ras_n0_ns;
        dfi_odt_wr1 <= #TCQ dfi_odt_wr1_ns;
        dfi_odt_wr0 <= #TCQ dfi_odt_wr0_ns;
        dfi_odt_nom1 <= #TCQ dfi_odt_nom1_ns;
        dfi_odt_nom0 <= #TCQ dfi_odt_nom0_ns;
        dfi_cs_n1 <= #TCQ dfi_cs_n1_ns;
        dfi_cs_n0 <= #TCQ dfi_cs_n0_ns;
        dfi_cas_n1 <= #TCQ dfi_cas_n1_ns;
        dfi_cas_n0 <= #TCQ dfi_cas_n0_ns;
        dfi_bank1 <= #TCQ dfi_bank1_ns;
        dfi_bank0 <= #TCQ dfi_bank0_ns;
        dfi_address1 <= #TCQ dfi_address1_ns;
        dfi_address0 <= #TCQ dfi_address0_ns;
        io_config <= #TCQ io_config_ns;
        io_config_strobe <= #TCQ io_config_strobe_ns;
        dfi_wrdata_en <= #TCQ dfi_wrdata_en_ns;
        dfi_rddata_en <= #TCQ dfi_rddata_en_ns;
        wr_data_en <= #TCQ wr_data_en_ns;
        wr_data_addr <= #TCQ wr_data_addr_ns;
        wr_data_offset <= #TCQ wr_data_offset_ns;
      end // always @ (posedge clk)
    end // block: cmd_pipe_plus
    else begin : cmd_pipe_plus0
      always @(/*AS*/dfi_address0_ns or dfi_address1_ns
               or dfi_bank0_ns or dfi_bank1_ns or dfi_cas_n0_ns
               or dfi_cas_n1_ns or dfi_cs_n0_ns or dfi_cs_n1_ns
               or dfi_odt_nom0_ns or dfi_odt_nom1_ns or dfi_odt_wr0_ns
               or dfi_odt_wr1_ns or dfi_ras_n0_ns or dfi_ras_n1_ns
               or dfi_rddata_en_ns or dfi_we_n0_ns or dfi_we_n1_ns
               or dfi_wrdata_en_ns or io_config_ns
               or io_config_strobe_ns or wr_data_addr_ns
               or wr_data_en_ns or wr_data_offset_ns) begin
        dfi_we_n1 <= #TCQ dfi_we_n1_ns;
        dfi_we_n0 <= #TCQ dfi_we_n0_ns;
        dfi_ras_n1 <= #TCQ dfi_ras_n1_ns;
        dfi_ras_n0 <= #TCQ dfi_ras_n0_ns;
        dfi_odt_wr1 <= #TCQ dfi_odt_wr1_ns;
        dfi_odt_wr0 <= #TCQ dfi_odt_wr0_ns;
        dfi_odt_nom1 <= #TCQ dfi_odt_nom1_ns;
        dfi_odt_nom0 <= #TCQ dfi_odt_nom0_ns;
        dfi_cs_n1 <= #TCQ dfi_cs_n1_ns;
        dfi_cs_n0 <= #TCQ dfi_cs_n0_ns;
        dfi_cas_n1 <= #TCQ dfi_cas_n1_ns;
        dfi_cas_n0 <= #TCQ dfi_cas_n0_ns;
        dfi_bank1 <= #TCQ dfi_bank1_ns;
        dfi_bank0 <= #TCQ dfi_bank0_ns;
        dfi_address1 <= #TCQ dfi_address1_ns;
        dfi_address0 <= #TCQ dfi_address0_ns;
        io_config <= #TCQ io_config_ns;
        io_config_strobe <= #TCQ io_config_strobe_ns;
        dfi_wrdata_en <= #TCQ dfi_wrdata_en_ns;
        dfi_rddata_en <= #TCQ dfi_rddata_en_ns;
        wr_data_en <= #TCQ wr_data_en_ns;
        wr_data_addr <= #TCQ wr_data_addr_ns;
        wr_data_offset <= #TCQ wr_data_offset_ns;
      end // always @ (...
    end // block: cmd_pipe_plus0
  endgenerate
  
  output [DATA_BUF_ADDR_WIDTH-1:0] rd_data_addr;

  bank_mach#
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .ADDR_CMD_MODE                     (ADDR_CMD_MODE),
     .BANK_WIDTH                        (BANK_WIDTH),
     .BM_CNT_WIDTH                      (BM_CNT_WIDTH),
     .BURST_MODE                        (BURST_MODE),
     .COL_WIDTH                         (COL_WIDTH),
     .CS_WIDTH                          (CS_WIDTH),
     .CWL                               (CWL),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .DRAM_TYPE                         (DRAM_TYPE),
     .EARLY_WR_DATA_ADDR                (EARLY_WR_DATA_ADDR),
     .ECC                               (ECC),
     .LOW_IDLE_CNT                      (LOW_IDLE_CNT),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nCNFG2RD_EN                       (nCNFG2RD_EN),
     .nCNFG2WR                          (nCNFG2WR),
     .nCS_PER_RANK                      (nCS_PER_RANK),
     .nOP_WAIT                          (nOP_WAIT),
     .nRAS                              (nRAS),
     .nRCD                              (nRCD),
     .nRFC                              (nRFC),
     .nRTP                              (nRTP),
     .nRP                               (nRP),
     .nSLOTS                            (nSLOTS),
     .nWR                               (nWR),
     .ORDERING                          (ORDERING),
     .RANK_BM_BV_WIDTH                  (RANK_BM_BV_WIDTH),
     .RANK_WIDTH                        (RANK_WIDTH),
     .RANKS                             (RANKS),
     .ROW_WIDTH                         (ROW_WIDTH),
     .RTT_NOM                           (RTT_NOM),
     .RTT_WR                            (RTT_WR),
     .STARVE_LIMIT                      (STARVE_LIMIT),
     .SLOT_0_CONFIG                     (SLOT_0_CONFIG),
     .SLOT_1_CONFIG                     (SLOT_1_CONFIG),
     .tZQCS                             (tZQCS))
      bank_mach0
      (.dfi_we_n1                       (dfi_we_n1_ns),
       .dfi_we_n0                       (dfi_we_n0_ns),
       .dfi_ras_n1                      (dfi_ras_n1_ns),     
       .dfi_ras_n0                      (dfi_ras_n0_ns),
       .dfi_odt_wr1                     (dfi_odt_wr1_ns[nSLOTS*nCS_PER_RANK-1:0]),
       .dfi_odt_wr0                     (dfi_odt_wr0_ns[nSLOTS*nCS_PER_RANK-1:0]),
       .dfi_odt_nom1                    (dfi_odt_nom1_ns[nSLOTS*nCS_PER_RANK-1:0]),
       .dfi_odt_nom0                    (dfi_odt_nom0_ns[nSLOTS*nCS_PER_RANK-1:0]),
       .dfi_cs_n1                       (dfi_cs_n1_ns[CS_WIDTH*nCS_PER_RANK-1:0]),
       .dfi_cs_n0                       (dfi_cs_n0_ns[CS_WIDTH*nCS_PER_RANK-1:0]),
       .dfi_cas_n1                      (dfi_cas_n1_ns),
       .dfi_cas_n0                      (dfi_cas_n0_ns),
       .dfi_bank1                       (dfi_bank1_ns[BANK_WIDTH-1:0]),
       .dfi_bank0                       (dfi_bank0_ns[BANK_WIDTH-1:0]),
       .dfi_address1                    (dfi_address1_ns[ROW_WIDTH-1:0]),
       .dfi_address0                    (dfi_address0_ns[ROW_WIDTH-1:0]),
       .io_config                       (io_config_ns[RANK_WIDTH:0]), 
       .io_config_strobe                (io_config_strobe_ns),
       /*AUTOINST*/
       // Outputs
       .accept                          (accept),
       .accept_ns                       (accept_ns),
       .bank_mach_next                  (bank_mach_next[BM_CNT_WIDTH-1:0]),
       .col_a                           (col_a[ROW_WIDTH-1:0]),
       .col_ba                          (col_ba[BANK_WIDTH-1:0]),
       .col_data_buf_addr               (col_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .col_periodic_rd                 (col_periodic_rd),
       .col_ra                          (col_ra[RANK_WIDTH-1:0]),
       .col_rmw                         (col_rmw),
       .col_row                         (col_row[ROW_WIDTH-1:0]),
       .col_size                        (col_size),
       .col_wr_data_buf_addr            (col_wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .insert_maint_r1                 (insert_maint_r1),
       .maint_wip_r                     (maint_wip_r),
       .sending_row                     (sending_row[nBANK_MACHS-1:0]),
       .sending_col                     (sending_col[nBANK_MACHS-1:0]),
       .sent_col                        (sent_col),
       .periodic_rd_ack_r               (periodic_rd_ack_r),
       .act_this_rank_r                 (act_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
       .wr_this_rank_r                  (wr_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
       .rd_this_rank_r                  (rd_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
       .rank_busy_r                     (rank_busy_r[(RANKS*nBANK_MACHS)-1:0]),
       // Inputs
       .bank                            (bank[BANK_WIDTH-1:0]),
       .clk                             (clk),
       .cmd                             (cmd[2:0]),
       .col                             (col[COL_WIDTH-1:0]),
       .data_buf_addr                   (data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .dfi_init_complete               (dfi_init_complete),
       .dfi_rddata_valid                (dfi_rddata_valid),
       .dq_busy_data                    (dq_busy_data),
       .hi_priority                     (hi_priority),
       .inhbt_act_faw_r                 (inhbt_act_faw_r[RANKS-1:0]),
       .inhbt_rd_config                 (inhbt_rd_config),
       .inhbt_rd_r                      (inhbt_rd_r[RANKS-1:0]),
       .inhbt_wr_config                 (inhbt_wr_config),
       .maint_rank_r                    (maint_rank_r[RANK_WIDTH-1:0]),
       .maint_req_r                     (maint_req_r),
       .maint_zq_r                      (maint_zq_r),
       .periodic_rd_r                   (periodic_rd_r),
       .periodic_rd_rank_r              (periodic_rd_rank_r[RANK_WIDTH-1:0]),
       .rank                            (rank[RANK_WIDTH-1:0]),
       .rd_data_addr                    (rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .rd_rmw                          (rd_rmw),
       .row                             (row[ROW_WIDTH-1:0]),
       .rst                             (rst),
       .size                            (size),
       .slot_0_present                  (slot_0_present[7:0]),
       .slot_1_present                  (slot_1_present[7:0]),
       .use_addr                        (use_addr),
       .wtr_inhbt_config_r              (wtr_inhbt_config_r[RANKS-1:0]));

  output [DATA_BUF_OFFSET_WIDTH-1:0]rd_data_offset;

  wire mc_rddata_valid;
  col_mach #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .BANK_WIDTH                        (BANK_WIDTH),
     .BURST_MODE                        (BURST_MODE),
     .COL_WIDTH                         (COL_WIDTH),
     .CS_WIDTH                          (CS_WIDTH),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .DATA_BUF_OFFSET_WIDTH             (DATA_BUF_OFFSET_WIDTH),
     .DELAY_WR_DATA_CNTRL               (DELAY_WR_DATA_CNTRL),
     .DQS_WIDTH                         (DQS_WIDTH),
     .DRAM_TYPE                         (DRAM_TYPE),
     .EARLY_WR_DATA_ADDR                (EARLY_WR_DATA_ADDR),
     .ECC                               (ECC),
     .MC_ERR_ADDR_WIDTH                 (MC_ERR_ADDR_WIDTH),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nPHY_WRLAT                        (nPHY_WRLAT),
     .nRD_EN2CNFG_WR                    (nRD_EN2CNFG_WR),
     .nWR_EN2CNFG_RD                    (nWR_EN2CNFG_RD),
     .nWR_EN2CNFG_WR                    (nWR_EN2CNFG_WR),
     .RANK_WIDTH                        (RANK_WIDTH),
     .ROW_WIDTH                         (ROW_WIDTH))
    col_mach0
       (.wr_data_offset                 (wr_data_offset_ns),
        .wr_data_en                     (wr_data_en_ns),
        .wr_data_addr                   (wr_data_addr_ns),
        .io_config                      (io_config_ns),
        .dfi_wrdata_en                  (dfi_wrdata_en_ns[DQS_WIDTH-1:0]),
        .dfi_rddata_en                  (dfi_rddata_en_ns[DQS_WIDTH-1:0]),
        /*AUTOINST*/
        // Outputs
        .dq_busy_data                   (dq_busy_data),
        .inhbt_wr_config                (inhbt_wr_config),
        .inhbt_rd_config                (inhbt_rd_config),
        .rd_rmw                         (rd_rmw),
        .ecc_err_addr                   (ecc_err_addr[MC_ERR_ADDR_WIDTH-1:0]),
        .ecc_status_valid               (ecc_status_valid),
        .wr_ecc_buf                     (wr_ecc_buf),
        .rd_data_end                    (rd_data_end),
        .rd_data_addr                   (rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .rd_data_offset                 (rd_data_offset[DATA_BUF_OFFSET_WIDTH-1:0]),
        .rd_data_en                     (rd_data_en),
        // Inputs
        .clk                            (clk),
        .rst                            (rst),
        .sent_col                       (sent_col),
        .col_size                       (col_size),
        .col_wr_data_buf_addr           (col_wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .dfi_rddata_valid               (dfi_rddata_valid),
        .col_periodic_rd                (col_periodic_rd),
        .col_data_buf_addr              (col_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .col_rmw                        (col_rmw),
        .col_ra                         (col_ra[RANK_WIDTH-1:0]),
        .col_ba                         (col_ba[BANK_WIDTH-1:0]),
        .col_row                        (col_row[ROW_WIDTH-1:0]),
        .col_a                          (col_a[ROW_WIDTH-1:0]));

  localparam CODE_WIDTH = DATA_WIDTH+ECC_WIDTH;
  input [4*DQ_WIDTH-1:0] dfi_rddata;
  output wire [4*DQ_WIDTH-1:0] dfi_wrdata;
  output wire [(4*DQ_WIDTH/8)-1:0] dfi_wrdata_mask;
  output wire [4*PAYLOAD_WIDTH-1:0] rd_data;
  input [4*PAYLOAD_WIDTH-1:0] wr_data;
  input [4*DATA_WIDTH/8-1:0] wr_data_mask;
  output [3:0] ecc_single;
  output [3:0] ecc_multiple;
  generate
    if (ECC == "OFF") begin : ecc_off
      assign rd_data = dfi_rddata;
      assign dfi_wrdata = wr_data;
      assign dfi_wrdata_mask = wr_data_mask;
      assign ecc_single = 4'b0;
      assign ecc_multiple = 4'b0;
    end
    else begin : ecc_on
      wire [CODE_WIDTH*ECC_WIDTH-1:0] h_rows;
      wire [4*DATA_WIDTH-1:0] rd_merge_data;
      ecc_merge_enc #
        (/*AUTOINSTPARAM*/
         // Parameters
         .TCQ                           (TCQ),
         .PAYLOAD_WIDTH                 (PAYLOAD_WIDTH),
         .CODE_WIDTH                    (CODE_WIDTH),
         .DATA_BUF_ADDR_WIDTH           (DATA_BUF_ADDR_WIDTH),
         .DATA_BUF_OFFSET_WIDTH         (DATA_BUF_OFFSET_WIDTH),
         .DATA_WIDTH                    (DATA_WIDTH),
         .DQ_WIDTH                      (DQ_WIDTH),
         .ECC_WIDTH                     (ECC_WIDTH))
        ecc_merge_enc0
          (/*AUTOINST*/
           // Outputs
           .dfi_wrdata                  (dfi_wrdata[4*DQ_WIDTH-1:0]),
           .dfi_wrdata_mask             (dfi_wrdata_mask[4*DQ_WIDTH/8-1:0]),
           // Inputs
           .clk                         (clk),
           .rst                         (rst),
           .wr_data                     (wr_data[4*PAYLOAD_WIDTH-1:0]),
           .wr_data_mask                (wr_data_mask[4*DATA_WIDTH/8-1:0]),
           .rd_merge_data               (rd_merge_data[4*DATA_WIDTH-1:0]),
           .h_rows                      (h_rows[CODE_WIDTH*ECC_WIDTH-1:0]),
           .raw_not_ecc                 (raw_not_ecc[3:0]));

       ecc_dec_fix #
        (/*AUTOINSTPARAM*/
         // Parameters
         .TCQ                           (TCQ),
         .PAYLOAD_WIDTH                 (PAYLOAD_WIDTH),
         .CODE_WIDTH                    (CODE_WIDTH),
         .DATA_WIDTH                    (DATA_WIDTH),
         .DQ_WIDTH                      (DQ_WIDTH),
         .ECC_WIDTH                     (ECC_WIDTH))
        ecc_dec_fix0
          (/*AUTOINST*/
           // Outputs
           .rd_data                     (rd_data[4*PAYLOAD_WIDTH-1:0]),
           .ecc_single                  (ecc_single[3:0]),
           .ecc_multiple                (ecc_multiple[3:0]),
           // Inputs
           .clk                         (clk),
           .rst                         (rst),
           .h_rows                      (h_rows[CODE_WIDTH*ECC_WIDTH-1:0]),
           .dfi_rddata                  (dfi_rddata[4*DQ_WIDTH-1:0]),
           .correct_en                  (correct_en),
           .ecc_status_valid            (ecc_status_valid));

      ecc_buf #
        (/*AUTOINSTPARAM*/
         // Parameters
         .TCQ                           (TCQ),
         .PAYLOAD_WIDTH                 (PAYLOAD_WIDTH),
         .DATA_BUF_ADDR_WIDTH           (DATA_BUF_ADDR_WIDTH),
         .DATA_BUF_OFFSET_WIDTH         (DATA_BUF_OFFSET_WIDTH),
         .DATA_WIDTH                    (DATA_WIDTH))
        ecc_buf0
          (.wr_data_addr                (wr_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
           .wr_data_offset              (wr_data_offset[DATA_BUF_OFFSET_WIDTH-1:0]),
           /*AUTOINST*/
           // Outputs
           .rd_merge_data               (rd_merge_data[4*DATA_WIDTH-1:0]),
           // Inputs
           .clk                         (clk),
           .rst                         (rst),
           .rd_data_addr                (rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
           .rd_data_offset              (rd_data_offset[DATA_BUF_OFFSET_WIDTH-1:0]),
           .rd_data                     (rd_data[4*PAYLOAD_WIDTH-1:0]),
           .wr_ecc_buf                  (wr_ecc_buf));
 
      ecc_gen #
        (/*AUTOINSTPARAM*/
         // Parameters
         .CODE_WIDTH                    (CODE_WIDTH),
         .ECC_WIDTH                     (ECC_WIDTH),
         .DATA_WIDTH                    (DATA_WIDTH))
         ecc_gen0
         (/*AUTOINST*/
          // Outputs
          .h_rows                       (h_rows[CODE_WIDTH*ECC_WIDTH-1:0]));

`ifdef DISPLAY_H_MATRIX
      integer i;
      always @(negedge rst) begin
        $display ("**********************************************");
        $display ("H Matrix:");
        for (i=0; i<ECC_WIDTH; i=i+1)
          $display ("%b", h_rows[i*CODE_WIDTH+:CODE_WIDTH]);
        $display ("**********************************************");
      end
`endif
      
    end
  endgenerate

endmodule // mc

// Local Variables:
// verilog-library-directories:("." "../ecc")
// End:

