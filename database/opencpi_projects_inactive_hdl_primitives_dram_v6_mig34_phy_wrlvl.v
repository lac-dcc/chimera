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
// \   \   \/     Version: 3.4 
//  \   \         Application: MIG
//  /   /         Filename: phy_wrlvl.v
// /___/   /\     Date Last Modified: $Date: 2010/03/18 20:14:23 $
// \   \  /  \    Date Created: Mon Jun 23 2008
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Memory initialization and overall master state control during
//  initialization and calibration. Specifically, the following functions
//  are performed:
//    1. Memory initialization (initial AR, mode register programming, etc.)
//    2. Initiating write leveling
//    3. Generate training pattern writes for read leveling. Generate
//       memory readback for read leveling.
//  This module has a DFI interface for providing control/address and write
//  data to the rest of the PHY datapath during initialization/calibration.
//  Once initialization is complete, control is passed to the MC. 
//  NOTES:
//    1. Multiple CS (multi-rank) not supported
//    2. DDR2 not supported
//    3. ODT not supported
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_wrlvl.v,v 1.7.4.1 2010/03/18 20:14:23 mgeorge Exp $
**$Date: 2010/03/18 20:14:23 $
**$Author: mgeorge $
**$Revision: 1.7.4.1 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_wrlvl.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_wrlvl #
  (
   parameter TCQ = 100,
   parameter DQS_CNT_WIDTH     = 3,
   parameter DQ_WIDTH          = 64,
   parameter SHIFT_TBY4_TAP    = 7,
   parameter DQS_WIDTH         = 2,
   parameter DRAM_WIDTH        = 8,
   parameter CS_WIDTH          = 1,
   parameter CAL_WIDTH         = "HALF",
   parameter DQS_TAP_CNT_INDEX = 42
   )
  (
   input                        clk,
   input                        rst,
   input [2:0]                  calib_width,
   input [1:0]                  rank_cnt,
   input                        wr_level_start,
   input                        wl_sm_start,
   input [(DQ_WIDTH)-1:0]       rd_data_rise0,
   // indicates read level stage 2 error
   input                        rdlvl_error,
   // read level stage 2 failing byte
   input [DQS_CNT_WIDTH-1:0]    rdlvl_err_byte,
                                
   output                       wr_level_done,
   // to phy_init for cs logic
   output                       wrlvl_rank_done,
   output [DQS_TAP_CNT_INDEX:0]     dlyval_wr_dqs,
   output [DQS_TAP_CNT_INDEX:0]     dlyval_wr_dq,
   output [DQS_WIDTH-1:0]       inv_dqs,
   // resume read level stage 2 with write bit slip adjust
   output reg                   rdlvl_resume,
   //write bit slip adjust
   output [2*DQS_WIDTH-1:0]     wr_calib_dly,
   output reg                   wrcal_err,
   output reg                   wrlvl_err,
   // Debug ports
   output [4:0]                 dbg_wl_tap_cnt,
   output                       dbg_wl_edge_detect_valid,
   output [(DQS_WIDTH)-1:0]     dbg_rd_data_edge_detect,
   output [(DQS_WIDTH)-1:0]     dbg_rd_data_inv_edge_detect,
   output [DQS_CNT_WIDTH:0]     dbg_dqs_count,
   output [3:0]                 dbg_wl_state
   );


   localparam WL_IDLE         = 4'h0;
   localparam WL_INIT         = 4'h1;
   localparam WL_DEL_INC      = 4'h2;
   localparam WL_WAIT         = 4'h3;
   localparam WL_EDGE_CHECK   = 4'h4;
   localparam WL_DQS_CHECK    = 4'h5;
   localparam WL_DQS_CNT      = 4'h6;
   localparam WL_INV_DQS      = 4'h7;
   localparam WL_WAIT_DQ      = 4'h8;


   integer     e, f, g, h, i, j, k, m;
   
   reg [DQS_CNT_WIDTH:0] dqs_count_r;
   reg [DQS_CNT_WIDTH-1:0] rdlvl_err_byte_r;
   reg [1:0]             rank_cnt_r;
   reg [DQS_WIDTH-1:0]   rd_data_rise_wl_r;
   reg [DQS_WIDTH-1:0]   rd_data_previous_r;
   reg [DQS_WIDTH-1:0]   rd_data_inv_dqs_previous_r;
   reg [DQS_WIDTH-1:0]   rd_data_edge_detect_r;
   reg [DQS_WIDTH-1:0]   rd_data_inv_edge_detect_r;
   reg                   wr_level_done_r;
   reg                   wrlvl_rank_done_r;
   reg                   wr_level_start_r;
   reg [3:0]             wl_state_r, wl_state_r1;
   reg                   wl_edge_detect_valid_r;
   reg [4:0]             wl_tap_count_r;
   reg [5*DQS_WIDTH-1:0] wl_dqs_tap_count_r[0:CS_WIDTH-1];
   reg                   rdlvl_error_r;
   reg                   rdlvl_error_r1;
   reg                   rdlvl_resume_r;
   reg                   rdlvl_resume_r1;
   reg                   rdlvl_resume_r2;
   reg [2*DQS_WIDTH-1:0] wr_calib_dly_r;
   reg [DQS_WIDTH-1:0]   set_one_flag;
   reg [DQS_WIDTH-1:0]   set_two_flag;
   reg [DQS_WIDTH-1:0]   inv_dqs_wl;
   reg [DQS_WIDTH-1:0]   inv_dqs_r[0:CS_WIDTH-1];
   reg [5*DQS_WIDTH-1:0] dlyval_wr_dqs_r[0:CS_WIDTH-1];
   reg [5*DQS_WIDTH-1:0] dlyval_wr_dq_r[0:CS_WIDTH-1];
   reg [DQS_WIDTH-1:0]   inv_dqs_wl_r[0:CS_WIDTH-1];
   reg [2*DQS_WIDTH-1:0] wr_calib_dly_r1[0:CS_WIDTH-1];
   reg [4:0] dq_tap_wl[0:DQS_WIDTH-1];
   reg [4:0] dq_tap[0:CS_WIDTH-1][0:DQS_WIDTH-1];
   reg                   dq_cnt_inc;
   
   reg [1:0] stable_cnt;
   reg [1:0] inv_stable_cnt;



  // Debug ports
   assign dbg_wl_edge_detect_valid = wl_edge_detect_valid_r;
   assign dbg_rd_data_edge_detect  = rd_data_edge_detect_r;
   assign dbg_rd_data_inv_edge_detect = rd_data_inv_edge_detect_r;
   assign dbg_wl_tap_cnt = wl_tap_count_r;
   assign dbg_dqs_count = dqs_count_r;
   assign dbg_wl_state = wl_state_r;
   

   assign dlyval_wr_dqs = dlyval_wr_dqs_r[rank_cnt];
   assign dlyval_wr_dq  = dlyval_wr_dq_r[rank_cnt];
   assign inv_dqs       = inv_dqs_wl_r[rank_cnt];
   assign wr_calib_dly  = wr_calib_dly_r1[rank_cnt];
   
   generate
   genvar cal_i;
     for (cal_i = 0; cal_i < CS_WIDTH; cal_i = cal_i + 1) begin: gen_rank
       always @(posedge clk) begin
         if (rst) begin
           inv_dqs_wl_r[cal_i]    <= #TCQ {DQS_WIDTH{1'b0}};
           dlyval_wr_dqs_r[cal_i] <= #TCQ {5*DQS_WIDTH{1'b0}};
         end else begin
           inv_dqs_wl_r[cal_i]    <= #TCQ inv_dqs_r[cal_i];
           dlyval_wr_dqs_r[cal_i] <= #TCQ wl_dqs_tap_count_r[cal_i];
         end
       end
     end
   endgenerate
   

     always @(posedge clk) begin
       if (rst) begin
         for (i = 0; i < CS_WIDTH; i = i + 1) begin: rst_wr_calib_dly_r1_loop
           wr_calib_dly_r1[i] <= #TCQ 'b0;
         end
       end else begin
         wr_calib_dly_r1[rank_cnt] <= #TCQ wr_calib_dly_r;
         if (CS_WIDTH == 4) begin
           wr_calib_dly_r1[1] <= #TCQ wr_calib_dly_r1[0];
           wr_calib_dly_r1[2] <= #TCQ wr_calib_dly_r1[0];
           wr_calib_dly_r1[3] <= #TCQ wr_calib_dly_r1[0];
         end else if (CS_WIDTH == 3) begin
           wr_calib_dly_r1[1] <= #TCQ wr_calib_dly_r1[0];
           wr_calib_dly_r1[2] <= #TCQ wr_calib_dly_r1[0];
         end else if (CS_WIDTH == 2)
           wr_calib_dly_r1[1] <= #TCQ wr_calib_dly_r1[0];
       end
     end

   
   assign wr_level_done = wr_level_done_r;
   assign wrlvl_rank_done = wrlvl_rank_done_r;
   

   // only storing the rise data for checking. The data comming back during
   // write leveling will be a static value. Just checking for rise data is
   // enough. 

