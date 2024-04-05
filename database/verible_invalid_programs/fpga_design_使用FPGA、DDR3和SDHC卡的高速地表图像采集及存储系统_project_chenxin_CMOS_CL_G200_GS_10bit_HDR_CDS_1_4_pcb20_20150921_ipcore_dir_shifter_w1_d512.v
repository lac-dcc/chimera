////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.40d
//  \   \         Application: netgen
//  /   /         Filename: shifter_w1_d512.v
// /___/   /\     Timestamp: Thu Jan 08 17:26:53 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/jianche/Desktop/G200_TEST_1_8/ipcore_dir/tmp/_cg/shifter_w1_d512.ngc C:/Users/jianche/Desktop/G200_TEST_1_8/ipcore_dir/tmp/_cg/shifter_w1_d512.v 
// Device	: 6slx150fgg900-3
// Input file	: C:/Users/jianche/Desktop/G200_TEST_1_8/ipcore_dir/tmp/_cg/shifter_w1_d512.ngc
// Output file	: C:/Users/jianche/Desktop/G200_TEST_1_8/ipcore_dir/tmp/_cg/shifter_w1_d512.v
// # of Modules	: 1
// Design Name	: shifter_w1_d512
// Xilinx        : D:\softwaresetupdocument\ise13\ISE_DS\ISE\
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

module shifter_w1_d512 (
  clk, sclr, d, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input sclr;
  input [0 : 0] d;
  output [0 : 0] q;
  
  // synthesis translate_off
  
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_2_24 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_1_23 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_0_22 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_3_21 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_2_20 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_1_19 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_0_18 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_3_17 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_2_16 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_1_15 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_0_14 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_3_13 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_2_12 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_1_11 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_0_10 ;
  wire \U0/i_synth/i_bb_inst/N1 ;
  wire \U0/i_synth/i_bb_inst/N0 ;
  wire \U0/i_synth/i_bb_inst/f1.many_clbs.last_clb.gen_width[0].srl_sig<123> ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_3_Q31_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_2_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_1_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_0_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_3_Q31_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_2_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_1_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_0_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_3_Q31_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_2_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_1_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_0_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_3_Q31_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_2_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_1_Q_UNCONNECTED ;
  wire \NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_0_Q_UNCONNECTED ;
  wire [2 : 0] \U0/i_synth/i_bb_inst/f1.many_clbs.link ;
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_3  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_2_24 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\U0/i_synth/i_bb_inst/f1.many_clbs.last_clb.gen_width[0].srl_sig<123> ),
    .Q31(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_3_Q31_UNCONNECTED ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N0 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_2  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_1_23 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_2_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_2_24 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_1  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_0_22 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_1_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_1_23 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_0  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/f1.many_clbs.link [2]),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_0_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.last_clb.gen_width[0].srl_sig_123_0_22 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/f1.many_clbs.link_2  (
    .C(clk),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_3_21 ),
    .Q(\U0/i_synth/i_bb_inst/f1.many_clbs.link [2])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_3  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_2_20 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_3_21 ),
    .Q31(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_3_Q31_UNCONNECTED ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_2  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_1_19 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_2_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_2_20 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_1  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_0_18 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_1_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_1_19 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_0  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/f1.many_clbs.link [1]),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_0_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_2_0_18 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/f1.many_clbs.link_1  (
    .C(clk),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_3_17 ),
    .Q(\U0/i_synth/i_bb_inst/f1.many_clbs.link [1])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_3  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_2_16 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_3_17 ),
    .Q31(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_3_Q31_UNCONNECTED ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_2  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_1_15 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_2_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_2_16 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_1  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_0_14 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_1_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_1_15 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_0  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/f1.many_clbs.link [0]),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_0_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_1_0_14 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/f1.many_clbs.link_0  (
    .C(clk),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_3_13 ),
    .Q(\U0/i_synth/i_bb_inst/f1.many_clbs.link [0])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_3  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_2_12 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_3_13 ),
    .Q31(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_3_Q31_UNCONNECTED ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_2  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_1_11 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_2_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_2_12 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_1  (
    .CLK(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_0_10 ),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_1_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_1_11 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_0  (
    .CLK(clk),
    .D(d[0]),
    .CE(\U0/i_synth/i_bb_inst/N1 ),
    .Q(\NLW_U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_0_Q_UNCONNECTED ),
    .Q31(\U0/i_synth/i_bb_inst/Mshreg_f1.many_clbs.link_0_0_10 ),
    .A({\U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 , \U0/i_synth/i_bb_inst/N1 })
  );
  VCC   \U0/i_synth/i_bb_inst/XST_VCC  (
    .P(\U0/i_synth/i_bb_inst/N1 )
  );
  GND   \U0/i_synth/i_bb_inst/XST_GND  (
    .G(\U0/i_synth/i_bb_inst/N0 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_1  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/f1.many_clbs.last_clb.gen_width[0].srl_sig<123> ),
    .R(sclr),
    .Q(q[0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
