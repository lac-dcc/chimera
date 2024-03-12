// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Sun Jun 24 20:40:20 2018
// Host        : ubuntu running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /mnt/hgfs/e/workspaces/BAR-Tender/fpga/vivado/BAR-Tender.runs/compl_fifo_synth_1/compl_fifo_stub.v
// Design      : compl_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a50tcsg325-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_2,Vivado 2018.1" *)
module compl_fifo(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[81:0],wr_en,rd_en,dout[81:0],full,empty" */;
  input clk;
  input srst;
  input [81:0]din;
  input wr_en;
  input rd_en;
  output [81:0]dout;
  output full;
  output empty;
endmodule