genvar rd_i;
generate
  for(rd_i = 0; rd_i < DQS_WIDTH; rd_i = rd_i +1)begin: gen_rd
   always @(posedge clk)
     rd_data_rise_wl_r[rd_i] <=
     #TCQ |rd_data_rise0[(rd_i*DRAM_WIDTH)+DRAM_WIDTH-1:rd_i*DRAM_WIDTH];
  end
endgenerate


   // storing the previous data for checking later.
   always @(posedge clk)begin
      if (rst | (wl_state_r == WL_DQS_CNT))
        stable_cnt <= #TCQ 2'd0;
      else if (~inv_dqs_wl[dqs_count_r] & ((wl_state_r == WL_INIT) |
         ((wl_state_r == WL_EDGE_CHECK) & (wl_edge_detect_valid_r)))) begin
        rd_data_previous_r         <= #TCQ rd_data_rise_wl_r;
        if ((rd_data_previous_r[dqs_count_r] == rd_data_rise_wl_r[dqs_count_r])
           & (wl_tap_count_r > 5'd0) & (stable_cnt < 2'd3))
          stable_cnt <= #TCQ stable_cnt + 1;
        else if (rd_data_previous_r[dqs_count_r] != rd_data_rise_wl_r[dqs_count_r])
          stable_cnt <= #TCQ 2'd0;
      end
   end
   
   always @(posedge clk)begin
      if (rst | (wl_state_r == WL_DQS_CNT))
        inv_stable_cnt <= #TCQ 2'd0;
      else if (inv_dqs_wl[dqs_count_r] & 
         ((wl_state_r == WL_EDGE_CHECK) & (wl_edge_detect_valid_r))) begin
        rd_data_inv_dqs_previous_r <= #TCQ rd_data_rise_wl_r;
        if ((rd_data_inv_dqs_previous_r[dqs_count_r] ==
           rd_data_rise_wl_r[dqs_count_r]) & (wl_tap_count_r > 5'd0)
           & (inv_stable_cnt < 2'd3))
          inv_stable_cnt <= #TCQ inv_stable_cnt + 1;
        else if (rd_data_inv_dqs_previous_r[dqs_count_r] !=
           rd_data_rise_wl_r[dqs_count_r]) 
          inv_stable_cnt <= #TCQ 2'd0;
      end
   end


   //checking for transition from 0 to 1
   always @(posedge clk)begin
     if (rst) begin
       rd_data_inv_edge_detect_r <= #TCQ {DQS_WIDTH{1'b0}};
       rd_data_edge_detect_r     <= #TCQ {DQS_WIDTH{1'b0}};
     end else if (inv_dqs_wl[dqs_count_r]) begin
       if (inv_stable_cnt == 2'd3)
         rd_data_inv_edge_detect_r <= #TCQ (~rd_data_inv_dqs_previous_r &
                                            rd_data_rise_wl_r);
       else
         rd_data_inv_edge_detect_r <= #TCQ {DQS_WIDTH{1'b0}};
     end else if (~inv_dqs_wl[dqs_count_r]) begin
       if (stable_cnt == 2'd3)
         rd_data_edge_detect_r <= #TCQ (~rd_data_previous_r &
                                        rd_data_rise_wl_r);
       else
         rd_data_edge_detect_r <= #TCQ {DQS_WIDTH{1'b0}};
     end
   end

// Below 320 MHz it can take less than SHIFT_TBY4_TAP taps for DQS
// to be aligned to CK resulting in an underflow for DQ IODELAY taps
// (DQS taps-SHIFT_TBY4_TAP). In this case DQ will be set to 0 taps. 
// This is non-optimal because DQS and DQ are not exactly 90 degrees 
// apart. Since there is relatively more margin at frequencies below 
// 320 MHz this setting should be okay.
generate
  always @(posedge clk) begin
      if (rst) begin
        for (e = 0; e < CS_WIDTH; e = e +1) begin: tap_offset_rank   
          for(f = 0; f < DQS_WIDTH; f = f +1) begin: tap_offset_dqs_cnt
            dq_tap[e][f] <= #TCQ 5'd0;
          end
        end
      end else if (~wr_level_done_r) begin
        dq_tap[rank_cnt_r][dqs_count_r] <= #TCQ dq_tap_wl[dqs_count_r];
      end else if (wr_level_done_r & (CAL_WIDTH == "HALF") &
                  (CS_WIDTH == 4)) begin
        for (g = 0; g < DQS_WIDTH; g = g +1) begin: rank_dqs_cnt 
          dq_tap[2][g] <= #TCQ dq_tap[0][g];
          dq_tap[3][g] <= #TCQ dq_tap[1][g];
        end
      end else if (wr_level_done_r & (CAL_WIDTH == "HALF") &
                 (CS_WIDTH == 2)) begin
        for (h = 0; h < DQS_WIDTH; h = h + 1) begin: dqs_cnt
          dq_tap[1][h] <= #TCQ dq_tap[0][h];
        end
      end
  end
endgenerate



  
  // registring the write level start signal
   always@(posedge clk) begin
     wr_level_start_r <= #TCQ wr_level_start;
   end

   
   // Storing inv_dqs values during DQS write leveling
   always @(posedge clk) begin
     if (rst) begin
       for (j = 0; j < CS_WIDTH; j = j + 1) begin: rst_inv_dqs_r_loop
         inv_dqs_r[j] <= #TCQ 'b0;
       end
     end else if (~wr_level_done_r) begin
         inv_dqs_r[rank_cnt_r] <= #TCQ inv_dqs_wl;
     end else if (wr_level_done_r & (CAL_WIDTH == "HALF") &
                 (CS_WIDTH == 4)) begin
         inv_dqs_r[2] <= #TCQ inv_dqs_r[0];
         inv_dqs_r[3] <= #TCQ inv_dqs_r[1];
     end else if (wr_level_done_r & (CAL_WIDTH == "HALF") &
                 (CS_WIDTH == 2)) begin
         inv_dqs_r[1] <= #TCQ inv_dqs_r[0];
     end
     
   end
   
   // Storing DQS tap values at the end of each DQS write leveling


   always @(posedge clk) begin
     // MODIFIED, RC, 060908
     if (rst) begin
       for (k = 0; k < CS_WIDTH; k = k + 1) begin: rst_wl_dqs_tap_count_loop
         wl_dqs_tap_count_r[k] <= #TCQ 'b0;
       end
     end else if ((wl_state_r == WL_DQS_CNT) | (wl_state_r == WL_WAIT))begin
         wl_dqs_tap_count_r[rank_cnt_r][(5*dqs_count_r)+:5]
           <= #TCQ wl_tap_count_r;
     end else if (wr_level_done_r & (CAL_WIDTH == "HALF") &
                 (CS_WIDTH == 4)) begin
         wl_dqs_tap_count_r[2] <= #TCQ wl_dqs_tap_count_r[0];
         wl_dqs_tap_count_r[3] <= #TCQ wl_dqs_tap_count_r[1];
     end else if (wr_level_done_r & (CAL_WIDTH == "HALF") &
                 (CS_WIDTH == 2)) begin
         wl_dqs_tap_count_r[1] <= #TCQ wl_dqs_tap_count_r[0];
     end
   end



   // assign DQS output tap count to DQ with the 90 degree offset

   generate
   genvar rank_i;
   genvar dq_i;
     for (rank_i = 0; rank_i < CS_WIDTH; rank_i = rank_i + 1) begin: gen_dq_rank   
       for(dq_i = 0; dq_i < DQS_WIDTH; dq_i = dq_i +1) begin: gen_dq_tap_cnt
         // MODIFIED, RC, 060908 - timing when DQ IODELAY value is changed
         //  does not need to be precise as long as we're not changing while
         //  looking for edge on DQ
         always @(posedge clk)
             dlyval_wr_dq_r[rank_i][5*dq_i+:5] 
             <= #TCQ dq_tap[rank_i][dq_i];
       end
     end
   endgenerate


   
   // state machine to initiate the write leveling sequence
   // The state machine operates on one byte at a time.
   // It will increment the delays to the DQS OSERDES
   // and sample the DQ from the memory. When it detects
   // a transition from 1 to 0 then the write leveling is considered
   // done. 
   always @(posedge clk) begin
      if(rst)begin
        for(m = 0; m < DQS_WIDTH; m = m +1) begin: tap_offset_wl_rst
         dq_tap_wl[m]       <= #TCQ 5'd0;
        end
         wrlvl_err              <= #TCQ 1'b0;
         wr_level_done_r        <= #TCQ 1'b0;
         wrlvl_rank_done_r      <= #TCQ 1'b0;
         inv_dqs_wl             <= #TCQ {DQS_WIDTH{1'b0}}; 
         dqs_count_r            <= #TCQ {DQS_CNT_WIDTH+1{1'b0}};
         dq_cnt_inc             <= #TCQ 1'b1;
         rank_cnt_r             <= #TCQ 2'b00;
         wl_state_r             <= #TCQ WL_IDLE;
         wl_state_r1            <= #TCQ WL_IDLE;
         wl_edge_detect_valid_r <= #TCQ 1'b0;
         wl_tap_count_r         <= #TCQ 5'b0;
      end else begin
         wl_state_r1            <= #TCQ wl_state_r;
         case (wl_state_r)
           
           WL_IDLE: begin
              inv_dqs_wl <= #TCQ {DQS_WIDTH{1'b0}};
              wrlvl_rank_done_r <= #TCQ 1'd0;
              if(!wr_level_done_r & wr_level_start_r & wl_sm_start)
                wl_state_r <= #TCQ WL_INIT;
           end

           WL_INIT: begin
              wl_edge_detect_valid_r <= #TCQ 1'b0;
              wrlvl_rank_done_r      <= #TCQ 1'd0;
              if(wl_sm_start)
                 wl_state_r <= #TCQ WL_EDGE_CHECK; //WL_DEL_INC;
           end

           WL_DEL_INC: begin // Inc DQS ODELAY tap 
              wl_state_r <= #TCQ WL_WAIT;
              wl_edge_detect_valid_r <= #TCQ 1'b0;
              wl_tap_count_r <= #TCQ wl_tap_count_r + 1'b1;
           end

           WL_WAIT: begin
              if (wl_sm_start)
              wl_state_r <= #TCQ WL_WAIT_DQ;
           end
           WL_WAIT_DQ: begin
              if (wl_sm_start)
                wl_state_r <= #TCQ WL_EDGE_CHECK;
           end
           
           WL_EDGE_CHECK: begin // Look for the edge
              if (wl_edge_detect_valid_r == 1'b0) begin
                wl_state_r <= #TCQ WL_WAIT;
                wl_edge_detect_valid_r <= #TCQ 1'b1;
              end
              // 0->1 transition detected with non-inv DQS
              // Minimum of 8 taps between DQS and DQ when
              // SHIFT_TBY4_TAP > 10
              else if(rd_data_edge_detect_r[dqs_count_r] &&
                 ((wl_tap_count_r >= SHIFT_TBY4_TAP) || 
                 ((wl_tap_count_r > 5'd7) && (SHIFT_TBY4_TAP>10))) && 
                 wl_edge_detect_valid_r)
                begin
                   wl_state_r <= #TCQ WL_DQS_CNT;
                   inv_dqs_wl[dqs_count_r] <= #TCQ 1'b0;
                   wl_tap_count_r <= #TCQ wl_tap_count_r;
                   if (wl_tap_count_r < SHIFT_TBY4_TAP)
                     dq_tap_wl[dqs_count_r] <= #TCQ 5'd0;
                   else
                     dq_tap_wl[dqs_count_r] 
                      <= #TCQ wl_tap_count_r - SHIFT_TBY4_TAP;
                 end
                // 0->1 transition detected with inv DQS
                // Minimum of 8 taps between DQS and DQ when
                // SHIFT_TBY4_TAP > 10
              else if (rd_data_inv_edge_detect_r[dqs_count_r] &&
                 ((wl_tap_count_r >= SHIFT_TBY4_TAP) || 
                 ((wl_tap_count_r > 5'd7) && (SHIFT_TBY4_TAP>10))) && 
                 wl_edge_detect_valid_r)
                begin
                   wl_state_r <= #TCQ WL_DQS_CNT;
                   inv_dqs_wl[dqs_count_r] <= #TCQ 1'b1;
                   wl_tap_count_r <= #TCQ wl_tap_count_r;
                   if (wl_tap_count_r < SHIFT_TBY4_TAP)
                     dq_tap_wl[dqs_count_r] <= #TCQ 5'd0;
                   else
                     dq_tap_wl[dqs_count_r] 
                      <= #TCQ wl_tap_count_r - SHIFT_TBY4_TAP;
                 end
              else if (wl_tap_count_r > 5'd30)
                wrlvl_err <= #TCQ 1'b1;
              else
                wl_state_r <= #TCQ WL_INV_DQS;
         end
      WL_INV_DQS: begin
              inv_dqs_wl[dqs_count_r] <= #TCQ ~inv_dqs_wl[dqs_count_r];
              wl_edge_detect_valid_r  <= #TCQ 1'b0;
              if (inv_dqs_wl[dqs_count_r] == 1'b1)
                wl_state_r <= #TCQ WL_DEL_INC;
              else begin
                wl_state_r <= #TCQ WL_WAIT;
              end
           end

      WL_DQS_CNT: begin
              if (dqs_count_r == (DQS_WIDTH-1)) begin
                dqs_count_r <= #TCQ dqs_count_r;
                dq_cnt_inc  <= #TCQ 1'b0;
              end else begin
                dqs_count_r <= #TCQ dqs_count_r + 1'b1;
                dq_cnt_inc  <= #TCQ 1'b1;
              end
              wl_tap_count_r <= #TCQ 5'b0;
              wl_state_r <= #TCQ WL_DQS_CHECK;
              wl_edge_detect_valid_r <= #TCQ 1'b0;
             end
           
           WL_DQS_CHECK: begin // check if all DQS have been calibrated
              if (dq_cnt_inc == 1'b0)begin
                wrlvl_rank_done_r <= #TCQ 1'd1;
                wl_state_r <= #TCQ WL_IDLE;
                if (rank_cnt_r == calib_width -1) begin
                  wr_level_done_r <= #TCQ 1'd1;
                  rank_cnt_r <= #TCQ 2'b00;
                end else begin
                  wr_level_done_r <= #TCQ 1'd0;
                  rank_cnt_r <= #TCQ rank_cnt_r + 1'b1;
                  dqs_count_r <= #TCQ 5'd0;
                end
              end else
                wl_state_r <= #TCQ WL_INIT;
           end
        endcase
     end
   end // always @ (posedge clk)
   
// Write calibration during/after stage 2 read leveling

  //synthesis translate_off
  always @(posedge rdlvl_error) begin
    if (!rst && rdlvl_error && !rdlvl_error_r &&
       (wr_calib_dly_r[2*rdlvl_err_byte_r+0] == 1'b1) &&
       (wr_calib_dly_r[2*rdlvl_err_byte_r+1] == 1'b1))
      $display ("PHY_WRLVL: Write Calibration Error at %t", $time);
  end
  //synthesis translate_on


  always @ (posedge clk) begin
    rdlvl_err_byte_r <= #TCQ rdlvl_err_byte;
  end

  always @(posedge clk) begin
      if (rst) begin
         rdlvl_error_r  <= #TCQ 1'b0;  
         rdlvl_error_r1 <= #TCQ 1'b0;
         rdlvl_resume   <= #TCQ 1'b0;
         rdlvl_resume_r <= #TCQ 1'b0;
         rdlvl_resume_r1<= #TCQ 1'b0;
         rdlvl_resume_r2<= #TCQ 1'b0;
      end else begin
         rdlvl_error_r  <= #TCQ rdlvl_error;
         rdlvl_error_r1 <= #TCQ rdlvl_error_r;
         rdlvl_resume_r <= #TCQ rdlvl_error_r & ~rdlvl_error_r1;
         rdlvl_resume_r1<= #TCQ rdlvl_resume_r;
         rdlvl_resume_r2<= #TCQ rdlvl_resume_r1;
         rdlvl_resume   <= #TCQ (rdlvl_resume_r | rdlvl_resume_r1
                                 | rdlvl_resume_r2);
         
      end
  end

  always @(posedge clk) begin
      if (rst) begin
         wrcal_err      <= #TCQ 1'b0;
      end else if (rdlvl_error && !rdlvl_error_r &&
      (wr_calib_dly_r[2*rdlvl_err_byte_r+0] == 1'b1) && 
      (wr_calib_dly_r[2*rdlvl_err_byte_r+1] == 1'b1)) begin
         wrcal_err      <= #TCQ 1'b1;
      end else begin
         wrcal_err      <= #TCQ wrcal_err;
      end
  end

// wr_calib_dly only increments from 0 to a max value of 3
// Write bitslip logic only supports upto 3 clk_mem cycles
  always @(posedge clk) begin
      if (rst) begin
         wr_calib_dly_r  <= #TCQ {2*DQS_WIDTH{1'b0}};
      end else if (rdlvl_error && !rdlvl_error_r) begin
         if (set_two_flag[rdlvl_err_byte_r]) begin
           wr_calib_dly_r[2*rdlvl_err_byte_r+0] <= #TCQ 1'b1;
           wr_calib_dly_r[2*rdlvl_err_byte_r+1] <= #TCQ 1'b1;
         end else if (set_one_flag[rdlvl_err_byte_r]) begin
           wr_calib_dly_r[2*rdlvl_err_byte_r+0] <= #TCQ 1'b0;
           wr_calib_dly_r[2*rdlvl_err_byte_r+1] <= #TCQ 1'b1;
         end else begin
           wr_calib_dly_r[2*rdlvl_err_byte_r+0] <= #TCQ 1'b1;
           wr_calib_dly_r[2*rdlvl_err_byte_r+1] <= #TCQ 1'b0;
         end
      end
  end

// set_one_flag determines if wr_calib_dly_r must be incremented to '2'
   generate
     genvar wcal_i;
       for(wcal_i = 0; wcal_i < DQS_WIDTH; wcal_i = wcal_i +1) begin: gen_wcal_set_one
          always @(posedge clk) begin
            if (rst)
              set_one_flag[wcal_i]  <= #TCQ 1'b0;
            else if (!set_one_flag[wcal_i] && rdlvl_error_r &&
                    ~rdlvl_error_r1 && (rdlvl_err_byte_r == wcal_i))
              set_one_flag[wcal_i] <= #TCQ 1'b1;
          end
       end
   endgenerate

// set_two_flag determines if wr_calib_dly_r must be incremented to '3'
   generate
   genvar two_i;
     for(two_i = 0; two_i < DQS_WIDTH; two_i = two_i +1) begin: gen_wcal_set_two
       always @(posedge clk) begin
         if (rst)
              set_two_flag[two_i]  <= #TCQ 1'b0;
         else if (set_one_flag[two_i] && rdlvl_error_r &&
             ~rdlvl_error_r1 && (rdlvl_err_byte_r == two_i))
           set_two_flag[two_i] <= #TCQ 1'b1;
       end
     end
   endgenerate
                                                          

endmodule
              
                 
                
   
     

   
