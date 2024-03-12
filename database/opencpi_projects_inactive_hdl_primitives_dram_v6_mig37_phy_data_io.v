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
// \   \   \/     Version: 3.7
//  \   \         Application: MIG
//  /   /         Filename: phy_data_io.v
// /___/   /\     Date Last Modified: $Date: 2011/01/06 11:18:21 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Top-level for all data (DQ, DQS, DM) related IOB logic
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_data_io.v,v 1.1.26.1 2011/01/06 11:18:21 pboya Exp $
**$Date: 2011/01/06 11:18:21 $
**$Author: pboya $
**$Revision: 1.1.26.1 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/O/mig_v3_7/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_data_io.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_data_io #
  (
   parameter TCQ             = 100,     // clk->out delay (sim only)
   parameter nCK_PER_CLK     = 2,       // # of memory clocks per CLK
   parameter CLK_PERIOD      = 3000,    // Internal clock period (in ps)
   parameter DRAM_WIDTH      = 8,       // # of DQ per DQS
   parameter DM_WIDTH        = 9,       // # of DM (data mask)
   parameter DQ_WIDTH        = 72,      // # of DQ (data)
   parameter DQS_WIDTH       = 9,       // # of DQS (strobe)
   parameter DRAM_TYPE       = "DDR3",
   parameter nCWL            = 5,       // Write CAS latency (in clk cyc)
   parameter WRLVL           = "OFF",   // Enable write leveling
   parameter REFCLK_FREQ     = 300.0,   // IODELAY Reference Clock freq (MHz)
   parameter IBUF_LPWR_MODE  = "OFF",   // Input buffer low power mode
   parameter IODELAY_HP_MODE = "ON",    // IODELAY High Performance Mode
   parameter IODELAY_GRP     = "IODELAY_MIG",// May be assigned unique name
                                             // when mult IP cores in design
   parameter nDQS_COL0       = 4,       // # DQS groups in I/O column #1
   parameter nDQS_COL1       = 4,       // # DQS groups in I/O column #2
   parameter nDQS_COL2       = 0,       // # DQS groups in I/O column #3
   parameter nDQS_COL3       = 0,       // # DQS groups in I/O column #4
   parameter DQS_LOC_COL0    = 32'h03020100,          // DQS grps in col #1
   parameter DQS_LOC_COL1    = 32'h07060504,          // DQS grps in col #2
   parameter DQS_LOC_COL2    = 0,                     // DQS grps in col #3
   parameter DQS_LOC_COL3    = 0,                     // DQS grps in col #4
   parameter USE_DM_PORT     = 1       // DM instantation enable 
   )
  (
   input                     clk_mem,
   input                     clk,
   input [DQS_WIDTH-1:0]     clk_cpt,
   input [3:0]               clk_rsync,
   input                     rst,
   input [3:0]               rst_rsync,
   // IODELAY I/F
   input [5*DQS_WIDTH-1:0]   dlyval_dq,
   input [5*DQS_WIDTH-1:0]   dlyval_dqs,
   // Write datapath I/F
   input [DQS_WIDTH-1:0]     inv_dqs,
   input [2*DQS_WIDTH-1:0]   wr_calib_dly,
   input [4*DQS_WIDTH-1:0]   dqs_oe_n,
   input [4*DQS_WIDTH-1:0]   dq_oe_n,
   input [(DQS_WIDTH*4)-1:0] dqs_rst,
   input [DQS_WIDTH-1:0]     dm_ce,
   input [(DQ_WIDTH/8)-1:0]  mask_data_rise0,
   input [(DQ_WIDTH/8)-1:0]  mask_data_fall0,
   input [(DQ_WIDTH/8)-1:0]  mask_data_rise1,
   input [(DQ_WIDTH/8)-1:0]  mask_data_fall1,
   input [DQ_WIDTH-1:0]      wr_data_rise0,
   input [DQ_WIDTH-1:0]      wr_data_rise1,
   input [DQ_WIDTH-1:0]      wr_data_fall0,
   input [DQ_WIDTH-1:0]      wr_data_fall1,
   // Read datapath I/F
   input [2*DQS_WIDTH-1:0]   rd_bitslip_cnt,
   input [2*DQS_WIDTH-1:0]   rd_clkdly_cnt,
   input [DQS_WIDTH-1:0]     rd_clkdiv_inv,
   output [DQ_WIDTH-1:0]     rd_data_rise0,
   output [DQ_WIDTH-1:0]     rd_data_fall0,
   output [DQ_WIDTH-1:0]     rd_data_rise1,
   output [DQ_WIDTH-1:0]     rd_data_fall1,
   output [DQS_WIDTH-1:0]    rd_dqs_rise0,
   output [DQS_WIDTH-1:0]    rd_dqs_fall0,
   output [DQS_WIDTH-1:0]    rd_dqs_rise1,
   output [DQS_WIDTH-1:0]    rd_dqs_fall1,
   // DDR3 bus signals
   output [DM_WIDTH-1:0]     ddr_dm,
   inout [DQS_WIDTH-1:0]     ddr_dqs_p,
   inout [DQS_WIDTH-1:0]     ddr_dqs_n,
   inout [DQ_WIDTH-1:0]      ddr_dq,
   // Debug Port
   output [5*DQS_WIDTH-1:0]  dbg_dqs_tap_cnt,
   output [5*DQS_WIDTH-1:0]  dbg_dq_tap_cnt   
   );

  // ratio of # of physical DM outputs to bytes in data bus
  // may be different - e.g. if using x4 components
  localparam DM_TO_BYTE_RATIO = DM_WIDTH/(DQ_WIDTH/8);

  reg [DQS_WIDTH-1:0]   clk_rsync_dqs;
  wire [5*DQ_WIDTH-1:0] dq_tap_cnt;  
  reg [DQS_WIDTH-1:0]   rst_r /* synthesis syn_maxfan = 1 */;
  reg [DQS_WIDTH-1:0]   rst_rsync_dqs;

  // synthesis attribute max_fanout of rst_r is 1
  // XST attributes for local reset tree RST_R - prohibit equivalent 
  // register removal on RST_R to prevent "sharing" w/ other local reset trees
  // synthesis attribute shreg_extract of rst_r is "no";  
  // synthesis attribute equivalent_register_removal of rst_r is "no"
  
  //***************************************************************************
  // Steer correct CLK_RSYNC to each DQS/DQ/DM group - different DQS groups
  // can reside on different I/O columns - each I/O column will have its
  // own CLK_RSYNC
  // Also steer correct performance path clock to each DQS/DQ/DM group - 
  // different DQS groups can reside on different I/O columns - inner I/O
  // column I/Os will use clk_wr_i, other column I/O's will use clk_wr_o
  // By convention, inner columns use DQS_COL0 and DQS_COL1, and outer
  // columns use DQS_COL2 and DQS_COL3. 
  //***************************************************************************

  generate
    genvar c0_i;
    if (nDQS_COL0 > 0) begin: gen_c0    
    for (c0_i = 0; c0_i < nDQS_COL0; c0_i = c0_i + 1) begin: gen_loop_c0
      always @(clk_rsync[0])
        clk_rsync_dqs[DQS_LOC_COL0[8*c0_i+7-:8]] = clk_rsync[0];
      always @(rst_rsync[0])
        rst_rsync_dqs[DQS_LOC_COL0[8*c0_i+7-:8]] = rst_rsync[0];
    end
    end
  endgenerate

  generate
    genvar c1_i;
    if (nDQS_COL1 > 0) begin: gen_c1
      for (c1_i = 0; c1_i < nDQS_COL1; c1_i = c1_i + 1) begin: gen_loop_c1
        always @(clk_rsync[1])
          clk_rsync_dqs[DQS_LOC_COL1[8*c1_i+7-:8]] = clk_rsync[1];
        always @(rst_rsync[1])
          rst_rsync_dqs[DQS_LOC_COL1[8*c1_i+7-:8]] = rst_rsync[1];
      end
    end
  endgenerate

  generate
    genvar c2_i;
    if (nDQS_COL2 > 0) begin: gen_c2
      for (c2_i = 0; c2_i < nDQS_COL2; c2_i = c2_i + 1) begin: gen_loop_c2
        always @(clk_rsync[2])
          clk_rsync_dqs[DQS_LOC_COL2[8*c2_i+7-:8]] = clk_rsync[2];
        always @(rst_rsync[2])
          rst_rsync_dqs[DQS_LOC_COL2[8*c2_i+7-:8]] = rst_rsync[2];
      end
    end
  endgenerate

  generate
    genvar c3_i;
    if (nDQS_COL3 > 0) begin: gen_c3
      for (c3_i = 0; c3_i < nDQS_COL3; c3_i = c3_i + 1) begin: gen_loop_c3
        always @(clk_rsync[3])
          clk_rsync_dqs[DQS_LOC_COL3[8*c3_i+7-:8]] = clk_rsync[3];
        always @(rst_rsync[3])
          rst_rsync_dqs[DQS_LOC_COL3[8*c3_i+7-:8]] = rst_rsync[3];
      end
    end
  endgenerate

  //***************************************************************************
  // Reset pipelining - register reset signals to prevent large (and long)
  // fanouts during physical compilation of the design. Create one local reset
  // for every byte's worth of DQ/DM/DQS (this should be local since DQ/DM/DQS
  // are placed close together)
  //***************************************************************************

  always @(posedge clk)
    if (rst)
      rst_r <= #TCQ {DQS_WIDTH{1'b1}};
    else
      rst_r <= #TCQ 'b0;
  
  //***************************************************************************
  // DQS instances
  //***************************************************************************

  generate
    genvar dqs_i;
    for (dqs_i = 0; dqs_i < DQS_WIDTH; dqs_i = dqs_i+1) begin: gen_dqs
      reg rst_dqs_r /* synthesis syn_maxfan = 1 */
                    /* synthesis syn_preserve = 1 */
                    /* synthesis syn_srlstyle="noextractff_srl" */;
      // synthesis attribute max_fanout of rst_dqs_r is 1
      // synthesis attribute shreg_extract of rst_dqs_r is "no";  
      // synthesis attribute equivalent_register_removal of rst_dqs_r is "no"      
      always @(posedge clk)
        if (rst)
          rst_dqs_r <= #TCQ 1'b1;
        else
          rst_dqs_r <= #TCQ 'b0;

      phy_dqs_iob #
        (
         .DRAM_TYPE       (DRAM_TYPE),
         .REFCLK_FREQ     (REFCLK_FREQ),
         .IBUF_LPWR_MODE  (IBUF_LPWR_MODE),
         .IODELAY_HP_MODE (IODELAY_HP_MODE),
         .IODELAY_GRP     (IODELAY_GRP)
         )
        u_phy_dqs_iob
          (
           .clk_mem         (clk_mem),
           .clk             (clk),
           .clk_cpt         (clk_cpt[dqs_i]),
           .clk_rsync       (clk_rsync_dqs[dqs_i]),
           .rst             (rst_dqs_r),
           .rst_rsync       (rst_rsync_dqs[dqs_i]),
           .dlyval          (dlyval_dqs[5*dqs_i+:5]),
           .dqs_oe_n        (dqs_oe_n[4*dqs_i+:4]),
           .dqs_rst         (dqs_rst[4*dqs_i+:4]),
           .rd_bitslip_cnt  (rd_bitslip_cnt[2*dqs_i+:2]),
           .rd_clkdly_cnt   (rd_clkdly_cnt[2*dqs_i+:2]),
           .rd_clkdiv_inv   (rd_clkdiv_inv[dqs_i]),
           .rd_dqs_rise0    (rd_dqs_rise0[dqs_i]),
           .rd_dqs_fall0    (rd_dqs_fall0[dqs_i]),
           .rd_dqs_rise1    (rd_dqs_rise1[dqs_i]),
           .rd_dqs_fall1    (rd_dqs_fall1[dqs_i]),
           .ddr_dqs_p       (ddr_dqs_p[dqs_i]),
           .ddr_dqs_n       (ddr_dqs_n[dqs_i]),
           .dqs_tap_cnt     (dbg_dqs_tap_cnt[5*dqs_i+:5])
           );
    end
  endgenerate

  //***************************************************************************
  // DM instances
  //***************************************************************************

  generate
    genvar dm_i;
    if (USE_DM_PORT) begin: gen_dm_inst
      for (dm_i = 0; dm_i < DM_WIDTH; dm_i = dm_i+1) begin: gen_dm
        reg rst_dm_r /* synthesis syn_maxfan = 1 */
                     /* synthesis syn_preserve = 1 */
                     /* synthesis syn_srlstyle="noextractff_srl" */;
        // synthesis attribute max_fanout of rst_dm_r is 1
        // synthesis attribute shreg_extract of rst_dm_r is "no";  
        // synthesis attribute equivalent_register_removal of rst_dm_r is "no"
	always @(posedge clk)
          if (rst)
            rst_dm_r <= #TCQ 1'b1;
          else
            rst_dm_r <= #TCQ 'b0;

        phy_dm_iob #
          (
           .TCQ             (TCQ),
           .nCWL            (nCWL),
           .DRAM_TYPE       (DRAM_TYPE),
           .WRLVL           (WRLVL),
           .REFCLK_FREQ     (REFCLK_FREQ),
           .IODELAY_HP_MODE (IODELAY_HP_MODE),
           .IODELAY_GRP     (IODELAY_GRP)
           )
          u_phy_dm_iob
            (
             .clk_mem         (clk_mem),
             .clk             (clk),
             .clk_rsync       (clk_rsync_dqs[dm_i]),
             .rst             (rst_dm_r),
             .dlyval          (dlyval_dq[5*(dm_i)+:5]),
             .dm_ce           (dm_ce[dm_i]),
             .inv_dqs         (inv_dqs[dm_i]),
             .wr_calib_dly    (wr_calib_dly[2*(dm_i)+:2]),
             .mask_data_rise0 (mask_data_rise0[dm_i/DM_TO_BYTE_RATIO]),
             .mask_data_fall0 (mask_data_fall0[dm_i/DM_TO_BYTE_RATIO]),
             .mask_data_rise1 (mask_data_rise1[dm_i/DM_TO_BYTE_RATIO]),
             .mask_data_fall1 (mask_data_fall1[dm_i/DM_TO_BYTE_RATIO]),
             .ddr_dm          (ddr_dm[dm_i])
             );
      end 
    end 
  endgenerate

  //***************************************************************************
  // DQ IOB instances
  //***************************************************************************

  generate
    genvar dq_i;
    for (dq_i = 0; dq_i < DQ_WIDTH; dq_i = dq_i+1) begin: gen_dq
      reg rst_dq_r /* synthesis syn_maxfan = 1 */
                   /* synthesis syn_preserve = 1 */
                   /* synthesis syn_srlstyle="noextractff_srl" */;
      // synthesis attribute max_fanout of rst_dq_r is 1
      // synthesis attribute shreg_extract of rst_dq_r is "no";  
      // synthesis attribute equivalent_register_removal of rst_dq_r is "no"
      always @(posedge clk)
        if (rst)
          rst_dq_r <= #TCQ 1'b1;
        else
          rst_dq_r <= #TCQ 'b0;
   
      phy_dq_iob #
        (
         .TCQ             (TCQ),
         .nCWL            (nCWL),
         .DRAM_TYPE       (DRAM_TYPE),
         .WRLVL           (WRLVL),
         .REFCLK_FREQ     (REFCLK_FREQ),
         .IBUF_LPWR_MODE  (IBUF_LPWR_MODE),
         .IODELAY_HP_MODE (IODELAY_HP_MODE),
         .IODELAY_GRP     (IODELAY_GRP)
         )
        u_iob_dq
          (
           .clk_mem        (clk_mem),
           .clk            (clk),
           .rst            (rst_dq_r),
           .clk_cpt        (clk_cpt[dq_i/DRAM_WIDTH]),
           .clk_rsync      (clk_rsync_dqs[dq_i/DRAM_WIDTH]),
           .rst_rsync      (rst_rsync_dqs[dq_i/DRAM_WIDTH]),
           .dlyval         (dlyval_dq[5*(dq_i/DRAM_WIDTH)+:5]),
           .inv_dqs        (inv_dqs[dq_i/DRAM_WIDTH]),
           .wr_calib_dly   (wr_calib_dly[2*(dq_i/DRAM_WIDTH)+:2]),
           .dq_oe_n        (dq_oe_n[4*(dq_i/DRAM_WIDTH)+:4]),
           .wr_data_rise0  (wr_data_rise0[dq_i]),
           .wr_data_fall0  (wr_data_fall0[dq_i]),
           .wr_data_rise1  (wr_data_rise1[dq_i]),
           .wr_data_fall1  (wr_data_fall1[dq_i]),
           .rd_bitslip_cnt (rd_bitslip_cnt[2*(dq_i/DRAM_WIDTH)+:2]),
           .rd_clkdly_cnt  (rd_clkdly_cnt[2*(dq_i/DRAM_WIDTH)+:2]),
           .rd_clkdiv_inv  (rd_clkdiv_inv[dq_i/DRAM_WIDTH]),
           .rd_data_rise0  (rd_data_rise0[dq_i]),
           .rd_data_fall0  (rd_data_fall0[dq_i]),
           .rd_data_rise1  (rd_data_rise1[dq_i]),
           .rd_data_fall1  (rd_data_fall1[dq_i]),
           .ddr_dq         (ddr_dq[dq_i]),
           .dq_tap_cnt     (dq_tap_cnt[5*dq_i+:5])    
           );
    end
  endgenerate

  // Only use one DQ IODELAY tap per DQS group, since all DQs in the same
  // DQS group have the same delay value (because calibration for both write
  // and read timing is done on a per-DQS group basis, not a per-bit basis)
  generate
    genvar dbg_i;
    for (dbg_i = 0; dbg_i < DQS_WIDTH; dbg_i = dbg_i+1) begin: gen_dbg
      assign dbg_dq_tap_cnt[5*dbg_i+:5] = dq_tap_cnt[5*DRAM_WIDTH*dbg_i+:5];
    end
  endgenerate
  
endmodule
