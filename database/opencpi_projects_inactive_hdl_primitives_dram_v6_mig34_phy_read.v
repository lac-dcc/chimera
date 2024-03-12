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
//  /   /         Filename: phy_read.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   Top-level module for PHY-layer read logic
//     1. Read clock (capture, resync) generation
//     2. Synchronization of control from MC into resync clock domain
//     3. Synchronization of data/valid into MC clock domain
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_read.v,v 1.3 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.3 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_read.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_read #
  (
   parameter TCQ             = 100,     // clk->out delay (sim only)
   parameter nCK_PER_CLK     = 2,       // # of memory clocks per CLK
   parameter CLK_PERIOD      = 3333,    // Internal clock period (in ps)
   parameter REFCLK_FREQ     = 300.0,   // IODELAY Reference Clock freq (MHz)
   parameter DQS_WIDTH       = 8,       // # of DQS (strobe)
   parameter DQ_WIDTH        = 64,      // # of DQ (data)
   parameter DRAM_WIDTH      = 8,       // # of DQ per DQS
   parameter IODELAY_GRP     = "IODELAY_MIG", // May be assigned unique name
                                              // when mult IP cores in design
   parameter nDQS_COL0       = 4,       // # DQS groups in I/O column #1
   parameter nDQS_COL1       = 4,       // # DQS groups in I/O column #2
   parameter nDQS_COL2       = 0,       // # DQS groups in I/O column #3
   parameter nDQS_COL3       = 0,       // # DQS groups in I/O column #4
   parameter DQS_LOC_COL0    = 32'h03020100,  // DQS grps in col #1
   parameter DQS_LOC_COL1    = 32'h07060504,  // DQS grps in col #2
   parameter DQS_LOC_COL2    = 0,             // DQS grps in col #3
   parameter DQS_LOC_COL3    = 0              // DQS grps in col #4
   )
  (
   input                        clk_mem,
   input                        clk,
   input                        clk_rd_base,
   input                        rst,                    
   // Read clock generation/distribution signals
   input                        dlyrst_cpt,
   input [DQS_WIDTH-1:0]        dlyce_cpt,
   input [DQS_WIDTH-1:0]        dlyinc_cpt,
   input                        dlyrst_rsync,
   input [3:0]                  dlyce_rsync,
   input [3:0]                  dlyinc_rsync,
   output [DQS_WIDTH-1:0]       clk_cpt,
   output [3:0]                 clk_rsync,
   output [3:0]                 rst_rsync,
   output                       rdpath_rdy,
   // Control for command sync logic
   input                        mc_data_sel,
   input [4:0]                  rd_active_dly,
   // Captured data in resync clock domain
   input [DQ_WIDTH-1:0]         rd_data_rise0,
   input [DQ_WIDTH-1:0]         rd_data_fall0,
   input [DQ_WIDTH-1:0]         rd_data_rise1,
   input [DQ_WIDTH-1:0]         rd_data_fall1,
   input [DQS_WIDTH-1:0]        rd_dqs_rise0,
   input [DQS_WIDTH-1:0]        rd_dqs_fall0,
   input [DQS_WIDTH-1:0]        rd_dqs_rise1,
   input [DQS_WIDTH-1:0]        rd_dqs_fall1,
   // DFI signals from MC/PHY rdlvl logic
   input                        dfi_rddata_en,
   input                        phy_rddata_en,
   // Synchronized data/valid back to MC/PHY rdlvl logic
   output                       dfi_rddata_valid,
   output                       dfi_rddata_valid_phy,
   output [4*DQ_WIDTH-1:0]      dfi_rddata,
   output [4*DQS_WIDTH-1:0]     dfi_rd_dqs,
   // Debug bus
   output [5*DQS_WIDTH-1:0]     dbg_cpt_tap_cnt,   // CPT IODELAY tap count
   output [19:0]                dbg_rsync_tap_cnt, // RSYNC IODELAY tap count
   output [255:0]               dbg_phy_read       //general purpose debug
   );

  //***************************************************************************
  // Assign signals for Debug Port
  //***************************************************************************

  // Currently no assignments - add as needed
  assign dbg_phy_read = 'b0;

  //***************************************************************************
  // Read clocks (capture, resynchronization) generation
  //***************************************************************************

  phy_rdclk_gen #
    (
     .TCQ            (TCQ),
     .nCK_PER_CLK    (nCK_PER_CLK),
     .CLK_PERIOD     (CLK_PERIOD),
     .DQS_WIDTH      (DQS_WIDTH),
     .REFCLK_FREQ    (REFCLK_FREQ),
     .IODELAY_GRP    (IODELAY_GRP),
     .nDQS_COL0      (nDQS_COL0),
     .nDQS_COL1      (nDQS_COL1),
     .nDQS_COL2      (nDQS_COL2),
     .nDQS_COL3      (nDQS_COL3)    
     )
    u_phy_rdclk_gen
      (
       .clk_mem           (clk_mem),
       .clk               (clk),
       .clk_rd_base       (clk_rd_base),
       .rst               (rst),
       .dlyrst_cpt        (dlyrst_cpt),
       .dlyce_cpt         (dlyce_cpt),
       .dlyinc_cpt        (dlyinc_cpt),
       .dlyrst_rsync      (dlyrst_rsync),
       .dlyce_rsync       (dlyce_rsync),
       .dlyinc_rsync      (dlyinc_rsync),
       .clk_cpt           (clk_cpt),
       .clk_rsync         (clk_rsync),
       .rst_rsync         (rst_rsync),
       .dbg_cpt_tap_cnt   (dbg_cpt_tap_cnt),       
       .dbg_rsync_tap_cnt (dbg_rsync_tap_cnt)
       );

  //***************************************************************************
  // Synchronization of read enable signal from MC/PHY rdlvl logic
  //***************************************************************************

  phy_rdctrl_sync #
    (
     .TCQ (TCQ)
    )
    u_phy_rdctrl_sync
    (
     .clk                  (clk),
     .rst_rsync            (rst_rsync[0]),
     .mc_data_sel          (mc_data_sel),
     .rd_active_dly        (rd_active_dly),
     .dfi_rddata_en        (dfi_rddata_en),
     .phy_rddata_en        (phy_rddata_en),
     .dfi_rddata_valid     (dfi_rddata_valid),
     .dfi_rddata_valid_phy (dfi_rddata_valid_phy),
     .rdpath_rdy           (rdpath_rdy)
     );

  //***************************************************************************
  // Synchronization of read data and accompanying valid signal back to MC/
  // PHY rdlvl logic
  //***************************************************************************

  phy_rddata_sync #
    (
     .TCQ            (TCQ),
     .DQ_WIDTH       (DQ_WIDTH),
     .DQS_WIDTH      (DQS_WIDTH),
     .DRAM_WIDTH     (DRAM_WIDTH),
     .nDQS_COL0      (nDQS_COL0),
     .nDQS_COL1      (nDQS_COL1),
     .nDQS_COL2      (nDQS_COL2),
     .nDQS_COL3      (nDQS_COL3),
     .DQS_LOC_COL0   (DQS_LOC_COL0),
     .DQS_LOC_COL1   (DQS_LOC_COL1),
     .DQS_LOC_COL2   (DQS_LOC_COL2),
     .DQS_LOC_COL3   (DQS_LOC_COL3)
     )
    u_phy_rddata_sync
      (
       .clk           (clk),
       .clk_rsync     (clk_rsync),
       .rst_rsync     (rst_rsync),
       .rd_data_rise0 (rd_data_rise0),
       .rd_data_fall0 (rd_data_fall0),
       .rd_data_rise1 (rd_data_rise1),
       .rd_data_fall1 (rd_data_fall1),
       .rd_dqs_rise0  (rd_dqs_rise0),
       .rd_dqs_fall0  (rd_dqs_fall0),
       .rd_dqs_rise1  (rd_dqs_rise1),
       .rd_dqs_fall1  (rd_dqs_fall1),
       .dfi_rddata    (dfi_rddata),
       .dfi_rd_dqs    (dfi_rd_dqs)
       );

endmodule
