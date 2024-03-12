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
//  /   /         Filename: phy_clock_io.v
// /___/   /\     Date Last Modified: $Date: 2010/10/05 16:43:09 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//Purpose:
//   Top-level for CK/CK# clock forwarding to memory
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_clock_io.v,v 1.1 2010/10/05 16:43:09 mishra Exp $
**$Date: 2010/10/05 16:43:09 $
**$Author: mishra $
**$Revision: 1.1 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/O/mig_v3_7/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_clock_io.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_clock_io #
  (
   parameter TCQ          = 100,       // clk->out delay (sim only)
   parameter CK_WIDTH     = 2,         // # of clock output pairs
   parameter WRLVL        = "OFF",     // Enable write leveling
   parameter DRAM_TYPE    = "DDR3",    // Memory I/F type: "DDR3", "DDR2"
   parameter REFCLK_FREQ  = 300.0,     // IODELAY Reference Clock freq (MHz)
   parameter IODELAY_GRP  = "IODELAY_MIG"  // May be assigned unique name
                                              // when mult IP cores in design
   )
  (
   input                 clk_mem,   // full rate core clock
   input                 clk,       // half rate core clock
   input                 rst,       // half rate core clk reset
   output [CK_WIDTH-1:0] ddr_ck_p,  // forwarded diff. clock to memory
   output [CK_WIDTH-1:0] ddr_ck_n   // forwarded diff. clock to memory
   );

  //***************************************************************************

  generate
    genvar ck_i;
    for (ck_i = 0; ck_i < CK_WIDTH; ck_i = ck_i + 1) begin: gen_ck
      phy_ck_iob #
        (
         .TCQ            (TCQ),
         .WRLVL          (WRLVL),
         .DRAM_TYPE      (DRAM_TYPE),
         .REFCLK_FREQ    (REFCLK_FREQ),
         .IODELAY_GRP    (IODELAY_GRP)
         )
        u_phy_ck_iob
          (
           .clk_mem   (clk_mem),
           .clk       (clk),
           .rst       (rst),
           .ddr_ck_p  (ddr_ck_p[ck_i]),
           .ddr_ck_n  (ddr_ck_n[ck_i])
           );
    end
  endgenerate

endmodule
