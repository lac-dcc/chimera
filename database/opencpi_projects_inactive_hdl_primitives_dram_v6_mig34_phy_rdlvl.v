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
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version:
//  \   \         Application: MIG
//  /   /         Filename: phy_rdlvl.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created:
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Read leveling calibration logic
//  NOTES:
//    1. DQ per-bit deskew is not yet supported
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_rdlvl.v,v 1.6 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.6 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_rdlvl.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_rdlvl #
  (
   parameter TCQ             = 100,    // clk->out delay (sim only)
   parameter nCK_PER_CLK     = 2,      // # of memory clocks per CLK
   parameter CLK_PERIOD      = 3333,   // Internal clock period (in ps)
   parameter REFCLK_FREQ     = 300,    // IODELAY Reference Clock freq (MHz)
   parameter DQ_WIDTH        = 64,     // # of DQ (data)
   parameter DQS_CNT_WIDTH   = 3,      // = ceil(log2(DQS_WIDTH))
   parameter DQS_WIDTH       = 8,      // # of DQS (strobe)
   parameter DRAM_WIDTH      = 8,      // # of DQ per DQS
   parameter PD_TAP_REQ      = 10,     // # of IODELAY taps reserved for PD
   parameter nCL             = 5,      // Read CAS latency (in clk cyc)
   parameter SIM_CAL_OPTION  = "NONE", // Skip various calibration steps
   parameter DEBUG_PORT      = "OFF"   // Enable debug port
   )
  (
   input                        clk,
   input                        rst,
   // Calibration status, control signals
   input [1:0]                  rdlvl_start,
   input                        rdlvl_rd_active,
   output reg [1:0]             rdlvl_done,
   output reg [1:0]             rdlvl_err,
   output reg                   rdlvl_prech_req,
   input                        prech_done,
   // Captured data in resync clock domain
   input [DQ_WIDTH-1:0]         rd_data_rise0,
   input [DQ_WIDTH-1:0]         rd_data_fall0,
   input [DQ_WIDTH-1:0]         rd_data_rise1,
   input [DQ_WIDTH-1:0]         rd_data_fall1,
   // Stage 1 calibration outputs
   output reg [DQS_WIDTH-1:0]      dlyce_cpt,
   output reg                      dlyinc_cpt,
   output reg [3:0]                dlyce_rsync,
   output reg                      dlyinc_rsync,
   output reg [5*DQS_WIDTH-1:0]    dlyval_dq, 
   output reg [5*DQS_WIDTH-1:0]    dlyval_dqs,   
   // Stage 2 calibration inputs/outputs
   output reg [2*DQS_WIDTH-1:0] rd_bitslip_cnt,
   output reg [2*DQS_WIDTH-1:0] rd_clkdly_cnt,
   output reg [4:0]             rd_active_dly,
   input                        rdlvl_pat_resume,   // resume pattern calib
   output reg                   rdlvl_pat_err,      // error during pattern cal
   output [DQS_CNT_WIDTH-1:0]   rdlvl_pat_err_cnt,  // erroring DQS group
   // Debug Port
   output [5*DQS_WIDTH-1:0]     dbg_cpt_first_edge_cnt,
   output [5*DQS_WIDTH-1:0]     dbg_cpt_second_edge_cnt,
   output reg [3*DQS_WIDTH-1:0] dbg_rd_bitslip_cnt,
   output reg [2*DQS_WIDTH-1:0] dbg_rd_clkdly_cnt, 
   output reg [4:0]             dbg_rd_active_dly,
   input                        dbg_idel_up_all,
   input                        dbg_idel_down_all,
   input                        dbg_idel_up_cpt,
   input                        dbg_idel_down_cpt,
   input                        dbg_idel_up_rsync,
   input                        dbg_idel_down_rsync,
   input [DQS_CNT_WIDTH-1:0]    dbg_sel_idel_cpt,
   input                        dbg_sel_all_idel_cpt,
   input [DQS_CNT_WIDTH-1:0]    dbg_sel_idel_rsync,
   input                        dbg_sel_all_idel_rsync,
   output [255:0]               dbg_phy_rdlvl
   );

  // minimum time (in IDELAY taps) for which capture data must be stable for
  // algorithm to consider a valid data eye to be found. The read leveling 
  // logic will ignore any window found smaller than this value. Limitations
  // on how small this number can be is determined by: (1) the algorithmic
  // limitation of how many taps wide the data eye can be (3 taps), and (2)
  // how wide regions of "instability" that occur around the edges of the
  // read valid window can be (i.e. need to be able to filter out "false"
  // windows that occur for a short # of taps around the edges of the true
  // data window, although with multi-sampling during read leveling, this is
  // not as much a concern) - the larger the value, the more protection 
  // against "false" windows  
  localparam MIN_EYE_SIZE = 3;
  // # of clock cycles to wait after changing IDELAY value or read data MUX
  // to allow both IDELAY chain to settle, and for delayed input to
  // propagate thru ISERDES
  localparam PIPE_WAIT_CNT = 16;
  // Length of calibration sequence (in # of words)
  localparam CAL_PAT_LEN = 8;
  // Read data shift register length
  localparam RD_SHIFT_LEN = CAL_PAT_LEN/(2*nCK_PER_CLK);
  // Amount to shift by if one edge found (= 0.5*(bit_period)). Limit to 31
  localparam integer IODELAY_TAP_RES = 1000000/(REFCLK_FREQ * 64);
  localparam TBY4_TAPS
             = (((CLK_PERIOD/nCK_PER_CLK/4)/IODELAY_TAP_RES) > 31) ? 31 :
                    ((CLK_PERIOD/nCK_PER_CLK/4)/IODELAY_TAP_RES);
  // Maximum amount to wait after read issued until read data returned
  localparam MAX_RD_DLY_CNT = 32;
  // # of cycles to wait after changing RDEN count value
  localparam RDEN_WAIT_CNT = 8;
  // used during read enable calibration - difference between what the
  // calibration logic measured read enable delay to be, and what it needs
  // to set the value of the read active delay control to be
  localparam RDEN_DELAY_OFFSET = 5;
  // # of read data samples to examine when detecting whether an edge has 
  // occured during stage 1 calibration. Width of local param must be
  // changed as appropriate. Note that there are two counters used, each
  // counter can be changed independently of the other - they are used in
  // cascade to create a larger counter
  localparam [11:0] DETECT_EDGE_SAMPLE_CNT0 = 12'hFFF;
  localparam [11:0] DETECT_EDGE_SAMPLE_CNT1 = 12'h001;
  // # of taps in IDELAY chain. When the phase detector taps are reserved
  // before the start of calibration, reduce half that amount from the
  // total available taps.
  localparam IODELAY_TAP_LEN = 32 - (PD_TAP_REQ/2);
  // Half the PD taps
  localparam PD_HALF_TAP = (PD_TAP_REQ/2);
  
  localparam [4:0] CAL1_IDLE                = 5'h00;
  localparam [4:0] CAL1_NEW_DQS_WAIT        = 5'h01;
  localparam [4:0] CAL1_IDEL_STORE_FIRST    = 5'h02;
  localparam [4:0] CAL1_DETECT_EDGE         = 5'h03;
  localparam [4:0] CAL1_IDEL_STORE_OLD      = 5'h04;
  localparam [4:0] CAL1_IDEL_INC_CPT        = 5'h05;
  localparam [4:0] CAL1_IDEL_INC_CPT_WAIT   = 5'h06;
  localparam [4:0] CAL1_CALC_IDEL           = 5'h07;
  localparam [4:0] CAL1_IDEL_DEC_CPT        = 5'h08;
  localparam [4:0] CAL1_NEXT_DQS            = 5'h09;  
  localparam [4:0] CAL1_DONE                = 5'h0A;
  localparam [4:0] CAL1_RST_CPT             = 5'h0B;
  localparam [4:0] CAL1_DETECT_EDGE_DQ      = 5'h0C;
  localparam [4:0] CAL1_IDEL_INC_DQ         = 5'h0D;
  localparam [4:0] CAL1_IDEL_INC_DQ_WAIT    = 5'h0E;
  localparam [4:0] CAL1_CALC_IDEL_DQ        = 5'h0F;
  localparam [4:0] CAL1_IDEL_INC_DQ_CPT     = 5'h10;
  localparam [4:0] CAL1_IDEL_INC_PD_CPT     = 5'h11;
  localparam [4:0] CAL1_IDEL_PD_ADJ         = 5'h12;
  localparam [4:0] CAL1_SKIP_RDLVL_INC_IDEL = 5'h1F; // Only for simulation
  
  localparam CAL2_IDLE         = 3'h0;
  localparam CAL2_READ_WAIT    = 3'h1;
  localparam CAL2_DETECT_MATCH = 3'h2;
  localparam CAL2_BITSLIP_WAIT = 3'h3;
  localparam CAL2_NEXT_DQS     = 3'h4;
  localparam CAL2_DONE         = 3'h5;
  localparam CAL2_ERROR_TO     = 3'h6;

  integer    i;
  integer    j;
  integer    x;
  genvar     z;
  
  reg [DQS_CNT_WIDTH-1:0] cal1_cnt_cpt_r;
  reg                     cal1_dlyce_cpt_r;
  reg                     cal1_dlyinc_cpt_r;
  reg [4:0]               cal1_dq_tap_cnt_r;
  reg                     cal1_dq_taps_inc_r;
  wire                    cal1_found_edge;
  reg                     cal1_prech_req_r;
  reg [4:0]               cal1_state_r;
  reg [2*DQS_WIDTH-1:0]   cal2_clkdly_cnt_r;
  reg [1:0]               cal2_cnt_bitslip_r;
  reg [4:0]               cal2_cnt_rd_dly_r;
  reg [DQS_CNT_WIDTH-1:0] cal2_cnt_rden_r;
  reg [DQS_WIDTH-1:0]     cal2_deskew_err_r;
  reg [4:0]               cal2_dly_cnt_delta_r[DQS_WIDTH-1:0];
  reg                     cal2_done_r;
  reg                     cal2_done_r1;
  reg                     cal2_done_r2;
  reg                     cal2_done_r3;  
  reg [5*DQS_WIDTH-1:0]   cal2_dly_cnt_r;
  reg                     cal2_en_dqs_skew_r;
  reg [4:0]               cal2_max_cnt_rd_dly_r;      
  reg                     cal2_prech_req_r;
  reg [4:0]               cal2_rd_active_dly_r;
  reg [2*DQS_WIDTH-1:0]   cal2_rd_bitslip_cnt_r;     
  reg [2:0]               cal2_state_r;
  reg [2:0]               cnt_eye_size_r;
  reg [5:0]               cnt_idel_dec_cpt_r;
  reg [4:0]               cnt_idel_inc_cpt_r;
  reg [4:0]               cnt_idel_skip_idel_r;
  reg [3:0]               cnt_pipe_wait_r;
  reg [2:0]               cnt_rden_wait_r;
  reg [3:0]               cnt_shift_r;
  reg [11:0]              detect_edge_cnt0_r;
  reg                     detect_edge_cnt1_en_r;
  reg [11:0]              detect_edge_cnt1_r;
  reg                     detect_edge_done_r;  
  reg                     detect_edge_start_r;
  wire                    dlyce_or;
  reg [5*DQS_WIDTH-1:0]   dlyval_dq_reg_r;
  reg [4:0]               first_edge_taps_r;
  reg                     found_edge_r;
  reg                     found_edge_latched_r;
  reg                     found_edge_valid_r;
  reg                     found_dq_edge_r;
  reg                     found_first_edge_r;
  reg                     found_jitter_latched_r;
  reg                     found_second_edge_r;
  reg                     found_stable_eye_r;
  reg                     found_two_edge_r;
  reg [4:0]               idel_tap_cnt_cpt_r;
  reg                     idel_tap_limit_cpt_r;
  reg                     idel_tap_limit_dq_r;
  reg                     last_tap_jitter_r;
  reg [DRAM_WIDTH-1:0]    mux_rd_fall0_r;
  reg [DRAM_WIDTH-1:0]    mux_rd_fall1_r;
  reg [DRAM_WIDTH-1:0]    mux_rd_rise0_r;
  reg [DRAM_WIDTH-1:0]    mux_rd_rise1_r;
  reg                     new_cnt_cpt_r;
  reg [RD_SHIFT_LEN-1:0]  old_sr_fall0_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  old_sr_fall1_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  old_sr_rise0_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  old_sr_rise1_r [DRAM_WIDTH-1:0];
  reg                     old_sr_valid_r;  
  reg                     pat_data_match_r;
  wire [RD_SHIFT_LEN-1:0] pat_fall0 [3:0];
  wire [RD_SHIFT_LEN-1:0] pat_fall1 [3:0];
  reg [DRAM_WIDTH-1:0]    pat_match_fall0_r;
  reg                     pat_match_fall0_and_r;
  reg [DRAM_WIDTH-1:0]    pat_match_fall1_r;
  reg                     pat_match_fall1_and_r;
  reg [DRAM_WIDTH-1:0]    pat_match_rise0_r;
  reg                     pat_match_rise0_and_r;
  reg [DRAM_WIDTH-1:0]    pat_match_rise1_r;
  reg                     pat_match_rise1_and_r;
  wire [RD_SHIFT_LEN-1:0] pat_rise0 [3:0];
  wire [RD_SHIFT_LEN-1:0] pat_rise1 [3:0];
  wire                    pipe_wait;
  reg                     prev_found_edge_r;
  reg                     prev_found_edge_valid_r;  
  reg                     prev_match_fall0_and_r;
  reg [DRAM_WIDTH-1:0]    prev_match_fall0_r;
  reg                     prev_match_fall1_and_r;
  reg [DRAM_WIDTH-1:0]    prev_match_fall1_r;
  reg                     prev_match_rise0_and_r;
  reg [DRAM_WIDTH-1:0]    prev_match_rise0_r;
  reg                     prev_match_rise1_and_r;
  reg [DRAM_WIDTH-1:0]    prev_match_rise1_r;
  reg                     prev_match_valid_r;
  reg                     prev_match_valid_r1;    
  reg [RD_SHIFT_LEN-1:0]  prev_sr_fall0_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  prev_sr_fall1_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  prev_sr_rise0_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  prev_sr_rise1_r [DRAM_WIDTH-1:0];
  reg [DQS_CNT_WIDTH-1:0] rd_mux_sel_r;
  reg                     rd_active_posedge_r;
  reg                     rd_active_r;
  reg                     rden_wait_r;
  reg [4:0]               right_edge_taps_r;
  reg [4:0]               second_edge_taps_r;
  reg [4:0]               second_edge_dq_taps_r;
  reg [RD_SHIFT_LEN-1:0]  sr_fall0_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  sr_fall1_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  sr_rise0_r [DRAM_WIDTH-1:0];
  reg [RD_SHIFT_LEN-1:0]  sr_rise1_r [DRAM_WIDTH-1:0];
  reg                     sr_match_fall0_and_r;
  reg [DRAM_WIDTH-1:0]    sr_match_fall0_r;
  reg                     sr_match_fall1_and_r;
  reg [DRAM_WIDTH-1:0]    sr_match_fall1_r;
  reg                     sr_match_valid_r;
  reg                     sr_match_valid_r1;
  reg                     sr_match_rise0_and_r;
  reg [DRAM_WIDTH-1:0]    sr_match_rise0_r;
  reg                     sr_match_rise1_and_r;
  reg [DRAM_WIDTH-1:0]    sr_match_rise1_r;
  reg                     store_sr_done_r;
  reg                     store_sr_r;
  reg                     store_sr_req_r;
  reg                     sr_valid_r;
  reg [5:0]               tby4_r;

  // Debug
  reg [4:0]               dbg_cpt_first_edge_taps [0:DQS_WIDTH-1];
  reg [4:0]               dbg_cpt_second_edge_taps [0:DQS_WIDTH-1];

  //***************************************************************************
  // Debug
  //***************************************************************************

  assign dbg_phy_rdlvl[1:0]    = rdlvl_start[1:0];
  assign dbg_phy_rdlvl[2]      = found_edge_r;
  assign dbg_phy_rdlvl[3]      = pat_data_match_r;
  assign dbg_phy_rdlvl[6:4]    = cal2_state_r[2:0];
  assign dbg_phy_rdlvl[8:7]    = cal2_cnt_bitslip_r[1:0];
  assign dbg_phy_rdlvl[13:9]   = cal1_state_r[4:0];
  assign dbg_phy_rdlvl[20:14]  = cnt_idel_dec_cpt_r;
  assign dbg_phy_rdlvl[21]     = found_first_edge_r;
  assign dbg_phy_rdlvl[22]     = found_second_edge_r;
  assign dbg_phy_rdlvl[23]     = old_sr_valid_r;
  assign dbg_phy_rdlvl[24]     = store_sr_r;
  assign dbg_phy_rdlvl[32:25]  = {sr_fall1_r[0][1:0], sr_rise1_r[0][1:0],
                                  sr_fall0_r[0][1:0], sr_rise0_r[0][1:0]};
  assign dbg_phy_rdlvl[40:33]  = {old_sr_fall1_r[0][1:0],
                                  old_sr_rise1_r[0][1:0],
                                  old_sr_fall0_r[0][1:0],
                                  old_sr_rise0_r[0][1:0]};
  assign dbg_phy_rdlvl[41]     = sr_valid_r;
  assign dbg_phy_rdlvl[42]     = found_stable_eye_r;
  assign dbg_phy_rdlvl[47:43]  = idel_tap_cnt_cpt_r;
  assign dbg_phy_rdlvl[48]     = idel_tap_limit_cpt_r;
  assign dbg_phy_rdlvl[53:49]  = first_edge_taps_r;
  assign dbg_phy_rdlvl[58:54]  = second_edge_taps_r;
  assign dbg_phy_rdlvl[64:59]  = tby4_r;
  assign dbg_phy_rdlvl[67:65]  = cnt_eye_size_r;
  assign dbg_phy_rdlvl[72:68]  = cal1_dq_tap_cnt_r;
  assign dbg_phy_rdlvl[73]     = found_dq_edge_r;
  assign dbg_phy_rdlvl[74]     = found_edge_valid_r;
  assign dbg_phy_rdlvl[78:75]  = cal1_cnt_cpt_r;
  assign dbg_phy_rdlvl[82:79]  = cal2_cnt_rden_r;
  assign dbg_phy_rdlvl[83]     = cal1_dlyce_cpt_r;
  assign dbg_phy_rdlvl[84]     = cal1_dlyinc_cpt_r;
  assign dbg_phy_rdlvl[85]     = found_edge_r;
  assign dbg_phy_rdlvl[86]     = found_first_edge_r;
  assign dbg_phy_rdlvl[91:87]   = right_edge_taps_r;
  assign dbg_phy_rdlvl[96:92]   = second_edge_dq_taps_r;
  assign dbg_phy_rdlvl[102:97]  = tby4_r;
  assign dbg_phy_rdlvl[255:103] = 'b0;
  
  //***************************************************************************
  // Debug output
  //***************************************************************************

  // Record first and second edges found during CPT calibration
  generate
    genvar ce_i;
    for (ce_i = 0; ce_i < DQS_WIDTH; ce_i = ce_i + 1) begin: gen_dbg_cpt_edge
      assign dbg_cpt_first_edge_cnt[(5*ce_i)+4:(5*ce_i)]
               = dbg_cpt_first_edge_taps[ce_i];
      assign dbg_cpt_second_edge_cnt[(5*ce_i)+4:(5*ce_i)]
               = dbg_cpt_second_edge_taps[ce_i];
      always @(posedge clk)
        if (rst) begin
          dbg_cpt_first_edge_taps[ce_i]  <= #TCQ 'b0;
          dbg_cpt_second_edge_taps[ce_i] <= #TCQ 'b0;
        end else begin
          // Record tap counts of first and second edge edges during
          // CPT calibration for each DQS group. If neither edge has
          // been found, then those taps will remain 0
          if ((cal1_state_r == CAL1_CALC_IDEL) ||
              (cal1_state_r == CAL1_RST_CPT)) begin
            if (found_first_edge_r && (cal1_cnt_cpt_r == ce_i))
              dbg_cpt_first_edge_taps[ce_i]  
                <= #TCQ first_edge_taps_r;
            if (found_second_edge_r && (cal1_cnt_cpt_r == ce_i))
              dbg_cpt_second_edge_taps[ce_i] 
                <= #TCQ second_edge_taps_r;
          end
        end
    end
  endgenerate

 always @(posedge clk) begin 
    dbg_rd_active_dly <= #TCQ cal2_rd_active_dly_r;
    dbg_rd_clkdly_cnt <= #TCQ cal2_clkdly_cnt_r;
  end
    
  // cal2_rd_bitslip_cnt_r is only 2*DQS_WIDTH (2 bits per DQS group), but
  // is expanded to 3 bits per DQS group to maintain width compatibility with
  // previous definition of dbg_rd_bitslip_cnt (not a huge issue, should
  // align these eventually - minimize impact on debug designs)
  generate
    genvar d_i;
    for (d_i = 0; d_i < DQS_WIDTH; d_i = d_i + 1) begin: gen_dbg_rd_bitslip
      always @(posedge clk) begin 
        dbg_rd_bitslip_cnt[3*d_i+:2] <= #TCQ cal2_rd_bitslip_cnt_r[2*d_i+:2];
        dbg_rd_bitslip_cnt[3*d_i+2]  <= #TCQ 1'b0;
      end
    end
  endgenerate

  //***************************************************************************
  // Data mux to route appropriate bit to calibration logic - i.e. calibration
  // is done sequentially, one bit (or DQS group) at a time
  //***************************************************************************

  always @(posedge clk) begin
    (* full_case, parallel_case *) case (rdlvl_done[0])
      1'b0: rd_mux_sel_r <= #TCQ cal1_cnt_cpt_r;
      1'b1: rd_mux_sel_r <= #TCQ cal2_cnt_rden_r;
    endcase
  end

  // Register outputs for improved timing.
  // NOTE: Will need to change when per-bit DQ deskew is supported.
  //       Currenly all bits in DQS group are checked in aggregate
  generate
    genvar mux_i;
    for (mux_i = 0; mux_i < DRAM_WIDTH; mux_i = mux_i + 1) begin: gen_mux_rd
      always @(posedge clk) begin
        mux_rd_rise0_r[mux_i] <= #TCQ rd_data_rise0[DRAM_WIDTH*rd_mux_sel_r + 
                                                    mux_i];
        mux_rd_fall0_r[mux_i] <= #TCQ rd_data_fall0[DRAM_WIDTH*rd_mux_sel_r + 
                                                    mux_i];
        mux_rd_rise1_r[mux_i] <= #TCQ rd_data_rise1[DRAM_WIDTH*rd_mux_sel_r + 
                                                    mux_i];
        mux_rd_fall1_r[mux_i] <= #TCQ rd_data_fall1[DRAM_WIDTH*rd_mux_sel_r + 
                                                    mux_i];      
      end
    end
  endgenerate

  //***************************************************************************
  // Demultiplexor to control IODELAY tap values
  //***************************************************************************

  // Capture clock
  always @(posedge clk) begin
    dlyce_cpt  <= #TCQ 'b0;
    dlyinc_cpt <= #TCQ 'b0;
 
    if (cal1_dlyce_cpt_r) begin
      if ((SIM_CAL_OPTION == "NONE") ||
          (SIM_CAL_OPTION == "FAST_WIN_DETECT")) begin 
        // Change only specified DQS group's capture clock
        dlyce_cpt[rd_mux_sel_r] <= #TCQ 1'b1;  
        dlyinc_cpt              <= #TCQ cal1_dlyinc_cpt_r;
      end else if ((SIM_CAL_OPTION == "FAST_CAL") ||
                   (SIM_CAL_OPTION == "SKIP_CAL")) begin 
        // if simulating, and "shortcuts" for calibration enabled, apply 
        // results to all other elements (i.e. assume delay on all 
        // bits/bytes is same). Also do the same if skipping calibration 
        // (the logic will still increment IODELAY to the "hardcoded" value)
        dlyce_cpt  <= #TCQ {DQS_WIDTH{1'b1}};
        dlyinc_cpt <= #TCQ cal1_dlyinc_cpt_r;
      end
    end else if (DEBUG_PORT == "ON") begin
      // simultaneously inc/dec all CPT idelays
      if (dbg_idel_up_all || dbg_idel_down_all || dbg_sel_all_idel_cpt) begin
        dlyce_cpt  <= #TCQ {DQS_WIDTH{dbg_idel_up_all | dbg_idel_down_all |
                                       dbg_idel_up_cpt | dbg_idel_down_cpt}};
        dlyinc_cpt <= #TCQ dbg_idel_up_all | dbg_idel_up_cpt; 
      end else begin 
        // select specific cpt clock for adjustment
        dlyce_cpt[dbg_sel_idel_cpt] <= #TCQ dbg_idel_up_cpt |
                                       dbg_idel_down_cpt;
        dlyinc_cpt                  <= #TCQ dbg_idel_up_cpt;
      end       
    end
  end

  // Resync clock
  always @(posedge clk) begin
    dlyce_rsync  <= #TCQ 'b0;
    dlyinc_rsync <= #TCQ 'b0;
    if (DEBUG_PORT == "ON") begin
      // simultaneously inc/dec all RSYNC idelays
      if (dbg_idel_up_all || dbg_idel_down_all || dbg_sel_all_idel_rsync) begin
        dlyce_rsync  <= #TCQ {4{dbg_idel_up_all | 
                                dbg_idel_down_all |
                                dbg_idel_up_rsync | 
                                dbg_idel_down_rsync}};
        dlyinc_rsync <= #TCQ dbg_idel_up_all | dbg_idel_up_rsync;
      end else begin
        // select specific rsync clock for adjustment
        dlyce_rsync[dbg_sel_idel_rsync] <= #TCQ dbg_idel_up_rsync |
                                           dbg_idel_down_rsync;
        dlyinc_rsync                    <= #TCQ dbg_idel_up_rsync;
      end 
    end
  end

  // DQ parallel load tap values
  // Currently no debug port option to change DQ taps
  // NOTE: This values are not initially assigned after reset - until
  //  a particular byte is being calibrated, the IDELAY dlyval values from 
  //  this module will be X's in simulation - this will be okay - those 
  //  IDELAYs won't be used until the byte is calibrated
  always @(posedge clk) begin
    // If read leveling is not complete, calibration logic has complete
    // control of loading of DQ IDELAY taps
    if ((SIM_CAL_OPTION == "NONE") ||
        (SIM_CAL_OPTION == "FAST_WIN_DETECT")) begin
      // Load all IDELAY value for all bits in that byte with the same
      // value. Eventually this will be changed to accomodate different
      // tap counts across the bits in a DQS group (i.e. "per-bit" cal)
      dlyval_dq_reg_r[5*cal1_cnt_cpt_r+:5] <= #TCQ {cal1_dq_tap_cnt_r};
    end else if (SIM_CAL_OPTION == "FAST_CAL") begin
      // For simulation purposes, to reduce time associated with
      // calibration, calibrate only one DQS group, and load all IODELAY 
      // values for all DQS groups with same value        
      dlyval_dq_reg_r <= #TCQ {DQS_WIDTH{cal1_dq_tap_cnt_r}};
    end else if (SIM_CAL_OPTION == "SKIP_CAL") begin
      // If skipping calibration altogether (only for simulation), set
      // all the DQ IDELAY delay values to 0
      dlyval_dq_reg_r <= #TCQ 'b0;
    end
  end

  // Register for timing (help with logic placement) - we're gonna need 
  // all the help we can get
  // dlyval_dqs is assigned the value of dq taps. It is used in the PD module.
  // Changes will be made to this assignment when perbit deskew is done.
  always @(posedge clk) begin
    dlyval_dq  <= #TCQ dlyval_dq_reg_r;
    dlyval_dqs <= #TCQ dlyval_dq_reg_r;
  end
   
  //***************************************************************************
  // Generate signal used to delay calibration state machine - used when:
  //  (1) IDELAY value changed
  //  (2) RD_MUX_SEL value changed
  // Use when a delay is necessary to give the change time to propagate
  // through the data pipeline (through IDELAY and ISERDES, and fabric
  // pipeline stages)
  //***************************************************************************

  // combine requests to modify any of the IDELAYs into one
  assign dlyce_or = cal1_dlyce_cpt_r |
                    new_cnt_cpt_r |
                    (cal1_state_r == CAL1_IDEL_INC_DQ);
  
  // RESTORE, RC, 060409
