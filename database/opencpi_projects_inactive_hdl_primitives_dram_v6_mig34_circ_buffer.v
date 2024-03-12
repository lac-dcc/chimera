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
// \   \   \/     Version: %Version 
//  \   \         Application: MIG
//  /   /         Filename: circ_buffer.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:33 $
// \   \  /  \    Date Created: Mon Jun 23 2008
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Circular Buffer for synchronizing signals between clock domains. Assumes
//  write and read clocks are the same frequency (but can be varying phase).
//  Parameter List;
//    DATA_WIDTH:     # bits in data bus
//    BUF_DEPTH:      # of entries in circular buffer.
//  Port list:
//    rdata: read data
//    wdata: write data
//    rclk:  read clock
//    wclk:  write clock
//    rst:   reset - shared between read and write sides
//Reference:
//Revision History:
//   Rev 1.1 - Initial Checkin                                - jlogue 03/06/09
//*****************************************************************************

/******************************************************************************
**$Id: circ_buffer.v,v 1.2 2010/02/26 08:58:33 pboya Exp $
**$Date: 2010/02/26 08:58:33 $
**$Author: pboya $
**$Revision: 1.2 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/circ_buffer.v,v $
******************************************************************************/

`timescale 1ps/1ps


module circ_buffer #
  (
   parameter TCQ = 100,
   parameter BUF_DEPTH  = 5,   // valid values are 5, 6, 7, and 8
   parameter DATA_WIDTH = 1
   )
  (
   output[DATA_WIDTH-1:0] rdata,
   input [DATA_WIDTH-1:0] wdata,
   input                  rclk,
   input                  wclk,
   input                  rst
   );

  //***************************************************************************
  // Local parameters
  //***************************************************************************

  localparam SHFTR_MSB = (BUF_DEPTH-1)/2;

  //***************************************************************************
  // Internal signals
  //***************************************************************************

  reg               SyncResetRd;
  reg [SHFTR_MSB:0] RdCEshftr;
  reg [2:0]         RdAdrsCntr;

  reg               SyncResetWt;
  reg               WtAdrsCntr_ce;
  reg [2:0]         WtAdrsCntr;

  //***************************************************************************
  // read domain registers
  //***************************************************************************

  always @(posedge rclk or posedge rst)
    if (rst) SyncResetRd <= #TCQ 1'b1;
    else     SyncResetRd <= #TCQ 1'b0;

  always @(posedge rclk or posedge SyncResetRd)
  begin
    if (SyncResetRd)
    begin
      RdCEshftr  <= #TCQ 'b0;
      RdAdrsCntr <= #TCQ 'b0;
    end
    else
    begin
      RdCEshftr  <= #TCQ {RdCEshftr[SHFTR_MSB-1:0], WtAdrsCntr_ce};

      if(RdCEshftr[SHFTR_MSB])
      begin
        if(RdAdrsCntr == (BUF_DEPTH-1)) RdAdrsCntr <= #TCQ 'b0;
        else                            RdAdrsCntr <= #TCQ RdAdrsCntr + 1;
      end
    end
  end

  //***************************************************************************
  // write domain registers
  //***************************************************************************

  always @(posedge wclk or posedge SyncResetRd)
    if (SyncResetRd) SyncResetWt <= #TCQ 1'b1;
    else             SyncResetWt <= #TCQ 1'b0;

  always @(posedge wclk or posedge SyncResetWt)
  begin
    if (SyncResetWt)
    begin
      WtAdrsCntr_ce <= #TCQ 1'b0;
      WtAdrsCntr    <= #TCQ  'b0;
    end
    else
    begin
      WtAdrsCntr_ce <= #TCQ 1'b1;

      if(WtAdrsCntr_ce)
      begin
        if(WtAdrsCntr == (BUF_DEPTH-1)) WtAdrsCntr <= #TCQ 'b0;
        else                            WtAdrsCntr <= #TCQ WtAdrsCntr + 1;
      end
    end
  end

  //***************************************************************************
  // instantiate one RAM64X1D for each data bit
  //***************************************************************************

  genvar i;
  generate
    for(i = 0; i < DATA_WIDTH; i = i+1) begin: gen_ram
      RAM64X1D #
      (
        .INIT (64'h0000000000000000)
      )
      u_RAM64X1D
      (.DPO         (rdata[i]),
       .SPO         (),
       .A0          (WtAdrsCntr[0]),
       .A1          (WtAdrsCntr[1]),
       .A2          (WtAdrsCntr[2]),
       .A3          (1'b0),
       .A4          (1'b0),
       .A5          (1'b0),
       .D           (wdata[i]),
       .DPRA0       (RdAdrsCntr[0]),
       .DPRA1       (RdAdrsCntr[1]),
       .DPRA2       (RdAdrsCntr[2]),
       .DPRA3       (1'b0),
       .DPRA4       (1'b0),
       .DPRA5       (1'b0),
       .WCLK        (wclk),
       .WE          (1'b1)
      );
    end
  endgenerate

endmodule
