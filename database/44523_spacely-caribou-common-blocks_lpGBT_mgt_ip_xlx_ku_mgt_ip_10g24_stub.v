// This program was cloned from: https://github.com/SpacelyProject/spacely-caribou-common-blocks
// License: Apache License 2.0

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Thu Mar  7 11:33:30 2024
// Host        : hpcfpga02.hep.anl.gov running 64-bit AlmaLinux 9.3 (Shamrock Pampas Cat)
// Command     : write_verilog -force -mode synth_stub
//               /users/aparamonov/work/peary_fw_sprocket3/peary-firmware-sprocket3/ip_repo/10g24/xlx_ku_mgt_ip_10g24_stub.v
// Design      : xlx_ku_mgt_ip_10g24
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlx_ku_mgt_ip_10g24_gtwizard_top,Vivado 2022.1" *)
module xlx_ku_mgt_ip_10g24(gtwiz_userclk_tx_active_in, 
  gtwiz_userclk_rx_active_in, gtwiz_buffbypass_rx_reset_in, 
  gtwiz_buffbypass_rx_start_user_in, gtwiz_buffbypass_rx_done_out, 
  gtwiz_buffbypass_rx_error_out, gtwiz_reset_clk_freerun_in, gtwiz_reset_all_in, 
  gtwiz_reset_tx_pll_and_datapath_in, gtwiz_reset_tx_datapath_in, 
  gtwiz_reset_rx_pll_and_datapath_in, gtwiz_reset_rx_datapath_in, 
  gtwiz_reset_rx_cdr_stable_out, gtwiz_reset_tx_done_out, gtwiz_reset_rx_done_out, 
  gtwiz_userdata_tx_in, gtwiz_userdata_rx_out, gtrefclk00_in, gtrefclk01_in, 
  qpll0outclk_out, qpll0outrefclk_out, qpll1outclk_out, qpll1outrefclk_out, drpaddr_in, 
  drpclk_in, drpdi_in, drpen_in, drpwe_in, gthrxn_in, gthrxp_in, rxpolarity_in, rxslide_in, 
  rxusrclk_in, rxusrclk2_in, txpippmen_in, txpippmovrden_in, txpippmpd_in, txpippmsel_in, 
  txpippmstepsize_in, txpolarity_in, txusrclk_in, txusrclk2_in, drpdo_out, drprdy_out, 
  gthtxn_out, gthtxp_out, gtpowergood_out, rxoutclk_out, rxpmaresetdone_out, txbufstatus_out, 
  txoutclk_out, txpmaresetdone_out)
/* synthesis syn_black_box black_box_pad_pin="gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_buffbypass_rx_reset_in[0:0],gtwiz_buffbypass_rx_start_user_in[0:0],gtwiz_buffbypass_rx_done_out[0:0],gtwiz_buffbypass_rx_error_out[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[31:0],gtwiz_userdata_rx_out[31:0],gtrefclk00_in[0:0],gtrefclk01_in[0:0],qpll0outclk_out[0:0],qpll0outrefclk_out[0:0],qpll1outclk_out[0:0],qpll1outrefclk_out[0:0],drpaddr_in[9:0],drpclk_in[0:0],drpdi_in[15:0],drpen_in[0:0],drpwe_in[0:0],gthrxn_in[0:0],gthrxp_in[0:0],rxpolarity_in[0:0],rxslide_in[0:0],rxusrclk_in[0:0],rxusrclk2_in[0:0],txpippmen_in[0:0],txpippmovrden_in[0:0],txpippmpd_in[0:0],txpippmsel_in[0:0],txpippmstepsize_in[4:0],txpolarity_in[0:0],txusrclk_in[0:0],txusrclk2_in[0:0],drpdo_out[15:0],drprdy_out[0:0],gthtxn_out[0:0],gthtxp_out[0:0],gtpowergood_out[0:0],rxoutclk_out[0:0],rxpmaresetdone_out[0:0],txbufstatus_out[1:0],txoutclk_out[0:0],txpmaresetdone_out[0:0]" */;
  input [0:0]gtwiz_userclk_tx_active_in;
  input [0:0]gtwiz_userclk_rx_active_in;
  input [0:0]gtwiz_buffbypass_rx_reset_in;
  input [0:0]gtwiz_buffbypass_rx_start_user_in;
  output [0:0]gtwiz_buffbypass_rx_done_out;
  output [0:0]gtwiz_buffbypass_rx_error_out;
  input [0:0]gtwiz_reset_clk_freerun_in;
  input [0:0]gtwiz_reset_all_in;
  input [0:0]gtwiz_reset_tx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_tx_datapath_in;
  input [0:0]gtwiz_reset_rx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_rx_datapath_in;
  output [0:0]gtwiz_reset_rx_cdr_stable_out;
  output [0:0]gtwiz_reset_tx_done_out;
  output [0:0]gtwiz_reset_rx_done_out;
  input [31:0]gtwiz_userdata_tx_in;
  output [31:0]gtwiz_userdata_rx_out;
  input [0:0]gtrefclk00_in;
  input [0:0]gtrefclk01_in;
  output [0:0]qpll0outclk_out;
  output [0:0]qpll0outrefclk_out;
  output [0:0]qpll1outclk_out;
  output [0:0]qpll1outrefclk_out;
  input [9:0]drpaddr_in;
  input [0:0]drpclk_in;
  input [15:0]drpdi_in;
  input [0:0]drpen_in;
  input [0:0]drpwe_in;
  input [0:0]gthrxn_in;
  input [0:0]gthrxp_in;
  input [0:0]rxpolarity_in;
  input [0:0]rxslide_in;
  input [0:0]rxusrclk_in;
  input [0:0]rxusrclk2_in;
  input [0:0]txpippmen_in;
  input [0:0]txpippmovrden_in;
  input [0:0]txpippmpd_in;
  input [0:0]txpippmsel_in;
  input [4:0]txpippmstepsize_in;
  input [0:0]txpolarity_in;
  input [0:0]txusrclk_in;
  input [0:0]txusrclk2_in;
  output [15:0]drpdo_out;
  output [0:0]drprdy_out;
  output [0:0]gthtxn_out;
  output [0:0]gthtxp_out;
  output [0:0]gtpowergood_out;
  output [0:0]rxoutclk_out;
  output [0:0]rxpmaresetdone_out;
  output [1:0]txbufstatus_out;
  output [0:0]txoutclk_out;
  output [0:0]txpmaresetdone_out;
endmodule
