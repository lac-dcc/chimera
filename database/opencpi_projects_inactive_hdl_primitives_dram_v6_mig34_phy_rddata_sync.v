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
//  /   /         Filename: phy_rddata_sync.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   Synchronization of captured read data along with appropriately delayed
//   valid signal (both in clk_rsync domain) to MC/PHY rdlvl logic clock (clk)
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_rddata_sync.v,v 1.3 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.3 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_rddata_sync.v,v $
******************************************************************************/

`timescale 1ps/1ps


module phy_rddata_sync #
  (
   parameter TCQ             = 100,     // clk->out delay (sim only)
   parameter DQ_WIDTH        = 64,      // # of DQ (data)
   parameter DQS_WIDTH       = 8,       // # of DQS (strobe)
   parameter DRAM_WIDTH      = 8,       // # of DQ per DQS
   parameter nDQS_COL0       = 4,       // # DQS groups in I/O column #1
   parameter nDQS_COL1       = 4,       // # DQS groups in I/O column #2
   parameter nDQS_COL2       = 4,       // # DQS groups in I/O column #3
   parameter nDQS_COL3       = 4,       // # DQS groups in I/O column #4
   parameter DQS_LOC_COL0    = 32'h03020100,          // DQS grps in col #1
   parameter DQS_LOC_COL1    = 32'h07060504,          // DQS grps in col #2
   parameter DQS_LOC_COL2    = 0,                     // DQS grps in col #3
   parameter DQS_LOC_COL3    = 0                      // DQS grps in col #4
   )
  (
   input                        clk,
   input [3:0]                  clk_rsync,
   input [3:0]                  rst_rsync,
   // Captured data in resync clock domain
   input [DQ_WIDTH-1:0]         rd_data_rise0,
   input [DQ_WIDTH-1:0]         rd_data_fall0,
   input [DQ_WIDTH-1:0]         rd_data_rise1,
   input [DQ_WIDTH-1:0]         rd_data_fall1,
   input [DQS_WIDTH-1:0]        rd_dqs_rise0,
   input [DQS_WIDTH-1:0]        rd_dqs_fall0,
   input [DQS_WIDTH-1:0]        rd_dqs_rise1,
   input [DQS_WIDTH-1:0]        rd_dqs_fall1,
   // Synchronized data/valid back to MC/PHY rdlvl logic
   output reg [4*DQ_WIDTH-1:0]  dfi_rddata,
   output reg [4*DQS_WIDTH-1:0] dfi_rd_dqs
   );

  // Ensure nonzero width for certain buses to prevent syntax errors
  // during compile in the event they are not used (e.g. buses that have to
  // do with column #2 in a single column design never get used, although
  // those buses still will get declared)
  localparam COL1_VECT_WIDTH = (nDQS_COL1 > 0) ? nDQS_COL1 : 1;
  localparam COL2_VECT_WIDTH = (nDQS_COL2 > 0) ? nDQS_COL2 : 1;
  localparam COL3_VECT_WIDTH = (nDQS_COL3 > 0) ? nDQS_COL3 : 1;

  reg [4*DRAM_WIDTH*nDQS_COL0-1:0]        data_c0;
  reg [4*DRAM_WIDTH*COL1_VECT_WIDTH-1:0]  data_c1;
  reg [4*DRAM_WIDTH*COL2_VECT_WIDTH-1:0]  data_c2;
  reg [4*DRAM_WIDTH*COL3_VECT_WIDTH-1:0]  data_c3;
  reg [DQ_WIDTH-1:0]                      data_fall0_sync;
  reg [DQ_WIDTH-1:0]                      data_fall1_sync;
  reg [DQ_WIDTH-1:0]                      data_rise0_sync;
  reg [DQ_WIDTH-1:0]                      data_rise1_sync;
  wire [4*DRAM_WIDTH*nDQS_COL0-1:0]       data_sync_c0;
  wire [4*DRAM_WIDTH*COL1_VECT_WIDTH-1:0] data_sync_c1;
  wire [4*DRAM_WIDTH*COL2_VECT_WIDTH-1:0] data_sync_c2;
  wire [4*DRAM_WIDTH*COL3_VECT_WIDTH-1:0] data_sync_c3;
  reg [4*nDQS_COL0-1:0]                   dqs_c0;
  reg [4*COL1_VECT_WIDTH-1:0]             dqs_c1;
  reg [4*COL2_VECT_WIDTH-1:0]             dqs_c2;
  reg [4*COL3_VECT_WIDTH-1:0]             dqs_c3;
  reg [DQS_WIDTH-1:0]                     dqs_fall0_sync;
  reg [DQS_WIDTH-1:0]                     dqs_fall1_sync;
  reg [DQS_WIDTH-1:0]                     dqs_rise0_sync;
  reg [DQS_WIDTH-1:0]                     dqs_rise1_sync;
  wire [4*nDQS_COL0-1:0]                  dqs_sync_c0;
  wire [4*COL1_VECT_WIDTH-1:0]            dqs_sync_c1;
  wire [4*COL2_VECT_WIDTH-1:0]            dqs_sync_c2;
  wire [4*COL3_VECT_WIDTH-1:0]            dqs_sync_c3;

  //***************************************************************************
  // Synchronization of both data and active/valid signal from clk_rsync to
  // clk domain
  // NOTES:
  //  1. For now, assume both rddata_valid0 and rddata_valid1 are driven at
  //     same time. PHY returns data aligned in this manner
  //  2. Circular buffer implementation is preliminary (i.e. shortcuts have
  //     been taken!). Will later need some sort of calibration.
  //       - Substitute this with enhanced circular buffer design for
  //         release (5 deep design)
  //  3. Up to 4 circular buffers are used, one for each CLK_RSYNC[x] domain.
  //  4. RD_ACTIVE synchronized to CLK_RSYNC[0] circular buffer. This is
  //     TEMPORARY only. For release, do not need this - RD_ACTIVE will
  //.    remain totally in the
  // A single circular buffer is used for the entire data bus. This will
  //     be an issue in H/W - will need to examine this based on clock
  //     frequency, and skew matching achievable in H/W.
  //***************************************************************************

  generate
    genvar c0_i;
    for (c0_i = 0; c0_i < nDQS_COL0; c0_i = c0_i + 1) begin: gen_loop_c0
      // Steer data to circular buffer - merge FALL/RISE data into single bus
      always @(rd_dqs_fall0 or rd_dqs_fall1 or
               rd_dqs_rise0 or rd_dqs_rise1)
        dqs_c0[4*(c0_i+1)-1-:4]
          = {rd_dqs_fall1[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]],
             rd_dqs_rise1[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]],
             rd_dqs_fall0[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]],
             rd_dqs_rise0[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]]};
      always @(rd_data_rise0 or rd_data_rise1 or
               rd_data_fall0 or rd_data_fall1)
        data_c0[4*DRAM_WIDTH*(c0_i+1)-1-:4*DRAM_WIDTH]
          = {rd_data_fall1[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                           DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])],
             rd_data_rise1[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                           DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])],
             rd_data_fall0[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                           DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])],
             rd_data_rise0[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                           DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])]};

      // Reassemble data from circular buffer
      always @(dqs_sync_c0[4*c0_i] or 
               dqs_sync_c0[4*c0_i+1] or 
               dqs_sync_c0[4*c0_i+2] or 
               dqs_sync_c0[4*c0_i+3]) begin 
        dqs_fall1_sync[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]]
          = dqs_sync_c0[4*c0_i+3];
        dqs_rise1_sync[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]]
          = dqs_sync_c0[4*c0_i+2];
        dqs_fall0_sync[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]]
          = dqs_sync_c0[4*c0_i+1];
        dqs_rise0_sync[DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]]
          = dqs_sync_c0[4*c0_i];
      end
      
      
      always @(data_sync_c0[4*DRAM_WIDTH*c0_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i] or 
               data_sync_c0[4*DRAM_WIDTH*c0_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i+DRAM_WIDTH] or 
               data_sync_c0[4*DRAM_WIDTH*c0_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i+2*DRAM_WIDTH] or 
               data_sync_c0[4*DRAM_WIDTH*c0_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i+3*DRAM_WIDTH]) begin
        data_fall1_sync[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                        DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])]
          = data_sync_c0[4*DRAM_WIDTH*c0_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i+3*DRAM_WIDTH];
        data_rise1_sync[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                        DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])]
          = data_sync_c0[4*DRAM_WIDTH*c0_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i+2*DRAM_WIDTH];
        data_fall0_sync[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                        DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])]
          = data_sync_c0[4*DRAM_WIDTH*c0_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i+DRAM_WIDTH];
        data_rise0_sync[DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i]+1)-1:
                        DRAM_WIDTH*(DQS_LOC_COL0[(8*(c0_i+1))-1:8*c0_i])]
          = data_sync_c0[4*DRAM_WIDTH*c0_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c0_i];
      end
    end
  endgenerate

  circ_buffer #
    (
      .TCQ        (TCQ),
      .DATA_WIDTH ((4*nDQS_COL0)+(4*DRAM_WIDTH*nDQS_COL0)),
      .BUF_DEPTH  (6)
    )
    u_rddata_sync_c0
    (
      .rclk  (clk),
      .wclk  (clk_rsync[0]),
      .rst   (rst_rsync[0]),
      .wdata ({dqs_c0,data_c0}),
      .rdata ({dqs_sync_c0,data_sync_c0})
    );

  generate
    genvar c1_i;
    if (nDQS_COL1 > 0) begin: gen_c1
      for (c1_i = 0; c1_i < nDQS_COL1; c1_i = c1_i + 1) begin: gen_loop_c1
        // Steer data to circular buffer - merge FALL/RISE data into single bus
        always @(rd_dqs_fall0 or rd_dqs_fall1 or
                 rd_dqs_rise0 or rd_dqs_rise1)
          dqs_c1[4*(c1_i+1)-1-:4]
            = {rd_dqs_fall1[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]],
               rd_dqs_rise1[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]],
               rd_dqs_fall0[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]],
               rd_dqs_rise0[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]]};
        always @(rd_data_rise0 or rd_data_rise1 or
                 rd_data_fall0 or rd_data_fall1)
          data_c1[4*DRAM_WIDTH*(c1_i+1)-1-:4*DRAM_WIDTH]
            = {rd_data_fall1[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])],
               rd_data_rise1[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])],
               rd_data_fall0[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])],
               rd_data_rise0[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])]};
  
        // Reassemble data from circular buffer
        always @(dqs_sync_c1[4*c1_i] or 
                 dqs_sync_c1[4*c1_i+1] or 
                 dqs_sync_c1[4*c1_i+2] or 
                 dqs_sync_c1[4*c1_i+3] ) begin 
          dqs_fall1_sync[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]]
            = dqs_sync_c1[4*c1_i+3];
          dqs_rise1_sync[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]]
            = dqs_sync_c1[4*c1_i+2];
          dqs_fall0_sync[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]]
            = dqs_sync_c1[4*c1_i+1];
          dqs_rise0_sync[DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]]
            = dqs_sync_c1[4*c1_i];
        end

        always @(data_sync_c1[4*DRAM_WIDTH*c1_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i] or 
                 data_sync_c1[4*DRAM_WIDTH*c1_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i+DRAM_WIDTH] or 
                 data_sync_c1[4*DRAM_WIDTH*c1_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i+2*DRAM_WIDTH] or 
                 data_sync_c1[4*DRAM_WIDTH*c1_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i+3*DRAM_WIDTH]) begin 
          data_fall1_sync[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])]
            = data_sync_c1[4*DRAM_WIDTH*c1_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i+3*DRAM_WIDTH];
          data_rise1_sync[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])]
            = data_sync_c1[4*DRAM_WIDTH*c1_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i+2*DRAM_WIDTH];
          data_fall0_sync[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])]
            = data_sync_c1[4*DRAM_WIDTH*c1_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i+DRAM_WIDTH];
          data_rise0_sync[DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL1[(8*(c1_i+1))-1:8*c1_i])]
            = data_sync_c1[4*DRAM_WIDTH*c1_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c1_i];
        end
      end
  
      circ_buffer #
        (
         .TCQ        (TCQ),
         .DATA_WIDTH ((4*nDQS_COL1)+(4*DRAM_WIDTH*nDQS_COL1)),
         .BUF_DEPTH  (6)
         )
        u_rddata_sync_c1
          (
           .rclk  (clk),
           .wclk  (clk_rsync[1]),
           .rst   (rst_rsync[1]),
           .wdata ({dqs_c1,data_c1}),
           .rdata ({dqs_sync_c1,data_sync_c1})
           );
    end
  endgenerate

  generate
    genvar c2_i;
    if (nDQS_COL2 > 0) begin: gen_c2
      for (c2_i = 0; c2_i < nDQS_COL2; c2_i = c2_i + 1) begin: gen_loop_c2
        // Steer data to circular buffer - merge FALL/RISE data into single bus
        always @(rd_dqs_fall0 or rd_dqs_fall1 or
                 rd_dqs_rise0 or rd_dqs_rise1)
          dqs_c2[4*(c2_i+1)-1-:4]
            = {rd_dqs_fall1[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]],
               rd_dqs_rise1[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]],
               rd_dqs_fall0[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]],
               rd_dqs_rise0[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]]};
        always @(rd_data_fall0 or rd_data_fall1 or
                 rd_data_rise0 or rd_data_rise1)
          data_c2[4*DRAM_WIDTH*(c2_i+1)-1-:4*DRAM_WIDTH]
            = {rd_data_fall1[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])],
               rd_data_rise1[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])],
               rd_data_fall0[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])],
               rd_data_rise0[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])]};
  
        // Reassemble data from circular buffer
        always @(dqs_sync_c2[4*c2_i] or 
                 dqs_sync_c2[4*c2_i+1] or 
                 dqs_sync_c2[4*c2_i+2] or 
                 dqs_sync_c2[4*c2_i+3] ) begin 
          dqs_fall1_sync[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]]
            = dqs_sync_c2[4*c2_i+3];
          dqs_rise1_sync[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]]
            = dqs_sync_c2[4*c2_i+2];
          dqs_fall0_sync[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]]
            = dqs_sync_c2[4*c2_i+1];
          dqs_rise0_sync[DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]]
            = dqs_sync_c2[4*c2_i];
        end

        always @(data_sync_c2[4*DRAM_WIDTH*c2_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i] or 
                 data_sync_c2[4*DRAM_WIDTH*c2_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i+DRAM_WIDTH] or 
                 data_sync_c2[4*DRAM_WIDTH*c2_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i+2*DRAM_WIDTH] or 
                 data_sync_c2[4*DRAM_WIDTH*c2_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i+3*DRAM_WIDTH]) begin
          data_fall1_sync[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])]
            = data_sync_c2[4*DRAM_WIDTH*c2_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i+3*DRAM_WIDTH];
          data_rise1_sync[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])]
            = data_sync_c2[4*DRAM_WIDTH*c2_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i+2*DRAM_WIDTH];
          data_fall0_sync[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])]
            = data_sync_c2[4*DRAM_WIDTH*c2_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i+DRAM_WIDTH];
          data_rise0_sync[DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL2[(8*(c2_i+1))-1:8*c2_i])]
            = data_sync_c2[4*DRAM_WIDTH*c2_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c2_i];
        end
      end
  
      circ_buffer #
        (
         .TCQ        (TCQ),
         .DATA_WIDTH ((4*nDQS_COL2)+(4*DRAM_WIDTH*nDQS_COL2)),
         .BUF_DEPTH  (6)
         )
        u_rddata_sync_c2
          (
           .rclk  (clk),
           .wclk  (clk_rsync[2]),
           .rst   (rst_rsync[2]),
           .wdata ({dqs_c2,data_c2}),
           .rdata ({dqs_sync_c2,data_sync_c2})
           );
    end
  endgenerate

  generate
    genvar c3_i;
    if (nDQS_COL3 > 0) begin: gen_c3
      for (c3_i = 0; c3_i < nDQS_COL3; c3_i = c3_i + 1) begin: gen_loop_c3
        // Steer data to circular buffer - merge FALL/RISE data into
        // single bus
        always @(rd_dqs_fall0 or rd_dqs_fall1 or
                 rd_dqs_rise0 or rd_dqs_rise1)
          dqs_c3[4*(c3_i+1)-1-:4]
            = {rd_dqs_fall1[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]],
               rd_dqs_rise1[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]],
               rd_dqs_fall0[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]],
               rd_dqs_rise0[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]]};
        always @(rd_data_fall0 or rd_data_fall1 or
                 rd_data_rise0 or rd_data_rise1)
          data_c3[4*DRAM_WIDTH*(c3_i+1)-1-:4*DRAM_WIDTH]
            = {rd_data_fall1[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])],
               rd_data_rise1[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])],
               rd_data_fall0[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])],
               rd_data_rise0[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                             DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])]};
  
        // Reassemble data from circular buffer
        always @(dqs_sync_c3[4*c3_i] or 
                 dqs_sync_c3[4*c3_i+1] or 
                 dqs_sync_c3[4*c3_i+2] or 
                 dqs_sync_c3[4*c3_i+3]) begin 
          dqs_fall1_sync[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]]
            = dqs_sync_c3[4*c3_i+3];
          dqs_rise1_sync[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]]
            = dqs_sync_c3[4*c3_i+2];
          dqs_fall0_sync[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]]
            = dqs_sync_c3[4*c3_i+1];
          dqs_rise0_sync[DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]]
            = dqs_sync_c3[4*c3_i];
        end
          
        always @(data_sync_c3[4*DRAM_WIDTH*c3_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i] or 
                 data_sync_c3[4*DRAM_WIDTH*c3_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i+DRAM_WIDTH] or 
                 data_sync_c3[4*DRAM_WIDTH*c3_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i+2*DRAM_WIDTH] or 
                 data_sync_c3[4*DRAM_WIDTH*c3_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i+3*DRAM_WIDTH]) begin
          data_fall1_sync[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])]
            = data_sync_c3[4*DRAM_WIDTH*c3_i+4*DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i+3*DRAM_WIDTH];
          data_rise1_sync[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])]
            = data_sync_c3[4*DRAM_WIDTH*c3_i+3*DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i+2*DRAM_WIDTH];
          data_fall0_sync[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])]
            = data_sync_c3[4*DRAM_WIDTH*c3_i+2*DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i+DRAM_WIDTH];
          data_rise0_sync[DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i]+1)-1:
                          DRAM_WIDTH*(DQS_LOC_COL3[(8*(c3_i+1))-1:8*c3_i])]
            = data_sync_c3[4*DRAM_WIDTH*c3_i+DRAM_WIDTH-1:4*DRAM_WIDTH*c3_i];
        end
      end
  
      circ_buffer #
        (
         .TCQ        (TCQ),
         .DATA_WIDTH ((4*nDQS_COL3)+(4*DRAM_WIDTH*nDQS_COL3)),
         .BUF_DEPTH  (6)
         )
        u_rddata_sync_c3
          (
           .rclk  (clk),
           .wclk  (clk_rsync[3]),
           .rst   (rst_rsync[3]),
           .wdata ({dqs_c3,data_c3}),
           .rdata ({dqs_sync_c3,data_sync_c3})
           );
    end
  endgenerate

  //***************************************************************************

  // Pipeline stage only required if timing not met otherwise
  always @(posedge clk) begin
    dfi_rddata <= #TCQ {data_fall1_sync,
                        data_rise1_sync,
                        data_fall0_sync,
                        data_rise0_sync};
    dfi_rd_dqs <= #TCQ {dqs_fall1_sync,
                        dqs_rise1_sync,
                        dqs_fall0_sync,
                        dqs_rise0_sync};
   end

endmodule
