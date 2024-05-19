// This program was cloned from: https://github.com/xenowing/xenowing
// License: Apache License 2.0

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun Aug 14 21:32:42 2022
// Host        : the-executive running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top clk_mmcm -prefix
//               clk_mmcm_ clk_mmcm_stub.v
// Design      : clk_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a50tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_mmcm(clk_200, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_200,reset,locked,clk_in1" */;
  output clk_200;
  input reset;
  output locked;
  input clk_in1;
endmodule
