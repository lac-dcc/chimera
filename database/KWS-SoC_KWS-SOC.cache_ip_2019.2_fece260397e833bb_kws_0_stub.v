// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Aug 23 21:29:59 2020
// Host        : LAPTOP-5KE3GPT6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ kws_0_stub.v
// Design      : kws_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "kws,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, data_in_TVALID, 
  data_in_TREADY, data_in_TDATA, data_in_TLAST, weight_in_TVALID, weight_in_TREADY, 
  weight_in_TDATA, weight_in_TLAST, control_in_TVALID, control_in_TREADY, control_in_TDATA, 
  control_in_TLAST, data_out_TVALID, data_out_TREADY, data_out_TDATA, data_out_TLAST)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,data_in_TVALID,data_in_TREADY,data_in_TDATA[31:0],data_in_TLAST[0:0],weight_in_TVALID,weight_in_TREADY,weight_in_TDATA[31:0],weight_in_TLAST[0:0],control_in_TVALID,control_in_TREADY,control_in_TDATA[15:0],control_in_TLAST[0:0],data_out_TVALID,data_out_TREADY,data_out_TDATA[31:0],data_out_TLAST[0:0]" */;
  input ap_clk;
  input ap_rst_n;
  input data_in_TVALID;
  output data_in_TREADY;
  input [31:0]data_in_TDATA;
  input [0:0]data_in_TLAST;
  input weight_in_TVALID;
  output weight_in_TREADY;
  input [31:0]weight_in_TDATA;
  input [0:0]weight_in_TLAST;
  input control_in_TVALID;
  output control_in_TREADY;
  input [15:0]control_in_TDATA;
  input [0:0]control_in_TLAST;
  output data_out_TVALID;
  input data_out_TREADY;
  output [31:0]data_out_TDATA;
  output [0:0]data_out_TLAST;
endmodule
