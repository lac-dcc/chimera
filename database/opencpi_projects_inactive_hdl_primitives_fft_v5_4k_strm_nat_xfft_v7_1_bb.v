////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.53d
//  \   \         Application: netgen
//  /   /         Filename: xfft_v7_1.v
// /___/   /\     Timestamp: Wed May 26 14:29:50 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog ./tmp/_cg\xfft_v7_1.ngc ./tmp/_cg\xfft_v7_1.v 
// Device	: 5vsx95tff1136-2
// Input file	: ./tmp/_cg/xfft_v7_1.ngc
// Output file	: ./tmp/_cg/xfft_v7_1.v
// # of Modules	: 1
// Design Name	: xfft_v7_1
// Xilinx        : C:\Xilinx\12.1\ISE_DS\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

(* box_type="user_black_box" *)
module xfft_v7_1 (
  rfd, start, fwd_inv, dv, done, clk, busy, scale_sch_we, fwd_inv_we, edone, xn_re, xk_im, xn_index, scale_sch, xk_re, xn_im, xk_index
)/* synthesis syn_black_box syn_noprune=1 */;
  output rfd;
  input start;
  input fwd_inv;
  output dv;
  output done;
  input clk;
  output busy;
  input scale_sch_we;
  input fwd_inv_we;
  output edone;
  input [15 : 0] xn_re;
  output [15 : 0] xk_im;
  output [11 : 0] xn_index;
  input [11 : 0] scale_sch;
  output [15 : 0] xk_re;
  input [15 : 0] xn_im;
  output [11 : 0] xk_index;
endmodule // xfft_v7_1
