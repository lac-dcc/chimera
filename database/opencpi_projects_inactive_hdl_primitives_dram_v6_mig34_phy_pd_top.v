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
//  /   /         Filename: phy_pd_top.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Top-level for all Phase Detector logic
//
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_pd_top.v,v 1.3 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.3 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_pd_top.v,v $
*****************************************************************************/

`timescale 1ps/1ps

module phy_pd_top #
  (
   parameter TCQ             = 100,        // clk->out delay (sim only)
   parameter DQS_CNT_WIDTH   = 3,          // = ceil(log2(DQS_WIDTH))
   parameter DQS_WIDTH       = 8,          // # of DQS (strobe),
   parameter PD_LHC_WIDTH    = 16,         // synth low & high cntr physical 
                                           // width
   parameter PD_CALIB_MODE   = "PARALLEL", // "PARALLEL" or "SEQUENTIAL"
   parameter PD_MSB_SEL      = 8,          // # of bits in PD response cntr
   parameter PD_DQS0_ONLY    = "ON",       // Enable use of DQS[0] only for
                                           // phase detector ("ON","OFF")
   parameter SIM_CAL_OPTION  = "NONE",     // "NONE" = full initial cal
                                           // "FAST_CAL" = cal w/ 1 DQS only
   parameter DEBUG_PORT      = "OFF"       // Enable debug port
   )
  (
   input                      clk,
   input                      rst,
   // Control/status
   input                      pd_cal_start,      // start PD initial cal
   output                     pd_cal_done,       // PD initial cal done
   input                      dfi_init_complete, // Core init sequence done
   input                      read_valid,        // Read data (DQS) valid
   // MMCM fine phase shift control
   output reg                 pd_PSEN,           // FPS port enable
   output reg                 pd_PSINCDEC,       // FPS increment/decrement
   // IODELAY control
   input  [5*DQS_WIDTH-1:0]   dlyval_rdlvl_dqs,  // dqs values before PD begins
   output [DQS_WIDTH-1:0]     dlyce_pd_cpt,      // capture clock select
   output [DQS_WIDTH-1:0]     dlyinc_pd_cpt,     // capture clock inc/dec
   output [5*DQS_WIDTH-1:0]   dlyval_pd_dqs,     // DQS PD parallel load
   // Input DQS
   input [DQS_WIDTH-1:0]      rd_dqs_rise0,
   input [DQS_WIDTH-1:0]      rd_dqs_fall0,
   input [DQS_WIDTH-1:0]      rd_dqs_rise1,
   input [DQS_WIDTH-1:0]      rd_dqs_fall1,
   // Refresh control
   output                     pd_prech_req,      // one clk period wide
   input                      prech_done,        // one clk period wide
   // Debug
   input                      dbg_pd_off,
   input                      dbg_pd_maintain_off,
   input                      dbg_pd_maintain_0_only,
   input                      dbg_pd_inc_cpt,
   input                      dbg_pd_dec_cpt,
   input                      dbg_pd_inc_dqs,
   input                      dbg_pd_dec_dqs,
   input                      dbg_pd_disab_hyst,
   input                      dbg_pd_disab_hyst_0,
   input  [3:0]               dbg_pd_msb_sel,
   input  [DQS_CNT_WIDTH-1:0] dbg_pd_byte_sel,
   input                      dbg_inc_rd_fps,
   input                      dbg_dec_rd_fps,
   output [255:0]             dbg_phy_pd
   );

  //***************************************************************************
  // Internal signals
  //***************************************************************************

  wire [99:0]          dbg_pd[DQS_WIDTH-1:0];
  wire [DQS_WIDTH-1:0] dec_cpt;
  wire [DQS_WIDTH-1:0] dec_dqs;
  wire [DQS_WIDTH-1:0] dlyce_pd_cpt_w;  
  wire [DQS_WIDTH-1:0] inc_cpt;
  wire [DQS_WIDTH-1:0] inc_dqs;
  wire [DQS_WIDTH-1:0] disable_hysteresis;
  wire [3:0]           early_dqs_data[DQS_WIDTH-1:0];
  wire [DQS_WIDTH-1:0] maintain_off;
  wire [3:0]           msb_sel[DQS_WIDTH-1:0];
  wire [DQS_WIDTH-1:0] pd_cal_done_byte;
  wire [DQS_WIDTH-1:0] pd_cal_start_byte;
  wire [DQS_WIDTH-1:0] pd_cal_start_pulse;
  reg [DQS_WIDTH-1:0]  pd_cal_start_r;
  wire                 pd_maintain_0_only;
  wire                 pd_off;  
  reg                  pd_prec_req_r;
  wire [DQS_WIDTH-1:0] pd_start_raw;
  reg                  prech_done_pl;
  reg                  reset;
  wire [1:0]           trip_points[DQS_WIDTH-1:0];

  //***************************************************************************
  // reset synchronization
  //***************************************************************************

  always @(posedge clk or posedge rst)
    if (rst) 
      reset <= #TCQ 1'b1;
    else     
      reset <= #TCQ 1'b0;

  //***************************************************************************
  // Debug
  //***************************************************************************

  // for now, route out only DQS 0 PD debug signals
  assign dbg_phy_pd[99:0]    = dbg_pd[0];  
  assign dbg_phy_pd[103:100] = early_dqs_data[0];
  assign dbg_phy_pd[104]     = pd_cal_start;
  assign dbg_phy_pd[105]     = pd_cal_done;
  assign dbg_phy_pd[106]     = read_valid;
  // signals to drive read MMCM phase shift cntr for debug
  assign dbg_phy_pd[107]     = pd_PSEN; 
  assign dbg_phy_pd[108]     = pd_PSINCDEC;
  // spare 
  assign dbg_phy_pd[255:109] = 'b0;          

  //***************************************************************************
  // Periodic capture clock calibration and maintenance. One instance for each
  // DQS group.
  //***************************************************************************

  assign disable_hysteresis 
    = (DEBUG_PORT == "ON") ? 
      {{DQS_WIDTH-1{dbg_pd_disab_hyst}},dbg_pd_disab_hyst_0} :
      {DQS_WIDTH{1'b0}};
  
  assign pd_off = (DEBUG_PORT == "ON") ? dbg_pd_off : 1'b0;

  // Note:  Calibration of the DQS groups can occur in parallel or
  // sequentially.
  generate 
    begin: gen_cal_mode
      if (PD_CALIB_MODE == "PARALLEL") begin 
        // parallel calibration
        assign pd_cal_done        = &pd_cal_done_byte;
        assign pd_cal_start_byte  = {DQS_WIDTH{pd_cal_start}};   
        assign pd_prech_req       = 1'b0; // not used for parallel calibration
        assign pd_start_raw       = 'b0; // not used for parallel calibration
        assign pd_cal_start_pulse = 'b0; // not used for parallel calibration
      end else begin 
        // sequential calibration  
        assign pd_cal_done       = pd_cal_done_byte[DQS_WIDTH-1];
        
        if (DQS_WIDTH == 1) begin
          assign pd_cal_start_byte[0] = pd_cal_start;
          assign pd_prech_req         = 1'b0; // no refresh if only one DQS
        end else begin 
          // DQS_WIDTH > 1
          assign pd_start_raw       = {pd_cal_done_byte[DQS_WIDTH-2:0],
                                       pd_cal_start};
          assign pd_prech_req       = pd_prec_req_r;
          assign pd_cal_start_pulse = pd_start_raw & ~pd_cal_start_r;
          assign pd_cal_start_byte  = pd_start_raw & 
                                      {DQS_WIDTH{prech_done_pl}};
          
          always @(posedge clk) begin
            if (reset) begin
              prech_done_pl  <= #TCQ 1'b0;
              pd_prec_req_r  <= #TCQ 1'b0;
              pd_cal_start_r <= #TCQ  'b0;
            end else begin
              prech_done_pl  <= #TCQ prech_done;
              pd_prec_req_r  <= #TCQ |pd_cal_start_pulse;
              pd_cal_start_r <= #TCQ  pd_start_raw;
            end
          end
        end
      end
    end
  endgenerate

  generate
    genvar dqs_i;
    
    if (PD_DQS0_ONLY == "ON") begin: dqs0_on
      assign pd_maintain_0_only = 1'b1;
    end else begin: dqs0_off
      assign pd_maintain_0_only 
        = (DEBUG_PORT == "ON") ? dbg_pd_maintain_0_only : 1'b0;
    end

    for (dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i+1) begin: gen_pd

      assign early_dqs_data[dqs_i] = {rd_dqs_fall1[dqs_i],
                                      rd_dqs_rise1[dqs_i],
                                      rd_dqs_fall0[dqs_i],
                                      rd_dqs_rise0[dqs_i]};      

      assign trip_points[dqs_i]    = {rd_dqs_rise1[dqs_i],
                                      rd_dqs_rise0[dqs_i]};

      assign inc_cpt[dqs_i] 
               = (DEBUG_PORT == "ON") ? 
                 dbg_pd_inc_cpt & (dbg_pd_byte_sel == dqs_i) : 1'b0;
      assign dec_cpt[dqs_i] 
               = (DEBUG_PORT == "ON") ? 
                 dbg_pd_dec_cpt & (dbg_pd_byte_sel == dqs_i) : 1'b0;
      assign inc_dqs[dqs_i] 
               = (DEBUG_PORT == "ON") ?  
                 dbg_pd_inc_dqs & (dbg_pd_byte_sel == dqs_i) : 1'b0;
      assign dec_dqs[dqs_i] 
               = (DEBUG_PORT == "ON") ? 
                 dbg_pd_dec_dqs & (dbg_pd_byte_sel == dqs_i) : 1'b0;

      // set MSB for counter: make byte 0 respond faster
      assign msb_sel[dqs_i]      
               = (dqs_i == 0) ? 
                 ((DEBUG_PORT == "ON") ? dbg_pd_msb_sel - 1 : PD_MSB_SEL-1) : 
                 ((DEBUG_PORT == "ON") ? dbg_pd_msb_sel : PD_MSB_SEL);

      assign maintain_off[dqs_i] 
               = (dqs_i == 0) ?
                 ((DEBUG_PORT == "ON") ? dbg_pd_maintain_off : 1'b0) :
                 ((DEBUG_PORT == "ON") ? 
                  dbg_pd_maintain_off | pd_maintain_0_only : 
                  pd_maintain_0_only);

      if ((PD_DQS0_ONLY == "OFF") || (dqs_i == 0)) begin: gen_pd_inst
        phy_pd #
          (
           .TCQ            (TCQ),
           .SIM_CAL_OPTION (SIM_CAL_OPTION),
           .PD_LHC_WIDTH   (PD_LHC_WIDTH) 
           )
          u_phy_pd
            (
             .dbg_pd             (dbg_pd[dqs_i]),              // output [99:0] debug signals
             .dqs_dly_val_in     (dlyval_rdlvl_dqs[5*(dqs_i+1)-1:5*dqs_i]),  // input
             .dqs_dly_val        (dlyval_pd_dqs[5*(dqs_i+1)-1:5*dqs_i]), // output reg [4:0]
             .pd_en_maintain     (dlyce_pd_cpt_w[dqs_i]),      // output maintenance enable
             .pd_incdec_maintain (dlyinc_pd_cpt[dqs_i]),       // output maintenance inc/dec
             .pd_cal_done        (pd_cal_done_byte[dqs_i]),    // output calibration done (level)
             .pd_cal_start       (pd_cal_start_byte[dqs_i]),   // input  calibration start (level)
             .dfi_init_complete  (dfi_init_complete),          // input
             .pd_read_valid      (read_valid),                 // input  advance cntrs only when true
             .trip_points        (trip_points[dqs_i]),         // input      
             .dbg_pd_off         (pd_off),                     // input
             .dbg_pd_maintain_off(maintain_off[dqs_i]),        // input
             .dbg_pd_inc_cpt     (inc_cpt[dqs_i]),             // input one clk period pulse
             .dbg_pd_dec_cpt     (dec_cpt[dqs_i]),             // input one clk period pulse
             .dbg_pd_inc_dqs     (inc_dqs[dqs_i]),             // input one clk period pulse
             .dbg_pd_dec_dqs     (dec_dqs[dqs_i]),             // input one clk period pulse
             .dbg_pd_disab_hyst  (disable_hysteresis[dqs_i]),  // input
             .dbg_pd_msb_sel     (msb_sel[dqs_i]),             // input  [3:0]
             .clk                (clk),                        // input  clkmem/2
             .rst                (rst)                         // input
             );
      end else begin: gen_pd_tie
        assign dbg_pd[dqs_i]                        = 'b0;
        assign dlyval_pd_dqs[5*(dqs_i+1)-1:5*dqs_i] = 'b0;
        assign dlyce_pd_cpt_w[dqs_i]                = 1'b0;
        assign dlyinc_pd_cpt[dqs_i]                 = 1'b0;
        assign pd_cal_done_byte[dqs_i]              = 1'b1;
      end
    end
  endgenerate

  //***************************************************************************
  // Separate ce controls for Calibration and the Phase Detector are needed for
  // byte 0, because the byte 0 Phase Detector controls the MMCM, rather than
  // the byte 0 cpt IODELAYE1.
  //***************************************************************************

  always @(posedge clk)
    if (rst)
      pd_PSEN <= #TCQ 1'b0;
    else begin
      if (dlyce_pd_cpt_w[0] || 
          ((DEBUG_PORT == "ON") && (dbg_inc_rd_fps || dbg_dec_rd_fps)))
        pd_PSEN <= #TCQ 1'b1;
      else
        pd_PSEN <= #TCQ 1'b0;
    end

  // Signals dbg_inc_rd_fps and dbg_dec_rd_fps directly control the read
  // MMCM Fine Phase Shift during debug. They should only be used when
  // read phase detector is disabled
  always @(posedge clk)
    if (rst) 
      pd_PSINCDEC <= #TCQ 1'b0;
    else begin 
      if ((DEBUG_PORT == "ON") && (dbg_inc_rd_fps || dbg_dec_rd_fps))
        pd_PSINCDEC <= #TCQ dbg_inc_rd_fps;
      else
        pd_PSINCDEC <= #TCQ dlyinc_pd_cpt[0];
    end

  //***************************************************************************
  // IODELAY for DQS[0] is not controlled via dlyce_cpt port (IODELAY value
  // is fixed). Rather the phase of capture clock for DQS[0] is controlled
  // via fine-phase shift port of MMCM that generates the performance clock
  // used as the "base" read clock (signal clk_rd_base)
  //***************************************************************************

  assign dlyce_pd_cpt[0] = 1'b0;
  generate
    if (DQS_WIDTH > 1) begin: gen_dlyce_pd_cpt_gt0
      assign dlyce_pd_cpt[DQS_WIDTH-1:1] = {dlyce_pd_cpt_w[DQS_WIDTH-1:1]}; 
    end
  endgenerate
      
endmodule
