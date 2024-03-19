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
//  /   /         Filename: ddr2_chipscope.v
// /___/   /\     Date Last Modified: $Data$ 
// \   \  /  \	  Date Created: 9/14/06
//  \___\/\___\
//
//Device: Virtex-5
//Purpose:
//   Skeleton Chipscope module declarations - for simulation only
//Reference:
//Revision History:
//
//*****************************************************************************

`timescale 1ns/1ps

module icon4 
  (
      control0,
      control1,
      control2,
      control3
  )
  /* synthesis syn_black_box syn_noprune = 1 */;
  output [35:0] control0;
  output [35:0] control1;
  output [35:0] control2;
  output [35:0] control3;
endmodule

module vio_async_in192
  (
    control,
    async_in
  )
  /* synthesis syn_black_box syn_noprune = 1 */;
  input  [35:0] control;
  input  [191:0] async_in;
endmodule

module vio_async_in96
  (
    control,
    async_in
  )
  /* synthesis syn_black_box syn_noprune = 1 */;
  input  [35:0] control;
  input  [95:0] async_in;
endmodule

module vio_async_in100
  (
    control,
    async_in
  )
  /* synthesis syn_black_box syn_noprune = 1 */;
  input  [35:0] control;
  input  [99:0] async_in;
endmodule

module vio_sync_out32
  (
    control,
    clk,
    sync_out
  )
  /* synthesis syn_black_box syn_noprune = 1 */;
  input  [35:0] control;
  input  clk;
  output [31:0] sync_out;
endmodule