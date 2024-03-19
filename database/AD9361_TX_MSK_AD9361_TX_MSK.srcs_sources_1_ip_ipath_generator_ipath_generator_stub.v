// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Fri Jul 20 12:58:56 2018
// Host        : Anish-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               E:/VivadoProject/AD9361_TX_MSK/AD9361_TX_MSK.srcs/sources_1/ip/ipath_generator/ipath_generator_stub.v
// Design      : ipath_generator
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_6,Vivado 2017.1" *)
module ipath_generator(clka, rsta, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,addra[12:0],douta[11:0]" */;
  input clka;
  input rsta;
  input [12:0]addra;
  output [11:0]douta;
endmodule
