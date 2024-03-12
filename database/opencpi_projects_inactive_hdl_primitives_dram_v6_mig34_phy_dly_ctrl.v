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
//  /   /         Filename: phy_dly_ctrl.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:33 $
// \   \  /  \    Date Created: Mon Jun 30 2008
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Multiplexing for all DQ/DQS/Capture and resynchronization clock
//  IODELAY elements
//  Scope of this module:
//    IODELAYs controlled:
//      1. DQ (rdlvl/writes)
//      2. DQS (wrlvl/phase detector)
//      3. Capture clock (rdlvl/phase detector)
//      4. Resync clock (rdlvl/phase detector)
//    Functions performed:
//      1. Synchronization (from GCLK to BUFR domain)
//      2. Multi-rank IODELAY lookup (NOT YET SUPPORTED)
//    NOTES:
//      1. Per-bit DQ control not yet supported
//      2. Multi-rank control not yet supported
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_dly_ctrl.v,v 1.3 2010/02/26 08:58:33 pboya Exp $
**$Date: 2010/02/26 08:58:33 $
**$Author: pboya $
**$Revision: 1.3 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_dly_ctrl.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_dly_ctrl #
  (
   parameter TCQ            = 100,    // clk->out delay (sim only)
   parameter DQ_WIDTH       = 64,     // # of DQ (data)
   parameter DQS_CNT_WIDTH  = 3,      // = ceil(log2(DQ_WIDTH))
   parameter DQS_WIDTH      = 8,      // # of DQS (strobe)
   parameter RANK_WIDTH     = 1,      // # of ranks of DRAM
   parameter nCWL           = 5,      // Write CAS latency (in clk cyc)
   parameter WRLVL          = "ON",   // Enable write leveling
   parameter PHASE_DETECT   = "ON",   // Enable read phase detector
   parameter DRAM_TYPE      = "DDR3",  // Memory I/F type: "DDR3", "DDR2"
   parameter nDQS_COL0      = 4,      // # DQS groups in I/O column #1
   parameter nDQS_COL1      = 4,      // # DQS groups in I/O column #2
   parameter nDQS_COL2      = 0,      // # DQS groups in I/O column #3
   parameter nDQS_COL3      = 0,      // # DQS groups in I/O column #4
   parameter DQS_LOC_COL0   = 32'h03020100, // DQS grps in col #1
   parameter DQS_LOC_COL1   = 32'h07060504, // DQS grps in col #2
   parameter DQS_LOC_COL2   = 0,            // DQS grps in col #3
   parameter DQS_LOC_COL3   = 0,            // DQS grps in col #4
   parameter DEBUG_PORT     = "OFF"   // Enable debug port
   )
  (
   input                        clk,
   input                        rst,
   input [3:0]                  clk_rsync,
   input [3:0]                  rst_rsync,
   // Operation status, control signals
   input                        wrlvl_done,
   input [1:0]                  rdlvl_done,
   input                        pd_cal_done,
   input                        mc_data_sel,
   input [RANK_WIDTH:0]         mc_ioconfig,
   input                        mc_ioconfig_en,
   input [0:0]                  phy_ioconfig,
   input                        phy_ioconfig_en,
   input                        dqs_oe,
   // DQ, DQS IODELAY controls for write leveling
   input [5*DQS_WIDTH-1:0]      dlyval_wrlvl_dqs,
   input [5*DQS_WIDTH-1:0]      dlyval_wrlvl_dq,
   // Capture Clock / Resync Clock IODELAY controls for read leveling
   input [DQS_WIDTH-1:0]        dlyce_rdlvl_cpt,
   input                        dlyinc_rdlvl_cpt,
   input [3:0]                  dlyce_rdlvl_rsync,
   input                        dlyinc_rdlvl_rsync,
   input [5*DQS_WIDTH-1:0]      dlyval_rdlvl_dq,
   input [5*DQS_WIDTH-1:0]      dlyval_rdlvl_dqs,
   // Phase detector IODELAY control for DQS, Capture Clock
   input [DQS_WIDTH-1:0]        dlyce_pd_cpt,
   input [DQS_WIDTH-1:0]        dlyinc_pd_cpt,
   input [5*DQS_WIDTH-1:0]      dlyval_pd_dqs,
   // IODELAY controls
   output reg [5*DQS_WIDTH-1:0] dlyval_dqs,
   output reg [5*DQS_WIDTH-1:0] dlyval_dq,
   output                       dlyrst_cpt,
   output [DQS_WIDTH-1:0]       dlyce_cpt,
   output [DQS_WIDTH-1:0]       dlyinc_cpt,
   output                       dlyrst_rsync,
   output [3:0]                 dlyce_rsync,
   output [3:0]                 dlyinc_rsync,
   // Debug Port
   input                        dbg_pd_off
   );

  // Ensure nonzero width for certain buses to prevent syntax errors
  // during compile in the event they are not used (e.g. buses that have to
  // do with column #2 in a single column design never get used, although
  // those buses still will get declared)
  localparam COL1_VECT_WIDTH = (nDQS_COL1 > 0) ? nDQS_COL1 : 1;
  localparam COL2_VECT_WIDTH = (nDQS_COL2 > 0) ? nDQS_COL2 : 1;
  localparam COL3_VECT_WIDTH = (nDQS_COL3 > 0) ? nDQS_COL3 : 1;

  reg [DQS_WIDTH-1:0]        dlyce_cpt_mux;
  reg [3:0]                  dlyce_rsync_mux;
  reg [DQS_WIDTH-1:0]        dlyinc_cpt_mux;
  reg [3:0]                  dlyinc_rsync_mux;
  reg                        dqs_oe_r;
  reg                        dqs_wr;
  wire [0:0]                 mux_ioconfig;
  wire                       mux_ioconfig_en;
  wire                       mux_rd_wr;
  reg                        mux_rd_wr_last_r;
  reg                        rd_wr_r;
  reg [3:0]                  rd_wr_rsync_r;
  reg [3:0]                  rd_wr_rsync_tmp_r;
  reg [3:0]                  rd_wr_rsync_tmp_r1;

  //***************************************************************************
  // IODELAY RESET CONTROL:
  // RST for IODELAY is used to control parallel loading of IODELAY (dlyval)
  // For all IODELAYs where glitching of outputs is permitted, always assert
  // RST (i.e. control logic can change outputs without worrying about
  // synchronization of control bits causing output glitching). For all other
  // IODELAYs (CPT, RSYNC), only assert RST when DLYVAL is stable
  //***************************************************************************

  assign dlyrst_cpt   = rst;
  assign dlyrst_rsync = rst;

  //***************************************************************************
  // IODELAY MUX CONTROL LOGIC AND CLOCK SYNCHRONIZATION
  // This logic determines the main MUX control logic for selecting what gets
  // fed to the IODELAY taps. Output signal is MUX_IOCFG = [0 for write, 1 for
  // read]. This logic is in the CLK domain, and needs to be synchronized to
  // each of the individual CLK_RSYNC[x] domains
  //***************************************************************************

  // Select between either MC or PHY control
  assign mux_ioconfig    = (mc_data_sel) ?
                           mc_ioconfig[RANK_WIDTH] :
                           phy_ioconfig;
  assign mux_ioconfig_en = (mc_data_sel) ?
                           mc_ioconfig_en :
                           phy_ioconfig_en;

  assign mux_rd_wr = mux_ioconfig[0];

  always @(posedge clk)
    dqs_oe_r <= #TCQ dqs_oe;

  // Generate indication when write is occurring - necessary to prevent
  // situation where a read request comes in on DFI before the current
  // write has been completed on the DDR bus - in that case, the IODELAY
  // value should remain at the write value until the write is completed
  // on the DDR bus. 
  always @(dqs_oe or mux_rd_wr_last_r)
    dqs_wr = mux_rd_wr_last_r | dqs_oe;
 
  // Store value of MUX_IOCONFIG when enable(latch) signal asserted
  always @(posedge clk)
    if (mux_ioconfig_en)
      mux_rd_wr_last_r <= #TCQ mux_rd_wr;

  // New value of MUX_IOCONFIG gets reflected right away as soon as
  // enable/latch signal is asserted. This signal indicates whether a
  // write or read is occurring (1 = write, 0 = read). Add dependence on
  // DQS_WR to account for pipelining - prevent read value from being
  // loaded until previous write is finished
  always @(posedge clk) begin
    if (mux_ioconfig_en) begin
      if ((dqs_wr)&& (DRAM_TYPE == "DDR3"))
        rd_wr_r <= #TCQ 1'b1;
      else
        rd_wr_r <= #TCQ mux_rd_wr;
    end else begin
      if ((dqs_wr)&& (DRAM_TYPE == "DDR3"))
        rd_wr_r <= #TCQ 1'b1;
      else
        rd_wr_r <= #TCQ mux_rd_wr;
    end
  end

  // Synchronize MUX control to each of the individual clock domains
  genvar r_i;
  generate
    for (r_i = 0; r_i < 4; r_i = r_i + 1) begin: gen_sync_rd_wr
      if (DRAM_TYPE == "DDR2") begin :  gen_cwl_ddr2
         if(nCWL <= 3) begin: gen_cwl_ddr2_ls_4
           // one less pipeline stage for cwl<= 3 
           always @(posedge clk_rsync[r_i]) begin
             rd_wr_rsync_tmp_r[r_i] <= #TCQ rd_wr_r;
             rd_wr_rsync_r[r_i]     <= #TCQ rd_wr_rsync_tmp_r[r_i];      
           end
         end else begin  
           always @(posedge clk_rsync[r_i]) begin:gen_cwl_ddr2_gt_3
             rd_wr_rsync_tmp_r[r_i] <= #TCQ rd_wr_r;
             rd_wr_rsync_tmp_r1[r_i] <= #TCQ rd_wr_rsync_tmp_r[r_i];
             rd_wr_rsync_r[r_i]     <= #TCQ rd_wr_rsync_tmp_r1[r_i];     
           end
         end 
      end else if (nCWL == 5) begin: gen_cwl_5_ddr3
        // For CWL = 5, bypass one of the pipeline registers for speed
        // purposes (need to load IODELAY value as soon as possible on write,
        // time between IOCONFIG_EN and OSERDES.WC assertion is shorter than
        // for all other CWL values. Rely on built in registers in IODELAY to
        // reduce metastability? 
        always @(posedge clk_rsync[r_i])
          rd_wr_rsync_r[r_i] <= #TCQ rd_wr_r;
      end else begin: gen_cwl_gt_5_ddr3
        // Otherwise, use two pipeline stages in CLK_RSYNC domain to
        // reduce metastability
        always @(posedge clk_rsync[r_i]) begin
          rd_wr_rsync_tmp_r[r_i] <= #TCQ rd_wr_r;
          rd_wr_rsync_r[r_i]     <= #TCQ rd_wr_rsync_tmp_r[r_i];
        end
      end
    end
  endgenerate

  //***************************************************************************
  // IODELAY CE/INC MUX LOGIC
  // Increment/Enable MUX logic for Capture and Resynchronization clocks.
  // No synchronization of these signals to another clock domain is
  // required - the capture and resync clock IODELAY control ports are
  // clocked by CLK
  //***************************************************************************

  always @(posedge clk) begin
    if (!rdlvl_done[1]) begin
      // If read leveling not completed, rdlvl logic has control of capture
      // and resync clock adjustment IODELAYs
      dlyce_cpt_mux        <= #TCQ dlyce_rdlvl_cpt;
      dlyinc_cpt_mux       <= #TCQ {DQS_WIDTH{dlyinc_rdlvl_cpt}};
      dlyce_rsync_mux      <= #TCQ dlyce_rdlvl_rsync;
      dlyinc_rsync_mux     <= #TCQ {4{dlyinc_rdlvl_rsync}};
    end else begin
      if ((PHASE_DETECT == "OFF") || 
          ((DEBUG_PORT == "ON") && dbg_pd_off)) begin
        // If read phase detector is off, give control of CPT/RSYNC IODELAY
        // taps to the read leveling logic. Normally the read leveling logic
        // will not be changing the IODELAY values after initial calibration.
        // However, the debug port interface for changing the CPT/RSYNC
        // tap values does go through the PHY_RDLVL module - if the user
        // has this capability enabled, then that module will change the
        // IODELAY tap values. Note that use of the debug interface to change
        // the CPT/RSYNC tap values is limiting to changing the tap values
        // only when the read phase detector is turned off - otherwise, if
        // the read phase detector is on, it will simply "undo" any changes
        // to the tap count made via the debug port interface
        dlyce_cpt_mux        <= #TCQ dlyce_rdlvl_cpt;
        dlyinc_cpt_mux       <= #TCQ {DQS_WIDTH{dlyinc_rdlvl_cpt}};
        dlyce_rsync_mux      <= #TCQ dlyce_rdlvl_rsync;
        dlyinc_rsync_mux     <= #TCQ {4{dlyinc_rdlvl_rsync}};
      end else begin
        // Else read phase detector has control of capture/rsync phases
        dlyce_cpt_mux    <= #TCQ dlyce_pd_cpt;
        dlyinc_cpt_mux   <= #TCQ dlyinc_pd_cpt;
        // Phase detector does not control RSYNC - rely on RSYNC positioning
        // to be able to handle entire possible range that phase detector can
        // vary the capture clock IODELAY taps. In the future, we may want to
        // change to allow phase detector to vary RSYNC taps, if there is
        // insufficient margin to allow for a "static" scheme
        dlyce_rsync_mux  <= #TCQ 'b0;
        dlyinc_rsync_mux <= #TCQ 'b0;
        // COMMENTED - RSYNC clock is fixed
        // dlyce_rsync_mux  <= #TCQ {4{dlyce_pd_cpt[0]}};
        // dlyinc_rsync_mux <= #TCQ {4{dlyinc_pd_cpt}};
      end
    end
  end

  assign dlyce_cpt     = dlyce_cpt_mux;
  assign dlyinc_cpt    = dlyinc_cpt_mux;
  assign dlyce_rsync   = dlyce_rsync_mux;
  assign dlyinc_rsync  = dlyinc_rsync_mux;

  //***************************************************************************
  // SYNCHRONIZATION FOR CLK <-> CLK_RSYNC[X] DOMAINS
  //***************************************************************************

  //***************************************************************************
  // BIT STEERING EQUATIONS:
  // What follows are 4 generate loops - each of which handles "bit
  // steering" for each of the I/O columns. The first loop is always
  // instantited. The other 3 will only be instantiated depending on the
  // number of I/O columns used
  //***************************************************************************

  generate
    genvar c0_i;
    for (c0_i = 0; c0_i < nDQS_COL0; c0_i = c0_i + 1) begin: gen_loop_c0

      //*****************************************************************
      // DQ/DQS DLYVAL MUX LOGIC
      // This is the MUX logic to control the parallel load delay values for
      // DQ and DQS IODELAYs. There are up to 4 MUX's, one for each
      // CLK_RSYNC[x] clock domain. Each MUX can handle a variable amount
      // of DQ/DQS IODELAYs depending on the particular user pin assignment
      // (e.g. how many I/O columns are used, and the particular DQS groups
      // assigned to each I/O column). The MUX select (S), and input lines
      // (A,B) are configured:
      //   S: MUX_IO_CFG_RSYNC[x]
      //   A: value of DQ/DQS IODELAY from write leveling logic
      //   B: value of DQ/DQS IODELAY from read phase detector logic (DQS) or
      //      from read leveling logic (DQ). NOTE: The value of DQS may also
      //      depend on the read leveling logic with per-bit deskew support.
      //      This may require another level of MUX prior to this MUX
      // The parallel signals from the 3 possible sources (wrlvl, rdlvl, read
      // phase detector) are not synchronized to CLK_RSYNC< but also are not
      // timing critical - i.e. the IODELAY output can glitch briefly.
      // Therefore, there is no need to synchronize any of these sources
      // prior to the MUX (although a MAXDELAY constraint to ensure these
      // async paths aren't too long - they should be less than ~2 clock
      // cycles) should be added
      //*****************************************************************

      always @ (posedge clk_rsync[0]) begin
        if (rd_wr_rsync_r[0]) begin
          // Load write IODELAY values
          dlyval_dqs[5*(DQS_LOC_COL0[8*c0_i+:8])+:5]
            <= #TCQ dlyval_wrlvl_dqs[5*(DQS_LOC_COL0[8*c0_i+:8])+:5];
          // Write DQ IODELAY values are byte-wide only
          dlyval_dq[5*(DQS_LOC_COL0[8*c0_i+:8])+:5]
            <= #TCQ dlyval_wrlvl_dq[5*(DQS_LOC_COL0[8*c0_i+:8])+:5];
        end else begin
          // Load read IODELAY values
          if ((PHASE_DETECT == "ON") && rdlvl_done[1]) begin 
            // Phase Detector has control
            dlyval_dqs[5*(DQS_LOC_COL0[8*c0_i+:8])+:5]
              <= #TCQ dlyval_pd_dqs[5*(DQS_LOC_COL0[8*c0_i+:8])+:5];
          end else begin 
            // Read Leveling logic has control of DQS (used only if IODELAY
            // taps are required for either per-bit or low freq calibration)
            dlyval_dqs[5*(DQS_LOC_COL0[8*c0_i+:8])+:5]
              <= #TCQ dlyval_rdlvl_dqs[5*(DQS_LOC_COL0[8*c0_i+:8])+:5];
          end     
             
          dlyval_dq[5*(DQS_LOC_COL0[8*c0_i+:8])+:5]
            <= #TCQ dlyval_rdlvl_dq[5*(DQS_LOC_COL0[8*c0_i+:8])+:5];
        end
      end
    end
  endgenerate

  //*****************************************************************
  // The next 3 cases are for the other 3 banks. Conditionally include
  // only if multiple banks are supported. There's probably a better
  // way of instantiating these 3 other cases without taking up so much
  // space....
  //*****************************************************************

  // I/O COLUMN #2
  generate
    genvar c1_i;
    if (nDQS_COL1 > 0) begin: gen_c1
      for (c1_i = 0; c1_i < nDQS_COL1; c1_i = c1_i + 1) begin: gen_loop_c1
        always @(posedge clk_rsync[1]) begin
          if (rd_wr_rsync_r[1]) begin
            dlyval_dqs[5*(DQS_LOC_COL1[8*c1_i+7-:8])+:5]
              <= #TCQ dlyval_wrlvl_dqs[5*(DQS_LOC_COL1[8*c1_i+7-:8])+:5];
            dlyval_dq[5*(DQS_LOC_COL1[8*c1_i+7-:8])+:5]
              <= #TCQ dlyval_wrlvl_dq[5*(DQS_LOC_COL1[8*c1_i+:8])+:5];
          end else begin
            if ((PHASE_DETECT == "ON") && rdlvl_done[1]) begin 
              // Phase Detector has control
              dlyval_dqs[5*(DQS_LOC_COL1[8*c1_i+:8])+:5]
                <= #TCQ dlyval_pd_dqs[5*(DQS_LOC_COL1[8*c1_i+:8])+:5];
            end else begin
              // Read Leveling logic has control of DQS (used only if IODELAY
              // taps are required for either per-bit or low freq calibration)
              dlyval_dqs[5*(DQS_LOC_COL1[8*c1_i+:8])+:5]
                <= #TCQ dlyval_rdlvl_dqs[5*(DQS_LOC_COL1[8*c1_i+:8])+:5];
            end                
            dlyval_dq[5*(DQS_LOC_COL1[8*c1_i+:8])+:5]
              <= #TCQ dlyval_rdlvl_dq[5*(DQS_LOC_COL1[8*c1_i+:8])+:5];
          end
        end
      end
    end
  endgenerate

  // I/O COLUMN #3
  generate
    genvar c2_i;
    if (nDQS_COL2 > 0) begin: gen_c2
      for (c2_i = 0; c2_i < nDQS_COL2; c2_i = c2_i + 1) begin: gen_loop_c2
        always @(posedge clk_rsync[2]) begin
          if (rd_wr_rsync_r[2]) begin
            dlyval_dqs[5*(DQS_LOC_COL2[8*c2_i+7-:8])+:5]
              <= #TCQ dlyval_wrlvl_dqs[5*(DQS_LOC_COL2[8*c2_i+7-:8])+:5];
            dlyval_dq[5*(DQS_LOC_COL2[8*c2_i+7-:8])+:5]
              <= #TCQ dlyval_wrlvl_dq[5*(DQS_LOC_COL2[8*c2_i+:8])+:5];
          end else begin
            if ((PHASE_DETECT == "ON") && rdlvl_done[1]) begin 
              // Phase Detector has control
              dlyval_dqs[5*(DQS_LOC_COL2[8*c2_i+:8])+:5]
                <= #TCQ dlyval_pd_dqs[5*(DQS_LOC_COL2[8*c2_i+:8])+:5];
            end else begin
              // Read Leveling logic has control of DQS (used only if IODELAY
              // taps are required for either per-bit or low freq calibration)
              dlyval_dqs[5*(DQS_LOC_COL2[8*c2_i+:8])+:5]
                <= #TCQ dlyval_rdlvl_dqs[5*(DQS_LOC_COL2[8*c2_i+:8])+:5];
            end                
            dlyval_dq[5*(DQS_LOC_COL2[8*c2_i+:8])+:5]
              <= #TCQ dlyval_rdlvl_dq[5*(DQS_LOC_COL2[8*c2_i+:8])+:5];
          end
        end
      end
    end
  endgenerate

  // I/O COLUMN #4
  generate
    genvar c3_i;
    if (nDQS_COL3 > 0) begin: gen_c3
      for (c3_i = 0; c3_i < nDQS_COL3; c3_i = c3_i + 1) begin: gen_loop_c3
        always @(posedge clk_rsync[3]) begin
          if (rd_wr_rsync_r[3]) begin
            dlyval_dqs[5*(DQS_LOC_COL3[8*c3_i+7-:8])+:5]
              <= #TCQ dlyval_wrlvl_dqs[5*(DQS_LOC_COL3[8*c3_i+7-:8])+:5];
            dlyval_dq[5*(DQS_LOC_COL3[8*c3_i+7-:8])+:5]
              <= #TCQ dlyval_wrlvl_dq[5*(DQS_LOC_COL3[8*c3_i+:8])+:5];
          end else begin
            if ((PHASE_DETECT == "ON") && rdlvl_done[1]) begin
              // Phase Detector has control
              dlyval_dqs[5*(DQS_LOC_COL3[8*c3_i+:8])+:5]
                <= #TCQ dlyval_pd_dqs[5*(DQS_LOC_COL3[8*c3_i+:8])+:5];
            end else begin
              // Read Leveling logic has control of DQS (used only if IODELAY
              // taps are required for either per-bit or low freq calibration)
              dlyval_dqs[5*(DQS_LOC_COL3[8*c3_i+:8])+:5]
                <= #TCQ dlyval_rdlvl_dqs[5*(DQS_LOC_COL3[8*c3_i+:8])+:5];
            end                
            dlyval_dq[5*(DQS_LOC_COL3[8*c3_i+:8])+:5]
              <= #TCQ dlyval_rdlvl_dq[5*(DQS_LOC_COL3[8*c3_i+:8])+:5];
          end
        end
      end
    end
  endgenerate

endmodule