//  assign dlyce_or = cal1_dlyce_cpt_r |
//                    cal1_dlyce_rsync_r |
//                    new_cnt_cpt_r |
//                    (cal1_state_r == CAL1_INC_DQ) ;

  // NOTE: Can later recode to avoid combinational path, but be careful about
  //   timing effect on main state logic
  assign pipe_wait = dlyce_or || (cnt_pipe_wait_r != PIPE_WAIT_CNT-1);

  always @(posedge clk)
    if (rst)
      cnt_pipe_wait_r <= #TCQ 4'b0000;
    else if (dlyce_or)
      cnt_pipe_wait_r <= #TCQ 4'b0000;
    else if (cnt_pipe_wait_r != PIPE_WAIT_CNT-1)
      cnt_pipe_wait_r <= #TCQ cnt_pipe_wait_r + 1;

  //***************************************************************************
  // generate request to PHY_INIT logic to issue precharged. Required when
  // calibration can take a long time (during which there are only constant
  // reads present on this bus). In this case need to issue perioidic
  // precharges to avoid tRAS violation. This signal must meet the following
  // requirements: (1) only transition from 0->1 when prech is first needed,
  // (2) stay at 1 and only transition 1->0 when RDLVL_PRECH_DONE asserted
  //***************************************************************************

  always @(posedge clk)
    if (rst)
      rdlvl_prech_req <= #TCQ 1'b0;
    else
      // Combine requests from all stages here
      rdlvl_prech_req <= #TCQ cal1_prech_req_r | cal2_prech_req_r;

  //***************************************************************************
  // Shift register to store last RDDATA_SHIFT_LEN cycles of data from ISERDES
  // NOTE: Written using discrete flops, but SRL can be used if the matching
  //   logic does the comparison sequentially, rather than parallel
  //***************************************************************************

  generate
    genvar rd_i;
    for (rd_i = 0; rd_i < DRAM_WIDTH; rd_i = rd_i + 1) begin: gen_sr
      always @(posedge clk) begin
        sr_rise0_r[rd_i] <= #TCQ {sr_rise0_r[rd_i][RD_SHIFT_LEN-2:0],
                                   mux_rd_rise0_r[rd_i]};
        sr_fall0_r[rd_i] <= #TCQ {sr_fall0_r[rd_i][RD_SHIFT_LEN-2:0],
                                   mux_rd_fall0_r[rd_i]};
        sr_rise1_r[rd_i] <= #TCQ {sr_rise1_r[rd_i][RD_SHIFT_LEN-2:0],
                                   mux_rd_rise1_r[rd_i]};
        sr_fall1_r[rd_i] <= #TCQ {sr_fall1_r[rd_i][RD_SHIFT_LEN-2:0],
                                   mux_rd_fall1_r[rd_i]};
      end
    end
  endgenerate

  //***************************************************************************
  // First stage calibration: Capture clock
  //***************************************************************************

  //*****************************************************************
  // Free-running counter to keep track of when to do parallel load of
  // data from memory
  //*****************************************************************

  always @(posedge clk)
    if (rst) begin
      cnt_shift_r <= #TCQ 'b0;
      sr_valid_r  <= #TCQ 1'b0;
    end else begin
      if (cnt_shift_r == RD_SHIFT_LEN-1) begin
        sr_valid_r <= #TCQ 1'b1;
        cnt_shift_r <= #TCQ 'b0;
      end else begin
        sr_valid_r <= #TCQ 1'b0;
        cnt_shift_r <= #TCQ cnt_shift_r + 1;
      end
    end

  //*****************************************************************
  // Logic to determine when either edge of the data eye encountered
  // Pre- and post-IDELAY update data pattern is compared, if they
  // differ, than an edge has been encountered. Currently no attempt
  // made to determine if the data pattern itself is "correct", only
  // whether it changes after incrementing the IDELAY (possible
  // future enhancement)
  //*****************************************************************

  // Simple handshaking - when CAL1 state machine wants the OLD SR
  // value to get loaded, it requests for it to be loaded. One the
  // next sr_valid_r pulse, it does get loaded, and store_sr_done_r
  // is then pulsed asserted to indicate this, and we all go on our
  // merry way
  always @(posedge clk)
    if (rst) begin
      store_sr_done_r <= #TCQ 1'b0;
      store_sr_r      <= #TCQ 1'b0;
    end else begin
      store_sr_done_r <= sr_valid_r & store_sr_r;
      if (store_sr_req_r)
        store_sr_r <= #TCQ 1'b1;
      else if (sr_valid_r && store_sr_r)
        store_sr_r <= #TCQ 1'b0;
    end

  // Determine if the comparison logic is putting out a valid
  // output - as soon as a request is made to load in a new value
  // for the OLD_SR shift register, the valid pipe is cleared. It
  // then gets asserted once the new value gets loaded into the
  // OLD_SR register
  always @(posedge clk)
    if (rst) begin
      sr_match_valid_r    <= #TCQ 1'b0;
      sr_match_valid_r1   <= #TCQ 1'b0;
      old_sr_valid_r      <= #TCQ 1'b0;
     end else begin
      // Flag to indicate whether data in OLD_SR register is valid
      if (store_sr_req_r)
        old_sr_valid_r <= #TCQ 1'b0;         
      else if (store_sr_done_r)
        old_sr_valid_r <= #TCQ 1'b1;
      // Immediately flush valid pipe to prevent any logic from
      // acting on compare results using previous OLD_SR data
      if (store_sr_req_r) begin
        sr_match_valid_r  <= #TCQ 1'b0; 
        sr_match_valid_r1 <= #TCQ 1'b0;
      end else begin
        sr_match_valid_r  <= #TCQ old_sr_valid_r & sr_valid_r; 
        sr_match_valid_r1 <= #TCQ sr_match_valid_r;
      end       
    end

  // Create valid qualifier for previous sample compare - might not
  // be needed - check previous sample compare timing
  always @(posedge clk)
    if (rst) begin
      prev_match_valid_r  <= #TCQ 1'b0;
      prev_match_valid_r1 <= #TCQ 1'b0;
    end else begin
      prev_match_valid_r  <= #TCQ sr_valid_r;
      prev_match_valid_r1 <= #TCQ prev_match_valid_r;      
    end
 
  // Transfer current data to old data, prior to incrementing IDELAY
  generate
    for (z = 0; z < DRAM_WIDTH; z = z + 1) begin: gen_old_sr
      always @(posedge clk) begin
        if (sr_valid_r) begin
          // Load last sample (i.e. from current sampling interval)
          prev_sr_rise0_r[z] <= #TCQ sr_rise0_r[z];
          prev_sr_fall0_r[z] <= #TCQ sr_fall0_r[z];
          prev_sr_rise1_r[z] <= #TCQ sr_rise1_r[z];
          prev_sr_fall1_r[z] <= #TCQ sr_fall1_r[z];         
        end
        if (sr_valid_r && store_sr_r) begin
          old_sr_rise0_r[z] <= #TCQ sr_rise0_r[z];
          old_sr_fall0_r[z] <= #TCQ sr_fall0_r[z];
          old_sr_rise1_r[z] <= #TCQ sr_rise1_r[z];
          old_sr_fall1_r[z] <= #TCQ sr_fall1_r[z];
        end
      end
    end
  endgenerate

  //*******************************************************
  // Match determination occurs over 3 cycles - pipelined for better timing
  //*******************************************************

  // CYCLE1: Compare all bits in DQS grp, generate separate term for each
  //  bit for each cycle of training seq. For example, if training seq = 4
  //  words, and there are 8-bits per DQS group, then there is total of
  //  8*4 = 32 terms generated in this cycle
  generate
    genvar sh_i;
    for (sh_i = 0; sh_i < DRAM_WIDTH; sh_i = sh_i + 1) begin: gen_sr_match
      always @(posedge clk) begin
        if (sr_valid_r) begin
          // Structure HDL such that X on data bus will result in a mismatch
          // This is required for memory models that can drive the bus with
          // X's to model uncertainty regions (e.g. Denali)

          // Check current sample vs. sample from last IODELAY tap        
          if (sr_rise0_r[sh_i] == old_sr_rise0_r[sh_i])
            sr_match_rise0_r[sh_i] <= #TCQ 1'b1;
          else
            sr_match_rise0_r[sh_i] <= #TCQ 1'b0;

          if (sr_fall0_r[sh_i] == old_sr_fall0_r[sh_i])
            sr_match_fall0_r[sh_i] <= #TCQ 1'b1;
          else
            sr_match_fall0_r[sh_i] <= #TCQ 1'b0;

          if (sr_rise1_r[sh_i] == old_sr_rise1_r[sh_i])
            sr_match_rise1_r[sh_i] <= #TCQ 1'b1;
          else
            sr_match_rise1_r[sh_i] <= #TCQ 1'b0;

          if (sr_fall1_r[sh_i] == old_sr_fall1_r[sh_i])
            sr_match_fall1_r[sh_i] <= #TCQ 1'b1;
          else
            sr_match_fall1_r[sh_i] <= #TCQ 1'b0;

          // Check current sample vs. sample from current IODELAY tap
          if (sr_rise0_r[sh_i] == prev_sr_rise0_r[sh_i])
            prev_match_rise0_r[sh_i] <= #TCQ 1'b1;
          else
            prev_match_rise0_r[sh_i] <= #TCQ 1'b0;

          if (sr_fall0_r[sh_i] == prev_sr_fall0_r[sh_i])
            prev_match_fall0_r[sh_i] <= #TCQ 1'b1;
          else
            prev_match_fall0_r[sh_i] <= #TCQ 1'b0;

          if (sr_rise1_r[sh_i] == prev_sr_rise1_r[sh_i])
            prev_match_rise1_r[sh_i] <= #TCQ 1'b1;
          else
            prev_match_rise1_r[sh_i] <= #TCQ 1'b0;

          if (sr_fall1_r[sh_i] == prev_sr_fall1_r[sh_i])
            prev_match_fall1_r[sh_i] <= #TCQ 1'b1;
          else
            prev_match_fall1_r[sh_i] <= #TCQ 1'b0;
          
        end
      end
    end
  endgenerate

  // CYCLE 2: Logical AND match terms from all bits in DQS group together
  always @(posedge clk) begin
    // Check current sample vs. sample from last IODELAY tap
    sr_match_rise0_and_r <= #TCQ &sr_match_rise0_r;
    sr_match_fall0_and_r <= #TCQ &sr_match_fall0_r;
    sr_match_rise1_and_r <= #TCQ &sr_match_rise1_r;
    sr_match_fall1_and_r <= #TCQ &sr_match_fall1_r;
    // Check current sample vs. sample from current IODELAY tap
    prev_match_rise0_and_r <= #TCQ &prev_match_rise0_r;
    prev_match_fall0_and_r <= #TCQ &prev_match_fall0_r;
    prev_match_rise1_and_r <= #TCQ &prev_match_rise1_r;
    prev_match_fall1_and_r <= #TCQ &prev_match_fall1_r;        
  end

  // CYCLE 3: During the third cycle of compare, the comparison output
  //  over all the cycles of the training sequence is output  
  always @(posedge clk) begin
    // Found edge only asserted if OLD_SR shift register contents are valid
    // and a match has not occurred - since we're using this shift register
    // scheme, we need to qualify the match with the valid signals because 
    // the "old" and "current" shift register contents can't be compared on 
    // every clock cycle, only when the shift register is "fully loaded"
    found_edge_r 
      <= #TCQ ((!sr_match_rise0_and_r || !sr_match_fall0_and_r ||
                !sr_match_rise1_and_r || !sr_match_fall1_and_r) &&
               sr_match_valid_r1);
    found_edge_valid_r <= #TCQ sr_match_valid_r1;

    prev_found_edge_r
      <= #TCQ ((!prev_match_rise0_and_r || !prev_match_fall0_and_r ||
                !prev_match_rise1_and_r || !prev_match_fall1_and_r) &&
               prev_match_valid_r1);      
    prev_found_edge_valid_r <= #TCQ prev_match_valid_r1;    
  end

  //*******************************************************
  // Counters for tracking # of samples compared
  // For each comparision point (i.e. to determine if an edge has
  // occurred after each IODELAY increment when read leveling),
  // multiple samples are compared in order to average out the effects
  // of jitter. If any one of these samples is different than the "old"
  // sample corresponding to the previous IODELAY value, then an edge
  // is declared to be detected. 
  //*******************************************************
  
  // Two counters are used to keep track of # of samples compared, in 
  // order to make it easier to meeting timing on these paths

  // First counter counts the number of samples directly 
  always @(posedge clk)
    if (rst)
      detect_edge_cnt0_r <= #TCQ 'b0;
    else begin 
      if (detect_edge_start_r)
        detect_edge_cnt0_r <= #TCQ 'b0;
      else if (found_edge_valid_r)
        detect_edge_cnt0_r <= #TCQ detect_edge_cnt0_r + 1;
    end

  always @(posedge clk)
    if (rst)
      detect_edge_cnt1_en_r <= #TCQ 1'b0;
    else begin 
      if (((SIM_CAL_OPTION == "FAST_CAL") ||
           (SIM_CAL_OPTION == "FAST_WIN_DETECT")) && 
           (detect_edge_cnt0_r == 12'h001)) 
        // Bypass multi-sampling for stage 1 when simulating with
        // either fast calibration option, or with multi-sampling
        // disabled
        detect_edge_cnt1_en_r <= #TCQ 1'b1;
      else if (detect_edge_cnt0_r == DETECT_EDGE_SAMPLE_CNT0)
        detect_edge_cnt1_en_r <= #TCQ 1'b1;
      else
        detect_edge_cnt1_en_r <= #TCQ 1'b0;
    end
  
  // Counter #2
  always @(posedge clk)
    if (rst)
      detect_edge_cnt1_r <= #TCQ 'b0;
    else begin 
      if (detect_edge_start_r)
        detect_edge_cnt1_r <= #TCQ 'b0;
      else if (detect_edge_cnt1_en_r)
        detect_edge_cnt1_r <= #TCQ detect_edge_cnt1_r + 1;
    end
      
  always @(posedge clk)
    if (rst)
      detect_edge_done_r <= #TCQ 1'b0;
    else begin 
      if (detect_edge_start_r)
        detect_edge_done_r <= #TCQ 'b0;
      else if (((SIM_CAL_OPTION == "FAST_CAL") ||
                (SIM_CAL_OPTION == "FAST_WIN_DETECT")) &&
               (detect_edge_cnt1_r == 12'h001)) 
        // Bypass multi-sampling for stage 1 when simulating with
        // either fast calibration option, or with multi-sampling
        // disabled
        detect_edge_done_r <= #TCQ 1'b1;      
      else if (detect_edge_cnt1_r == DETECT_EDGE_SAMPLE_CNT1) 
        detect_edge_done_r <= #TCQ 1'b1;
    end
  
  //*****************************************************************
  // Keep track of how long we've been in the same data eye
  // (i.e. over how many taps we have not yet found an eye)
  //*****************************************************************

  // An actual edge occurs when either: (1) difference in read data between
  // current IODELAY tap and previous IODELAY tap (yes, this is confusing,
  // since this condition is represented by found_edge_latched_r), (2) if
  // the previous IODELAY tap read data was jittering (in which case it
  // doesn't matter what the current IODELAY tap sample looks like)
  assign cal1_found_edge = found_edge_latched_r | last_tap_jitter_r;
  
  always @(posedge clk) 
    // Reset to 0 every time we begin processing a new DQS group
    if ((cal1_state_r == CAL1_IDLE) || (cal1_state_r == CAL1_NEXT_DQS)) begin
      cnt_eye_size_r         <= #TCQ 3'b000;
      found_stable_eye_r     <= #TCQ 1'b0;
      last_tap_jitter_r      <= #TCQ 1'b0;
      found_edge_latched_r   <= #TCQ 1'b0;
      found_jitter_latched_r <= #TCQ 1'b0;
    end else if (cal1_state_r != CAL1_DETECT_EDGE) begin
      // Reset "latched" signals before looking for an edge
      found_edge_latched_r   <= #TCQ 1'b0;
      found_jitter_latched_r <= #TCQ 1'b0;
    end else if (cal1_state_r == CAL1_DETECT_EDGE) begin
      if (!detect_edge_done_r) begin
        // While sampling: 
        // Latch if we've found an edge (i.e. difference between current
        // and previous IODELAY tap), and/or jitter (difference between
        // current and previous sample - on the same IODELAY tap). It is
        // possible to find an edge, and not jitter, but not vice versa
        if (found_edge_r)
          found_edge_latched_r <= #TCQ 1'b1;
        if (prev_found_edge_r)
          found_jitter_latched_r <= #TCQ 1'b1;
      end else begin
        // Once the sample interval is over, it's time for housekeeping:

        // If jitter found during current tap, record for future compares
        last_tap_jitter_r <= #TCQ found_jitter_latched_r;

        // If we found an edge, or if the previous IODELAY tap had jitter
        // then reset stable window counter to 0 - obviously we're not in
        // the data valid window. Note that we care about whether jitter
        // occurred during the previous tap because it's possible to not
        // find an edge (in terms of how it's determined in found_edge_r)
        // even though jitter occured during the previous tap. 
        if (cal1_found_edge) begin 
          cnt_eye_size_r     <= #TCQ 3'b000;
          found_stable_eye_r <= #TCQ 1'b0;          
        end else begin 
          // Otherwise, everytime we look for an edge, and don't find
          // one, increment counter until minimum eye size encountered - 
          // note this counter does not track the eye size, but only if 
          // it exceeded minimum size
          if (cnt_eye_size_r == MIN_EYE_SIZE-1)
            found_stable_eye_r <= #TCQ 1'b1;
          else begin
            found_stable_eye_r <= #TCQ 1'b0;
            cnt_eye_size_r <= #TCQ cnt_eye_size_r + 1;
          end          
        end
      end
    end
      
  //*****************************************************************
  // keep track of edge tap counts found, and current capture clock
  // tap count
  //*****************************************************************

  always @(posedge clk)
    if (rst) begin
      idel_tap_cnt_cpt_r   <= #TCQ 'b0;
      idel_tap_limit_cpt_r <= #TCQ 1'b0;
    end else begin
      if (new_cnt_cpt_r) begin
        idel_tap_cnt_cpt_r   <= #TCQ 5'b00000;
        idel_tap_limit_cpt_r <= #TCQ 1'b0;
      end else if (cal1_dlyce_cpt_r) begin
        if (cal1_dlyinc_cpt_r)
          idel_tap_cnt_cpt_r <= #TCQ idel_tap_cnt_cpt_r + 1;
        else
          idel_tap_cnt_cpt_r <= #TCQ idel_tap_cnt_cpt_r - 1;
        // Assert if tap limit has been reached
        if ((idel_tap_cnt_cpt_r == IODELAY_TAP_LEN-2) && cal1_dlyinc_cpt_r)
          idel_tap_limit_cpt_r <= #TCQ 1'b1;
        else
          idel_tap_limit_cpt_r <= #TCQ 1'b0;
      end
    end

  //*****************************************************************
  // keep track of when DQ tap limit is reached 
  //*****************************************************************

  always @(posedge clk)
    if (rst)
      idel_tap_limit_dq_r   <= #TCQ 'b0;
    else begin
      if (new_cnt_cpt_r)
        idel_tap_limit_dq_r <= #TCQ 1'b0;
      else if (cal1_dq_tap_cnt_r == IODELAY_TAP_LEN-1)
        idel_tap_limit_dq_r <= #TCQ 1'b1;
    end
  
  //*****************************************************************
  
  always @(posedge clk)
    if (rst) begin
      cal1_cnt_cpt_r        <= #TCQ 'b0;
      cal1_dlyce_cpt_r      <= #TCQ 1'b0;
      cal1_dlyinc_cpt_r     <= #TCQ 1'b0;
      cal1_dq_tap_cnt_r     <= #TCQ 5'b00000;
      cal1_dq_taps_inc_r    <= #TCQ 1'b0;
      cal1_prech_req_r      <= #TCQ 1'b0;
      cal1_state_r          <= #TCQ CAL1_IDLE;
      cnt_idel_dec_cpt_r    <= #TCQ 6'bxxxxxx;
      cnt_idel_inc_cpt_r    <= #TCQ 5'bxxxxx;
      cnt_idel_skip_idel_r  <= #TCQ 5'bxxxxx;
      detect_edge_start_r   <= #TCQ 1'b0;
      found_dq_edge_r       <= #TCQ 1'b0;
      found_two_edge_r      <= #TCQ 1'b0;
      found_first_edge_r    <= #TCQ 1'b0;
      found_second_edge_r   <= #TCQ 1'b0;
      first_edge_taps_r     <= #TCQ 5'bxxxxx;
      new_cnt_cpt_r         <= #TCQ 1'b0;
      rdlvl_done[0]         <= #TCQ 1'b0;
      rdlvl_err[0]          <= #TCQ 1'b0;
      right_edge_taps_r     <= #TCQ 5'bxxxxx;
      second_edge_taps_r    <= #TCQ 5'bxxxxx;
      second_edge_dq_taps_r <= #TCQ 5'bxxxxx; 
      store_sr_req_r        <= #TCQ 1'b0; 
    end else begin
      // default (inactive) states for all "pulse" outputs
      cal1_prech_req_r    <= #TCQ 1'b0;
      cal1_dlyce_cpt_r    <= #TCQ 1'b0;
      cal1_dlyinc_cpt_r   <= #TCQ 1'b0;
      detect_edge_start_r <= #TCQ 1'b0;
      new_cnt_cpt_r       <= #TCQ 1'b0;
      store_sr_req_r      <= #TCQ 1'b0;
      
      case (cal1_state_r)
        
        CAL1_IDLE:
          if (rdlvl_start[0]) begin
            if (SIM_CAL_OPTION == "SKIP_CAL") begin
              // "Hardcoded" calibration option
              cnt_idel_skip_idel_r <= #TCQ TBY4_TAPS;
              cal1_state_r  <= #TCQ CAL1_SKIP_RDLVL_INC_IDEL;
            end else begin
              new_cnt_cpt_r <= #TCQ 1'b1;             
              cal1_state_r  <= #TCQ CAL1_NEW_DQS_WAIT;
            end
          end

        // Wait for various MUXes associated with a new DQS group to
        // change - also gives time for the read data shift register
        // to load with the updated data for the new DQS group
        CAL1_NEW_DQS_WAIT:
          if (!pipe_wait)
            cal1_state_r <= #TCQ CAL1_IDEL_STORE_FIRST;

        // When first starting calibration for a DQS group, save the
        // current value of the read data shift register, and use this
        // as a reference. Note that for the first iteration of the
        // edge detection loop, we will in effect be checking for an edge
        // at IODELAY taps = 0 - normally, we are comparing the read data
        // for IODELAY taps = N, with the read data for IODELAY taps = N-1
        // An edge can only be found at IODELAY taps = 0 if the read data
        // is changing during this time (possible due to jitter)
        CAL1_IDEL_STORE_FIRST: begin 
          store_sr_req_r <= #TCQ 1'b1;
          detect_edge_start_r <= #TCQ 1'b1;
          if (store_sr_done_r)begin
            if(cal1_dq_taps_inc_r) // if using dq taps 
              cal1_state_r <= #TCQ CAL1_DETECT_EDGE_DQ;
            else 
              cal1_state_r <= #TCQ CAL1_DETECT_EDGE;
          end
        end
        
        // Check for presence of data eye edge
        CAL1_DETECT_EDGE: begin
          if (detect_edge_done_r) begin
            if (cal1_found_edge) begin 
              // Sticky bit - asserted after we encounter an edge, although
              // the current edge may not be considered the "first edge" this
              // just means we found at least one edge
              found_first_edge_r <= #TCQ 1'b1;

              // For use during "low-frequency" edge detection: 
              // Prevent underflow if we find an edge right away - at any
              // rate, if we do, and later we don't find a second edge by
              // using DQ taps, then we're running at a very low
              // frequency, and we really don't care about whether the
              // first edge found is a "left" or "right" edge - we have
              // more margin to absorb any inaccuracy
              if (!found_first_edge_r) begin
                if (idel_tap_cnt_cpt_r == 5'b00000)
                  right_edge_taps_r <= #TCQ 5'b00000;        
                else
                  right_edge_taps_r <= #TCQ idel_tap_cnt_cpt_r - 1;
              end
               
              // Both edges of data valid window found:
              // If we've found a second edge after a region of stability
              // then we must have just passed the second ("right" edge of
              // the window. Record this second_edge_taps = current tap-1, 
              // because we're one past the actual second edge tap, where 
              // the edge taps represent the extremes of the data valid 
              // window (i.e. smallest & largest taps where data still valid
              if (found_first_edge_r && found_stable_eye_r) begin
                found_second_edge_r <= #TCQ 1'b1;
                second_edge_taps_r <= #TCQ idel_tap_cnt_cpt_r - 1;
                cal1_state_r <= #TCQ CAL1_CALC_IDEL;          
              end else begin
                // Otherwise, an edge was found (just not the "second" edge)
                // then record current tap count - this may be the "left"
                // edge of the current data valid window
                first_edge_taps_r <= #TCQ idel_tap_cnt_cpt_r;           
                // If we haven't run out of taps, then keep incrementing
                if (!idel_tap_limit_cpt_r)
                  cal1_state_r <= #TCQ CAL1_IDEL_STORE_OLD;
                else begin  
                  // If we ran out of taps moving the capture clock, and we
                  // haven't found second edge, then try to find edges by
                  // moving the DQ IODELAY taps
                  cal1_state_r <= #TCQ CAL1_RST_CPT;
                  // Using this counter to reset the CPT taps to zero
                  // taps + any PD taps
                  cnt_idel_dec_cpt_r <= #TCQ IODELAY_TAP_LEN - 1;
                end
              end
            end else begin 
              // Otherwise, if we haven't found an edge.... 
              if (!idel_tap_limit_cpt_r)
                // If we still have taps left to use, then keep incrementing
                cal1_state_r <= #TCQ CAL1_IDEL_STORE_OLD;
              else begin
                // If we ran out of taps moving the capture clock, and we
                // haven't found even one or second edge, then try to find
                // edges by moving the DQ IODELAY taps
                cal1_state_r <= #TCQ CAL1_RST_CPT;
                // Using this counter to reset the CPT taps to zero
                // taps + any PD taps
                cnt_idel_dec_cpt_r <= #TCQ IODELAY_TAP_LEN - 1;
              end
            end
          end
        end
          
        // Store the current read data into the read data shift register
        // before incrementing the tap count and doing this again 
        CAL1_IDEL_STORE_OLD: begin
          store_sr_req_r <= #TCQ 1'b1;
          if (store_sr_done_r)begin
            if(cal1_dq_taps_inc_r) // if using dq taps
              cal1_state_r <= #TCQ CAL1_IDEL_INC_DQ;
            else
              cal1_state_r <= #TCQ CAL1_IDEL_INC_CPT;
          end
        end
        
        // Increment IDELAY for both capture and resync clocks
        CAL1_IDEL_INC_CPT: begin
          cal1_dlyce_cpt_r    <= #TCQ 1'b1;
          cal1_dlyinc_cpt_r   <= #TCQ 1'b1;
          cal1_state_r        <= #TCQ CAL1_IDEL_INC_CPT_WAIT;
        end

        // Wait for IDELAY for both capture and resync clocks, and internal
        // nodes within ISERDES to settle, before checking again for an edge 
        CAL1_IDEL_INC_CPT_WAIT: begin 
          detect_edge_start_r <= #TCQ 1'b1;
          if (!pipe_wait)
            cal1_state_r <= #TCQ CAL1_DETECT_EDGE;
        end
            
        // Calculate final value of IDELAY. At this point, one or both
        // edges of data eye have been found, and/or all taps have been
        // exhausted looking for the edges
        // NOTE: We're calculating the amount to decrement by, not the
        //  absolute setting for DQ IDELAY
        CAL1_CALC_IDEL: begin
          //*******************************************************
          // Now take care of IDELAY for capture clock:
          // Explanation of calculations:
          //  1. If 2 edges found, final IDELAY value =
          //       TAPS = FE_TAPS + ((SE_TAPS-FE_TAPS)/2)
          //  2. If 1 edge found, final IDELAY value is either:
          //       TAPS = FE_TAPS - TBY4_TAPS, or
          //       TAPS = FE_TAPS + TBY4_TAPS
          //     Depending on which is achievable without overflow
          //     (and with bias toward having fewer taps)
          //  3. If no edges found, then final IDELAY value is:
          //       TAPS = 15
          //     This is the best we can do with the information we
          //     have it guarantees we have at least 15 taps of
          //     margin on either side of calibration point 
          // How the final IDELAY tap is reached:
          //  1. If 2 edges found, current tap count = SE_TAPS + 1
          //       * Decrement by [(SE_TAPS-FE_TAPS)/2] + 1
          //  2. If 1 edge found, current tap count = 31
          //       * Decrement by 31 - FE_TAPS - TBY4, or
          //       * Decrement by 31 - FE_TAPS + TBY4
          //  3. If no edges found
          //       * Decrement by 16
          //*******************************************************

          // CASE1: If 2 edges found.
          // Only CASE1 will be true. Due to the low frequency fixes
          // the SM will not transition to this state when two edges are not
          // found. 
          if (found_second_edge_r)
            // SYNTHESIS_NOTE: May want to pipeline this operation
            // over multiple cycles for better timing. If so, need
            // to add delay state in CAL1 state machine 
            cnt_idel_dec_cpt_r 
              <=  #TCQ (({1'b0, second_edge_taps_r} -
                         {1'b0, first_edge_taps_r})>>1) + 1;
          // CASE 2: 1 edge found 
          // NOTE: Need to later add logic to prevent decrementing below 0
          else if (found_first_edge_r)
            if (first_edge_taps_r >= IODELAY_TAP_LEN/2 &&
               ((first_edge_taps_r+TBY4_TAPS) < (IODELAY_TAP_LEN - 1)))
              // final IDELAY value = [FIRST_EDGE_TAPS-CLK_MEM_PERIOD/2]
              cnt_idel_dec_cpt_r
                <= #TCQ (IODELAY_TAP_LEN-1) - first_edge_taps_r - TBY4_TAPS;
            else
              // final IDELAY value = [FIRST_EDGE_TAPS+CLK_MEM_PERIOD/2]
              cnt_idel_dec_cpt_r
                <= #TCQ (IODELAY_TAP_LEN-1) - first_edge_taps_r + TBY4_TAPS;
          else
            // CASE 3: No edges found, decrement by half tap length
            cnt_idel_dec_cpt_r <= #TCQ IODELAY_TAP_LEN/2;

          // Now use the value we just calculated to decrement CPT taps
          // to the desired calibration point
          cal1_state_r <= #TCQ CAL1_IDEL_DEC_CPT;
        end

        // decrement capture clock IDELAY for final adjustment - center
        // capture clock in middle of data eye. This adjustment will occur
        // only when both the edges are found usign CPT taps. Must do this
        // incrementally to avoid clock glitching (since CPT drives clock
        // divider within each ISERDES)
        CAL1_IDEL_DEC_CPT: begin
          cal1_dlyce_cpt_r  <= #TCQ 1'b1;
          cal1_dlyinc_cpt_r <= #TCQ 1'b0;
          // once adjustment is complete, we're done with calibration for
          // this DQS, repeat for next DQS
          cnt_idel_dec_cpt_r <= #TCQ cnt_idel_dec_cpt_r - 1;
          if (cnt_idel_dec_cpt_r == 7'b0000001)
            cal1_state_r <= #TCQ CAL1_IDEL_PD_ADJ;
        end

        // Determine whether we're done, or have more DQS's to calibrate
        // Also request precharge after every byte, as appropriate
        CAL1_NEXT_DQS: begin
          cal1_prech_req_r <= #TCQ 1'b1;
          // Prepare for another iteration with next DQS group
          found_dq_edge_r     <= #TCQ 1'b0;
          found_two_edge_r    <= #TCQ 1'b0;
          found_first_edge_r  <= #TCQ 1'b0;
          found_second_edge_r <= #TCQ 1'b0;
          cal1_dq_taps_inc_r  <= #TCQ 1'b0;
           
          // Wait until precharge that occurs in between calibration of
          // DQS groups is finished
          if (prech_done) begin
            if ((cal1_cnt_cpt_r >= DQS_WIDTH-1) ||
                (SIM_CAL_OPTION == "FAST_CAL"))
              cal1_state_r <= #TCQ CAL1_DONE;         
            else begin
              // Process next DQS group
              new_cnt_cpt_r  <= #TCQ 1'b1;
              cal1_dq_tap_cnt_r <=   #TCQ 5'd0;
              cal1_cnt_cpt_r <= #TCQ cal1_cnt_cpt_r + 1;
              cal1_state_r   <= #TCQ CAL1_NEW_DQS_WAIT;
            end
          end
        end

        CAL1_RST_CPT: begin
          cal1_dq_taps_inc_r <= #TCQ 1'b1;

          // If we never found even one edge by varying CPT taps, then
          // as an approximation set first edge tap indicators to 31. This
          // will be used later in the low-frequency portion of calibration
          if (!found_first_edge_r) begin 
            first_edge_taps_r <= #TCQ IODELAY_TAP_LEN - 1;
            right_edge_taps_r <= #TCQ IODELAY_TAP_LEN - 1;
          end
          
          if (cnt_idel_dec_cpt_r == 7'b0000000) begin
            // once the decerement is done. Go back to the CAL1_NEW_DQS_WAIT
            // state to load the correct data for comparison and to start
            // with DQ taps.        
            cal1_state_r <= #TCQ CAL1_NEW_DQS_WAIT;
            // Start with a DQ tap value of 0
            cal1_dq_tap_cnt_r <= #TCQ 5'd0;         
          end else begin
            // decrement both CPT taps to initial value. 
            // DQ IODELAY taps will be used to find the edges
            cal1_dlyce_cpt_r    <= #TCQ 1'b1;
            cal1_dlyinc_cpt_r   <= #TCQ 1'b0;
            cnt_idel_dec_cpt_r  <= #TCQ cnt_idel_dec_cpt_r - 1;
          end             
        end
        
        // When two edges are not found using CPT taps, finding edges
        // using DQ taps.
        CAL1_DETECT_EDGE_DQ: begin
          if (detect_edge_done_r) begin   
            // when using DQ taps make sure the window size is at least 10.
            // DQ taps used only in low frequency designs. 
            if ((found_edge_r) && (~found_first_edge_r ||
                                   (tby4_r > 6'd5))) begin
              // Sticky bit - asserted after we encounter first edge
              // If we've found a second edge(using dq taps) after a region 
              // of stability ( using tby4_r count) then this must be the 
              // second ("using dq taps") edge of the window 
              found_dq_edge_r  <= #TCQ 1'b1;
              found_two_edge_r <= #TCQ found_first_edge_r;
              cal1_state_r     <= #TCQ CAL1_CALC_IDEL_DQ;
              // Recording the dq taps when an edge is found. Account for
              // the case when an edge is found at DQ IODELAY = 0 taps -
              // possible because of jitter
              if (cal1_dq_tap_cnt_r != 5'd0)
                second_edge_dq_taps_r <= #TCQ cal1_dq_tap_cnt_r - 1;
              else
                second_edge_dq_taps_r <= #TCQ 5'd0;
            end else begin
              // No more DQ taps to increment - set left edge tap distance
              // to 31 as an approximation, and move on to figuring out
              // what needs to be done to center (or approximately center)
              // sampling point in middle of read window
              if (idel_tap_limit_dq_r) begin 
                cal1_state_r <= #TCQ CAL1_CALC_IDEL_DQ;
                second_edge_dq_taps_r <= #TCQ IODELAY_TAP_LEN - 1;
              end else 
                cal1_state_r <= #TCQ CAL1_IDEL_STORE_OLD;
            end
          end
        end

        CAL1_IDEL_INC_DQ: begin
          cal1_dq_tap_cnt_r <= #TCQ cal1_dq_tap_cnt_r + 1;
          cal1_state_r <= #TCQ CAL1_IDEL_INC_DQ_WAIT;
        end

        // Wait for IDELAY for DQ, and internal nodes within ISERDES
        // to settle, before checking again for an edge 
        CAL1_IDEL_INC_DQ_WAIT: begin 
          detect_edge_start_r <= #TCQ 1'b1;
          if (!pipe_wait)
            cal1_state_r <= #TCQ CAL1_DETECT_EDGE_DQ;
        end

        CAL1_CALC_IDEL_DQ: begin
          cal1_state_r <= #TCQ CAL1_IDEL_INC_DQ_CPT;
          cal1_dq_tap_cnt_r <= #TCQ 5'd0;
          cnt_idel_inc_cpt_r <= #TCQ 5'd0;                   

          // ------------------------------------------------------------
          // Determine whether to move DQ or CPT IODELAY taps to best
          // position sampling point in data valid window. In general,
          // we want to avoid setting DQ IODELAY taps to a nonzero value
          // in order to avoid adding IODELAY pattern-dependent jitter.
          // ------------------------------------------------------------
          // At this point, we have the following products of calibration:
          //   1. right_edge_taps_r: distance in IODELAY taps from start 
          //      position to right margin of current data valid window.
          //      Measured using CPT IODELAY. 
          //   2. first_edge_taps_r: distance in IODELAY taps from start 
          //      position to start of left edge of next data valid window. 
          //      Note that {first_edge_taps_r - right_edge_taps_r} = width 
          //      of the uncertainty or noise region between consecutive 
          //      data eyes. Measured using CPT IODELAY. 
          //   3. second_edge_dq_taps_r: distance in IODELAY taps from left 
          //      edge of current data valid window. Measured using DQ
          //      IODELAY. 
          //   4. tby4_r: half the width of the eye as calculated by
          //      {second_edge_dq_taps_r + first_edge_taps_r}
          // ------------------------------------------------------------
          // If two edges are found (one each from moving CPT, and DQ 
          // IODELAYs), then the following cases are considered for setting
          // final DQ and CPT delays (in the following order):
          //   1. second_edge_dq_taps_r <= tby4_r:
          //       * incr. CPT taps by {second_edge_dq_taps_r - tby4_r}
          //      this means that there is more taps available to the right
          //      of the starting position
          //   2. first_edge_taps_r + tby4_r <= 31 taps (IODELAY length)
          //       * incr CPT taps by {tby4_r}
          //      this means we have enough CPT taps available to us to
          //      position the sampling point in the middle of the next
          //      sampling window. Alternately, we could have instead
          //      positioned ourselves in the middle of the current window
          //      by using DQ taps, but if possible avoid using DQ taps
          //      because of pattern-dependent jitter
          //   3. otherwise, our only recourse is to move DQ taps in order
          //      to center the sampling point in the middle of the current
          //      data valid window
          //       * set DQ taps to {tby4_r - right_edge_taps_r}
          // ------------------------------------------------------------
          // Note that the case where only one edge is found, either using
          // CPT or DQ IODELAY taps is a subset of the above 3 cases, which
          // can be approximated by setting either right_edge_taps_r = 31, 
          // or second_edge_dq_taps_r = 31. This doesn't result in an exact
          // centering, but this will only occur at an extremely low
          // frequency, and exact centering is not required
          // ------------------------------------------------------------
          if (second_edge_dq_taps_r <= tby4_r)
            cnt_idel_inc_cpt_r <= #TCQ tby4_r - second_edge_dq_taps_r;
          else if ((first_edge_taps_r + tby4_r) <= IODELAY_TAP_LEN-1)
            cnt_idel_inc_cpt_r <= #TCQ first_edge_taps_r + tby4_r;
          else
            cal1_dq_tap_cnt_r <= #TCQ tby4_r - right_edge_taps_r;
        end
          
        // increment capture clock IDELAY for final adjustment - center
        // capture clock in middle of data eye. This state transition will
        // occur when only one edge or no edge is found using CPT taps
        CAL1_IDEL_INC_DQ_CPT: begin
          if (cnt_idel_inc_cpt_r == 7'b0000000)
            // once adjustment is complete, we're done with calibration for
            // this DQS, repeat for next DQS.     
            cal1_state_r <= #TCQ CAL1_IDEL_PD_ADJ;
          else begin     
            cal1_dlyce_cpt_r  <= #TCQ 1'b1;
            cal1_dlyinc_cpt_r <= #TCQ 1'b1;
            cnt_idel_inc_cpt_r <= #TCQ cnt_idel_inc_cpt_r - 1;
          end 
        end

        CAL1_IDEL_PD_ADJ: begin
          // If CPT is < than half the required PD taps then move the
          // CPT taps the DQ taps togather 
          if(idel_tap_cnt_cpt_r < (PD_HALF_TAP))begin
            cal1_dlyce_cpt_r  <= #TCQ 1'b1;
            cal1_dlyinc_cpt_r <= #TCQ 1'b1;
            cal1_dq_tap_cnt_r <= #TCQ cal1_dq_tap_cnt_r + 1;
          end else
            cal1_state_r <= #TCQ CAL1_NEXT_DQS;
        end
                     
        // Done with this stage of calibration
        // if used, allow DEBUG_PORT to control taps
        CAL1_DONE:
          rdlvl_done[0] <= #TCQ 1'b1;

        // Used for simulation only - hardcode IDELAY values for all rdlvl
        // associated IODELAYs - kind of a cheesy way of providing for
        // simulation, but I don't feel like modifying PHY_DQ_IOB to add
        // extra parameters just for simulation. This part shouldn't get
        // synthesized.
        CAL1_SKIP_RDLVL_INC_IDEL: begin
          cal1_dlyce_cpt_r      <= #TCQ 1'b1;
          cal1_dlyinc_cpt_r     <= #TCQ 1'b1;
          cnt_idel_skip_idel_r  <= #TCQ cnt_idel_skip_idel_r - 1;
          if (cnt_idel_skip_idel_r == 5'b00001)
            cal1_state_r  <= #TCQ CAL1_DONE;
        end

      endcase
    end

  //***************************************************************************
  // Calculates the window size during calibration.
  // Value is used only when two edges are not found using the CPT taps.    
  // cal1_dq_tap_cnt_r deceremented by 1 to account for the correct window.  
  //***************************************************************************

  always @(posedge clk) begin
    if (cal1_dq_tap_cnt_r > 5'd0)
      tby4_r <= #TCQ ((cal1_dq_tap_cnt_r - 1) + right_edge_taps_r)>>1;
    else
      tby4_r <= #TCQ ((cal1_dq_tap_cnt_r) + right_edge_taps_r)>>1;
  end

 //***************************************************************************
  // Stage 2 calibration: Read Enable
  // Read enable calibration determines the "round-trip" time (in # of CLK
  // cycles) between when a read command is issued by the controller, and
  // when the corresponding read data is synchronized by into the CLK domain
  //***************************************************************************

  always @(posedge clk) begin
    rd_active_r         <= #TCQ rdlvl_rd_active;
    rd_active_posedge_r <= #TCQ rdlvl_rd_active & ~rd_active_r;
  end

  //*****************************************************************
  // Expected data pattern when properly aligned through bitslip
  // Based on pattern of ({rise,fall}) =
  //   0xF, 0x0, 0xA, 0x5, 0x5, 0xA, 0x9, 0x6
  // Examining only the LSb of each DQS group, pattern is =
  //   bit3: 1, 0, 1, 0, 0, 1, 1, 0
  //   bit2: 1, 0, 0, 1, 1, 0, 0, 1
  //   bit1: 1, 0, 1, 0, 0, 1, 0, 1
  //   bit0: 1, 0, 0, 1, 1, 0, 1, 0
  // Change the hard-coded pattern below accordingly as RD_SHIFT_LEN
  // and the actual training pattern contents change
  //*****************************************************************

  assign pat_rise0[3] = 2'b10;
  assign pat_fall0[3] = 2'b01;
  assign pat_rise1[3] = 2'b11;
  assign pat_fall1[3] = 2'b00;

  assign pat_rise0[2] = 2'b11;
  assign pat_fall0[2] = 2'b00;
  assign pat_rise1[2] = 2'b00;
  assign pat_fall1[2] = 2'b11;

  assign pat_rise0[1] = 2'b10;
  assign pat_fall0[1] = 2'b01;
  assign pat_rise1[1] = 2'b10;
  assign pat_fall1[1] = 2'b01;

  assign pat_rise0[0] = 2'b11;
  assign pat_fall0[0] = 2'b00;
  assign pat_rise1[0] = 2'b01;
  assign pat_fall1[0] = 2'b10;

  // Do not need to look at sr_valid_r - the pattern can occur anywhere
  // during the shift of the data shift register - as long as the order
  // of the bits in the training sequence is correct. Each bit of each
  // byte is compared to expected pattern - this is not strictly required.
  // This was done to prevent (and "drastically decrease") the chance that
  // invalid data clocked in when the DQ bus is tri-state (along with a
  // combination of the correct data) will resemble the expected data
  // pattern. A better fix for this is to change the training pattern and/or
  // make the pattern longer.
  generate
    genvar pt_i;
    for (pt_i = 0; pt_i < DRAM_WIDTH; pt_i = pt_i + 1) begin: gen_pat_match
      always @(posedge clk) begin
        if (sr_rise0_r[pt_i] == pat_rise0[pt_i%4])
          pat_match_rise0_r[pt_i] <= #TCQ 1'b1;
        else
          pat_match_rise0_r[pt_i] <= #TCQ 1'b0;

        if (sr_fall0_r[pt_i] == pat_fall0[pt_i%4])
          pat_match_fall0_r[pt_i] <= #TCQ 1'b1;
        else
          pat_match_fall0_r[pt_i] <= #TCQ 1'b0;

        if (sr_rise1_r[pt_i] == pat_rise1[pt_i%4])
          pat_match_rise1_r[pt_i] <= #TCQ 1'b1;
        else
          pat_match_rise1_r[pt_i] <= #TCQ 1'b0;

        if (sr_fall1_r[pt_i] == pat_fall1[pt_i%4])
          pat_match_fall1_r[pt_i] <= #TCQ 1'b1;
        else
          pat_match_fall1_r[pt_i] <= #TCQ 1'b0;
      end
    end
  endgenerate

  always @(posedge clk) begin
    pat_match_rise0_and_r <= #TCQ &pat_match_rise0_r;
    pat_match_fall0_and_r <= #TCQ &pat_match_fall0_r;
    pat_match_rise1_and_r <= #TCQ &pat_match_rise1_r;
    pat_match_fall1_and_r <= #TCQ &pat_match_fall1_r;
    pat_data_match_r <= #TCQ (pat_match_rise0_and_r &&
                              pat_match_fall0_and_r &&
                              pat_match_rise1_and_r &&
                              pat_match_fall1_and_r);
  end

  // Generic counter to force wait after either bitslip value or
  // CNT_RDEN is changed - allows time for old contents of read pipe
  // to flush out
  always @(posedge clk)
    if (rst) begin
      rden_wait_r <= #TCQ 1'b0;
      cnt_rden_wait_r <= #TCQ 'b0;
    end else begin
      if (cal2_state_r != CAL2_READ_WAIT) begin
        rden_wait_r <= #TCQ 1'b1;
        cnt_rden_wait_r <= #TCQ 'b0;
      end else begin
        cnt_rden_wait_r <= #TCQ cnt_rden_wait_r + 1;
        if (cnt_rden_wait_r == RDEN_WAIT_CNT-1)
          rden_wait_r <= #TCQ 1'b0;
      end
    end

  // Register output for timing purposes
  always @(posedge clk) begin
    rd_bitslip_cnt <= #TCQ cal2_rd_bitslip_cnt_r;
    rd_active_dly  <= #TCQ cal2_rd_active_dly_r;
  end

   
  //*****************************************************************
  // Stage 2 state machine
  //*****************************************************************

  // when calibrating, check to see which clock cycle (after the read is
  // issued) does the expected data pattern arrive. Record this result
  // NOTES:
  //  1. An error condition can occur due to two reasons:
  //    a. If the matching logic waits a long enough amount of time
  //       and the expected data pattern is not received (longer than
  //       the theoretical maximum time that the data can take, factoring
  //       in CAS latency, prop delays, etc.), then flag an error.
  //       However, the error may be "recoverable" in that the write
  //       logic is still calibrating itself (in this case part of the
  //       write calibration is intertwined with the this stage of read
  //       calibration - write logic writes a pattern to the memory, then
  //       relies on rdlvl to find that pattern - if it doesn't, wrlvl
  //       changes its timing and tries again. By design, if the write path
  //       timing is incorrect, the rdlvl logic will never find the
  //       pattern). Because of this, there is a mechanism to restart
  //       this stage of rdlvl if an "error" is found.
  //    b. If the delay between different DQS groups is too large.
  //       There will be a maximum "skew" between different DQS groups
  //       based on routing, clock skew, etc.

  // NOTE: Can add error checking here in case valid data not found on any
  //  of the available pipeline stages
  always @(posedge clk) begin
    if (rst) begin
      cal2_cnt_bitslip_r    <= #TCQ 'b0;
      cal2_cnt_rd_dly_r     <= #TCQ 'b0;
      cal2_cnt_rden_r       <= #TCQ 'b0;
      cal2_done_r           <= #TCQ 1'b0;
      cal2_en_dqs_skew_r    <= #TCQ 'b0;
      cal2_max_cnt_rd_dly_r <= #TCQ 'b0;
      cal2_prech_req_r      <= #TCQ 1'b0;
      cal2_rd_bitslip_cnt_r <= #TCQ 'b0;
      cal2_state_r          <= #TCQ CAL2_IDLE;
      rdlvl_pat_err         <= #TCQ 1'b0;
    end else begin
      cal2_prech_req_r <= #TCQ 1'b0;

      case (cal2_state_r)
        CAL2_IDLE:
          if (rdlvl_start[1]) begin
            if (SIM_CAL_OPTION == "SKIP_CAL") begin
              // If skip rdlvl, then proceed to end. Also hardcode bitslip
              // values based on CAS latency
              cal2_state_r <= #TCQ CAL2_DONE;
              case (nCL)
                5:  cal2_rd_bitslip_cnt_r <= #TCQ {DQS_WIDTH{2'b00}};
                6:  cal2_rd_bitslip_cnt_r <= #TCQ {DQS_WIDTH{2'b10}};
                7:  cal2_rd_bitslip_cnt_r <= #TCQ {DQS_WIDTH{2'b00}};
                8:  cal2_rd_bitslip_cnt_r <= #TCQ {DQS_WIDTH{2'b10}};
                9:  cal2_rd_bitslip_cnt_r <= #TCQ {DQS_WIDTH{2'b00}};
                10: cal2_rd_bitslip_cnt_r <= #TCQ {DQS_WIDTH{2'b10}};
                11: cal2_rd_bitslip_cnt_r <= #TCQ {DQS_WIDTH{2'b00}};
              endcase
            end else
              cal2_state_r <= #TCQ CAL2_READ_WAIT;
          end

        // General wait state to wait for read pipe contents to settle
        // either after bitslip is changed
        CAL2_READ_WAIT: begin
          // Reset read delay counter after bitslip is changed - with every
          // new bitslip setting, we need to remeasure the read delay
          cal2_cnt_rd_dly_r <= #TCQ 'b0;
          // Wait for rising edge of synchronized rd_active signal from
          // controller, then starts counting clock cycles until the correct
          // pattern is returned from memory. Also make sure that we've
          // waited long enough after incrementing CNT_RDEN to allow data
          // to change, and ISERDES pipeline to flush out
          if ((rd_active_posedge_r == 1'b1) && !rden_wait_r)
            cal2_state_r <= #TCQ CAL2_DETECT_MATCH;
        end

        // Wait until either a match is found, or until enough cycles
        // have passed that there could not possibly be a match
        CAL2_DETECT_MATCH: begin
          // Increment delay counter for every cycle we're in this state
          cal2_cnt_rd_dly_r <= #TCQ cal2_cnt_rd_dly_r + 1;

          if (pat_data_match_r)
            // If found data match, then move on to next DQS group
            cal2_state_r <= #TCQ CAL2_NEXT_DQS;
          else if (cal2_cnt_rd_dly_r == MAX_RD_DLY_CNT-1) begin
            if (cal2_cnt_bitslip_r != 2'b11) begin 
              // If we've waited enough cycles for worst possible "round-trip"
              // delay, then try next bitslip setting, and repeat this process
              cal2_state_r <= #TCQ CAL2_READ_WAIT;
              cal2_cnt_bitslip_r <= #TCQ cal2_cnt_bitslip_r + 1;
              // Update bitslip count for current DQS group
              if (SIM_CAL_OPTION == "FAST_CAL") begin
                // Increment bitslip count - for simulation, update bitslip
                // count for all DQS groups with same value
                for (i = 0; i < DQS_WIDTH; i = i + 1) begin: loop_sim_bitslip
                  cal2_rd_bitslip_cnt_r[2*i+:2] 
                    <= #TCQ cal2_rd_bitslip_cnt_r[2*i+:2] + 1;
                end
            end else
              // Otherwise, increment only for current DQS group
              cal2_rd_bitslip_cnt_r[2*(cal2_cnt_rden_r)+:2]
                <= #TCQ cal2_rd_bitslip_cnt_r[2*(cal2_cnt_rden_r)+:2] + 1;
            end else
              // Otherwise, if we've already exhausted all bitslip settings
              // and still haven't found a match, the boat has **possibly **
              // sunk (may be an error due to write calibration still
              // figuring out its own timing)
              cal2_state_r <= #TCQ CAL2_ERROR_TO;
          end
        end
          
        // Final processing for current DQS group. Move on to next group
        // Determine read enable delay between current DQS and DQS[0]
        CAL2_NEXT_DQS: begin
          // At this point, we've just found the correct pattern for the
          // current DQS group. Now check to see how long it took for the
          // pattern to return. Record the current delay time, as well as
          // the maximum time required across all the bytes
          if (cal2_cnt_rd_dly_r > cal2_max_cnt_rd_dly_r)
            cal2_max_cnt_rd_dly_r <= #TCQ cal2_cnt_rd_dly_r;
          if (SIM_CAL_OPTION == "FAST_CAL") begin
            // For simulation, update count for all DQS groups
           for (j = 0; j < DQS_WIDTH; j = j + 1) begin: loop_sim_
              cal2_dly_cnt_r[5*j+:5] <= #TCQ cal2_cnt_rd_dly_r;
            end
          end else
            cal2_dly_cnt_r[5*(cal2_cnt_rden_r)+:5] <= #TCQ cal2_cnt_rd_dly_r;
            
          // Request bank/row precharge, and wait for its completion. Always
          // precharge after each DQS group to avoid tRAS(max) violation
          cal2_prech_req_r <= #TCQ 1'b1;
          if (prech_done)
            if (((DQS_WIDTH == 1) || (SIM_CAL_OPTION == "FAST_CAL")) ||
                (cal2_cnt_rden_r == DQS_WIDTH-1)) begin
              // If either FAST_CAL is enabled and first DQS group is 
              // finished, or if the last DQS group was just finished,
              // then indicate that we can switch to final values for
              // byte skews, and signal end of stage 2 calibration
              cal2_en_dqs_skew_r <= #TCQ 1'b1;
              cal2_state_r       <= #TCQ CAL2_DONE;
            end else begin
              // Continue to next DQS group
              cal2_cnt_rden_r    <= #TCQ cal2_cnt_rden_r + 1;
              cal2_cnt_bitslip_r <= #TCQ 2'b00;
              cal2_state_r       <= #TCQ CAL2_READ_WAIT;
            end
        end

        // Finished with read enable calibration
        CAL2_DONE:
          cal2_done_r <= #TCQ 1'b1;

        // Error detected due to timeout from waiting for expected data pat
        // Also assert error in this case, but also allow opportunity for
        // external control logic to resume the calibration at this point
        CAL2_ERROR_TO: begin
          // Assert error even though error might be temporary (until write
          // calibration logic asserts RDLVL_PAT_RESUME   
          rdlvl_pat_err <= #TCQ 1'b1;
          // Wait for resume signal from write calibration logic
          if (rdlvl_pat_resume) begin
            // Similarly, reset bitslip control for current DQS group to 0
            cal2_rd_bitslip_cnt_r[2*(cal2_cnt_rden_r)+:2] <= #TCQ 2'b00;
            cal2_cnt_bitslip_r <= #TCQ 2'b00;
            cal2_state_r       <= #TCQ CAL2_READ_WAIT;
            rdlvl_pat_err      <= #TCQ 1'b0;
          end
        end
      endcase
    end
  end

  // Display which DQS group failed when timeout error occurs during pattern
  // calibration. NOTE: Only valid when rdlvl_pat_err = 1
  assign rdlvl_pat_err_cnt = cal2_cnt_rden_r;

  // Final output: determine amount to delay rd_active signal by
  always @(posedge clk)
    if (SIM_CAL_OPTION == "SKIP_CAL")
      // Hardcoded option (for simulation only). The results are very
      // specific for a testbench w/o additional net delays using a Micron
      // memory model. Any other configuration may not work.
      case (nCL)
        5:  cal2_rd_active_dly_r <= #TCQ 11;
        6:  cal2_rd_active_dly_r <= #TCQ 11;
        7:  cal2_rd_active_dly_r <= #TCQ 12;
        8:  cal2_rd_active_dly_r <= #TCQ 12;
        9:  cal2_rd_active_dly_r <= #TCQ 13;
        10: cal2_rd_active_dly_r <= #TCQ 13;
        11: cal2_rd_active_dly_r <= #TCQ 14;
      endcase
    else if (!rdlvl_done[1])
      // Before calibration is complete, set RD_ACTIVE to minimum delay
      cal2_rd_active_dly_r <= #TCQ 'b0;
    else
      // Set RD_ACTIVE based on maximum DQS group delay
      cal2_rd_active_dly_r <= #TCQ cal2_max_cnt_rd_dly_r - RDEN_DELAY_OFFSET;
  
  generate
    genvar dqs_i;
    for (dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i + 1) begin: gen_dly
      // Determine difference between delay for each DQS group, and the
      // DQS group with the maximum delay 
      always @(posedge clk)
        cal2_dly_cnt_delta_r[dqs_i] 
          <= #TCQ cal2_max_cnt_rd_dly_r - cal2_dly_cnt_r[5*dqs_i+:5];
      // Delay those DQS groups with less than the maximum delay
      always @(posedge clk) begin
        if (rst) begin
          cal2_clkdly_cnt_r[2*dqs_i+:2] <= #TCQ 2'b00;
          cal2_deskew_err_r[dqs_i]      <= #TCQ 1'b0;
        end else if (!cal2_en_dqs_skew_r) begin
          // While calibrating, do not skew individual bytes
          cal2_clkdly_cnt_r[2*dqs_i+:2] <= #TCQ 2'b00;
          cal2_deskew_err_r[dqs_i]      <= #TCQ 1'b0;
        end else begin 
          // Once done calibrating, go ahead and skew individual bytes
          case (cal2_dly_cnt_delta_r[dqs_i])
            5'b00000: begin  
              cal2_clkdly_cnt_r[2*dqs_i+:2] <= #TCQ 2'b00;
              cal2_deskew_err_r[dqs_i]      <= #TCQ 1'b0;
            end
            5'b00001: begin 
              cal2_clkdly_cnt_r[2*dqs_i+:2] <= #TCQ 2'b01;
              cal2_deskew_err_r[dqs_i]      <= #TCQ 1'b0;
            end
            5'b00010: begin
              cal2_clkdly_cnt_r[2*dqs_i+:2] <= #TCQ 2'b10;
              cal2_deskew_err_r[dqs_i]      <= #TCQ 1'b0;
            end
            5'b00011: begin
              cal2_clkdly_cnt_r[2*dqs_i+:2] <= #TCQ 2'b11;
              cal2_deskew_err_r[dqs_i]      <= #TCQ 1'b0;
            end
            default: begin
              // If there's more than 3 cycles of skew between different
              // then flag error
              cal2_clkdly_cnt_r[2*dqs_i+:2] <= #TCQ 2'bxx;
              cal2_deskew_err_r[dqs_i]      <= #TCQ 1'b1;
            end
          endcase
        end
      end 
    end
  endgenerate

  always @(posedge clk)
    rd_clkdly_cnt <= #TCQ cal2_clkdly_cnt_r;
  
  // Assert when non-recoverable error occurs during stage 2 cal
  always @(posedge clk)
    if (rst)
      rdlvl_err[1] <= #TCQ 1'b0;
    else
      // Combine errors from each of the individual DQS group deskews
      rdlvl_err[1] <= #TCQ | cal2_deskew_err_r;

  // Delay assertion of RDLVL_DONE for stage 2 by a few cycles after
  // we've reached CAL2_DONE to account for fact that the proper deskew
  // delays still need to be calculated, and driven to the individual
  // DQ/DQS delay blocks. It's not an exact science, the # of delay cycles
  // is sufficient. Feel free to add more delay if the calculation or FSM 
  // logic is later changed. 
  always @(posedge clk)
    if (rst) begin 
      cal2_done_r1  <= #TCQ 1'b0;
      cal2_done_r2  <= #TCQ 1'b0;
      cal2_done_r3  <= #TCQ 1'b0;
      rdlvl_done[1] <= #TCQ 1'b0;
    end else begin
      cal2_done_r1  <= #TCQ cal2_done_r;
      cal2_done_r2  <= #TCQ cal2_done_r1;
      cal2_done_r3  <= #TCQ cal2_done_r2;
      rdlvl_done[1] <= #TCQ cal2_done_r3;
    end 


endmodule
