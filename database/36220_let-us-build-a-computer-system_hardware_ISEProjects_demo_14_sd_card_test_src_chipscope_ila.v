// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2017 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : chipscope_ila.v
// /___/   /\     Timestamp  : Thu Jul 27 20:09:18 中国标准时间 2017
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module chipscope_ila(
    CONTROL,
    CLK,
    TRIG0) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [255 : 0] TRIG0;

endmodule
