//---------------------------------------------------------------------------   
// File:        ddr2_usr_addr_fifo.v
// Author:      Zhangxi Tan
// Description: Modified from ddr2_usr_addr_fifo.v
//------------------------------------------------------------------------------

//*****************************************************************************
// DISCLAIMER OF LIABILITY
// 
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you a 
// license to use this text/file solely for design, simulation, 
// implementation and creation of design files limited 
// to Xilinx devices or technologies. Use with non-Xilinx 
// devices or technologies is expressly prohibited and 
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information 
// "as-is" solely for use in developing programs and 
// solutions for Xilinx devices, with no obligation on the 
// part of Xilinx to provide support. By providing this design, 
// code, or information as one possible implementation of 
// this feature, application or standard, Xilinx is making no 
// representation that this implementation is free from any 
// claims of infringement. You are responsible for 
// obtaining any rights you may require for your implementation. 
// Xilinx expressly disclaims any warranty whatsoever with 
// respect to the adequacy of the implementation, including 
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied 
// warranties of merchantability or fitness for a particular 
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications is
// expressly prohibited.
//
// Any modifications that are made to the Source Code are 
// done at the users sole risk and will be unsupported.
//
// Copyright (c) 2006-2007 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part 
// of this text at all times. 
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 2.3
//  \   \         Application: MIG
//  /   /         Filename: ddr2_usr_addr_fifo.v
// /___/   /\     Date Last Modified: $Date: 2008/05/08 15:20:47 $
// \   \  /  \    Date Created: Mon Aug 28 2006
//  \___\/\___\
//
//Device: Virtex-5
//Design Name: DDR2
//Purpose:
//   This module instantiates the block RAM based FIFO to store the user
//   address and the command information. Also calculates potential bank/row
//   conflicts by comparing the new address with last address issued.
//Reference:
//Revision History:
//*****************************************************************************

`timescale 1ns/1ps

module ddr2_usr_addr_fifo #
  (
   // Following parameters are for 72-bit RDIMM design (for ML561 Reference 
   // board design). Actual values may be different. Actual parameters values 
   // are passed from design top module ddr2_sdram module. Please refer to
   // the ddr2_sdram module for actual values.
   parameter BANK_WIDTH    = 2,
   parameter COL_WIDTH     = 10,
   parameter CS_BITS       = 0,
   parameter ROW_WIDTH     = 14
   )
  (
   input          clk0,			//ddr2 phy clock
   input          rst0,
   //start new port by xtan
   input 	  af_clk,		//user side clock
   //end new port by xtan
   input [2:0]    app_af_cmd,
   input [30:0]   app_af_addr,
   input          app_af_wren,
   input          ctrl_af_rden,
   output reg [2:0]   af_cmd,         //xtan: changed from "output"
   output reg [30:0]  af_addr,        //xtan: changed from "output"
   output         af_empty,
   output         app_af_afull
   );

  wire [35:0]     fifo_data_out;
   reg            rst_r;


  always @(posedge clk0)
     rst_r <= rst0;


  //***************************************************************************
  // xtan : start of change
  // MIG is very stupid on the valid flag generation. Definitely not optimal.
  // I added an extra pipeline register here, because I'm scared by the stupid
  // and complicated implementation in ddr2_ctrl.v.
  //
  // assign af_cmd      = fifo_data_out[33:31];
  // assign af_addr     = fifo_data_out[30:0];
  always @(posedge clk0) begin
    af_cmd  <= fifo_data_out[33:31];
    af_addr <= fifo_data_out[30:0];
  end
  
  // xtan : end of change
  //***************************************************************************

  FIFO36 #
    (
     .ALMOST_EMPTY_OFFSET     (13'h0007),
     .ALMOST_FULL_OFFSET      (13'h3E0),
     .DATA_WIDTH              (36),
     .DO_REG                  (1),
     .EN_SYN                  ("FALSE"),	//changed by xtan: true -> false
     .FIRST_WORD_FALL_THROUGH ("FALSE")		
     )
    u_af
      (
       .ALMOSTEMPTY (),
       .ALMOSTFULL  (app_af_afull),
       .DO          (fifo_data_out[31:0]),
       .DOP         (fifo_data_out[35:32]),
       .EMPTY       (af_empty),
       .FULL        (),
       .RDCOUNT     (),
       .RDERR       (),
       .WRCOUNT     (),
       .WRERR       (),
       .DI          ({app_af_cmd[0],app_af_addr}),
       .DIP         ({2'b00,app_af_cmd[2:1]}),
       .RDCLK       (clk0),
       .RDEN        (ctrl_af_rden),
       .RST         (rst_r),
       .WRCLK       (af_clk),			//changed by xtan: clk0 -> af_clk
       .WREN        (app_af_wren)
       );

endmodule
