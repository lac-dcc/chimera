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
//  /   /         Filename: rd_bitslip.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Shifts and delays data from ISERDES, in both memory clock and internal
//  clock cycles. Used to uniquely shift/delay each byte to align all bytes
//  in data word
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: rd_bitslip.v,v 1.2 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.2 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/rd_bitslip.v,v $
******************************************************************************/

`timescale 1ps/1ps


module rd_bitslip #
  (
   parameter TCQ = 100
  )
  (
   input            clk,
   input [1:0]      bitslip_cnt,
   input [1:0]      clkdly_cnt,
   input [5:0]      din,
   output reg [3:0] qout
   );

  reg       din2_r;
  reg [3:0] slip_out;
  reg [3:0] slip_out_r;
  reg [3:0] slip_out_r2;
  reg [3:0] slip_out_r3;
  
  //***************************************************************************

  always @(posedge clk)
    din2_r <= #TCQ din[2];
  
  // Can shift data from ISERDES from 0-3 fast clock cycles
  // NOTE: This is coded combinationally, in order to allow register to
  // occur after MUXing of delayed outputs. Timing may be difficult to
  // meet on this logic, if necessary, the register may need to be moved
  // here instead, or another register added. 
  always @(bitslip_cnt or din or din2_r)
    case (bitslip_cnt)
      2'b00: // No slip
        slip_out = {din[3], din[2], din[1], din[0]};
      2'b01: // Slip = 0.5 cycle
        slip_out = {din[4], din[3], din[2], din[1]};
      2'b10: // Slip = 1 cycle
        slip_out = {din[5], din[4], din[3], din[2]};
      2'b11: // Slip = 1.5 cycle
        slip_out = {din2_r, din[5], din[4], din[3]};
    endcase
  
  // Can delay up to 3 additional internal clock cycles - this accounts
  // not only for delays due to DRAM, PCB routing between different bytes,
  // but also differences within the FPGA - e.g. clock skew between different
  // I/O columns, and differences in latency between different circular
  // buffers or whatever synchronization method (FIFO) is used to get the
  // data into the global clock domain
  always @(posedge clk) begin
    slip_out_r  <= #TCQ slip_out;
    slip_out_r2 <= #TCQ slip_out_r;
    slip_out_r3 <= #TCQ slip_out_r2;
  end
    
  always @(posedge clk)
    case (clkdly_cnt)
      2'b00: qout <= #TCQ slip_out;
      2'b01: qout <= #TCQ slip_out_r;
      2'b10: qout <= #TCQ slip_out_r2;
      2'b11: qout <= #TCQ slip_out_r3;
    endcase
    
endmodule
