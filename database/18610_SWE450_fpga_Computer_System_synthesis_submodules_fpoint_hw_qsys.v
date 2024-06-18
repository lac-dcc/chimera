// This program was cloned from: https://github.com/briancook247/SWE450
// License: MIT License

// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Copyright (C) 1991-2010 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = lpm_add_sub 4 lpm_mult 1 reg 254 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_mult_single
	( 
	aclr,
	clk_en,
	clock,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [31:0]  dataa;
	input   [31:0]  datab;
	output   [31:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	dataa_exp_all_one_ff_p1;
	reg	dataa_exp_not_zero_ff_p1;
	reg	dataa_man_not_zero_ff_p1;
	reg	dataa_man_not_zero_ff_p2;
	reg	datab_exp_all_one_ff_p1;
	reg	datab_exp_not_zero_ff_p1;
	reg	datab_man_not_zero_ff_p1;
	reg	datab_man_not_zero_ff_p2;
	reg	[9:0]	delay_exp2_bias;
	reg	[9:0]	delay_exp3_bias;
	reg	[9:0]	delay_exp_bias;
	reg	delay_man_product_msb;
	reg	delay_man_product_msb2;
	reg	delay_man_product_msb_p0;
	reg	[23:0]	delay_round;
	reg	[8:0]	exp_add_p1;
	reg	[9:0]	exp_adj_p1;
	reg	[9:0]	exp_adj_p2;
	reg	[8:0]	exp_bias_p1;
	reg	[8:0]	exp_bias_p2;
	reg	[7:0]	exp_result_ff;
	reg	input_is_infinity_dffe_0;
	reg	input_is_infinity_dffe_1;
	reg	input_is_infinity_dffe_2;
	reg	input_is_infinity_dffe_3;
	reg	input_is_infinity_ff1;
	reg	input_is_infinity_ff2;
	reg	input_is_infinity_ff3;
	reg	input_is_infinity_ff4;
	reg	input_is_nan_dffe_0;
	reg	input_is_nan_dffe_1;
	reg	input_is_nan_dffe_2;
	reg	input_is_nan_dffe_3;
	reg	input_is_nan_ff1;
	reg	input_is_nan_ff2;
	reg	input_is_nan_ff3;
	reg	input_is_nan_ff4;
	reg	input_not_zero_dffe_0;
	reg	input_not_zero_dffe_1;
	reg	input_not_zero_dffe_2;
	reg	input_not_zero_dffe_3;
	reg	input_not_zero_ff1;
	reg	input_not_zero_ff2;
	reg	input_not_zero_ff3;
	reg	input_not_zero_ff4;
	reg	lsb_dffe;
	reg	[22:0]	man_result_ff;
	reg	man_round_carry_p0;
	reg	[23:0]	man_round_p;
	reg	[23:0]	man_round_p0;
	reg	[24:0]	man_round_p2;
	reg	round_dffe;
	reg	[0:0]	sign_node_ff0;
	reg	[0:0]	sign_node_ff1;
	reg	[0:0]	sign_node_ff2;
	reg	[0:0]	sign_node_ff3;
	reg	[0:0]	sign_node_ff4;
	reg	[0:0]	sign_node_ff5;
	reg	[0:0]	sign_node_ff6;
	reg	[0:0]	sign_node_ff7;
	reg	[0:0]	sign_node_ff8;
	reg	[0:0]	sign_node_ff9;
	reg	sticky_dffe;
	wire  [8:0]   wire_exp_add_adder_result;
	wire  [9:0]   wire_exp_adj_adder_result;
	wire  [9:0]   wire_exp_bias_subtr_result;
	wire  [24:0]   wire_man_round_adder_result;
	wire  [47:0]   wire_man_product2_mult_result;
	wire  [9:0]  bias;
	wire  [7:0]  dataa_exp_all_one;
	wire  [7:0]  dataa_exp_not_zero;
	wire  [22:0]  dataa_man_not_zero;
	wire  [7:0]  datab_exp_all_one;
	wire  [7:0]  datab_exp_not_zero;
	wire  [22:0]  datab_man_not_zero;
	wire  exp_is_inf;
	wire  exp_is_zero;
	wire  [9:0]  expmod;
	wire  [7:0]  inf_num;
	wire  lsb_bit;
	wire  [24:0]  man_shift_full;
	wire  [7:0]  result_exp_all_one;
	wire  [8:0]  result_exp_not_zero;
	wire  round_bit;
	wire  round_carry;
	wire  [22:0]  sticky_bit;

	// synopsys translate_off
	initial
		dataa_exp_all_one_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_exp_all_one_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_exp_all_one_ff_p1 <= dataa_exp_all_one[7];
	// synopsys translate_off
	initial
		dataa_exp_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_exp_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_exp_not_zero_ff_p1 <= dataa_exp_not_zero[7];
	// synopsys translate_off
	initial
		dataa_man_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_man_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_man_not_zero_ff_p1 <= dataa_man_not_zero[10];
	// synopsys translate_off
	initial
		dataa_man_not_zero_ff_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_man_not_zero_ff_p2 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_man_not_zero_ff_p2 <= dataa_man_not_zero[22];
	// synopsys translate_off
	initial
		datab_exp_all_one_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_exp_all_one_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_exp_all_one_ff_p1 <= datab_exp_all_one[7];
	// synopsys translate_off
	initial
		datab_exp_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_exp_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_exp_not_zero_ff_p1 <= datab_exp_not_zero[7];
	// synopsys translate_off
	initial
		datab_man_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_man_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_man_not_zero_ff_p1 <= datab_man_not_zero[10];
	// synopsys translate_off
	initial
		datab_man_not_zero_ff_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_man_not_zero_ff_p2 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_man_not_zero_ff_p2 <= datab_man_not_zero[22];
	// synopsys translate_off
	initial
		delay_exp2_bias = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_exp2_bias <= 10'b0;
		else if  (clk_en == 1'b1)   delay_exp2_bias <= delay_exp_bias;
	// synopsys translate_off
	initial
		delay_exp3_bias = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_exp3_bias <= 10'b0;
		else if  (clk_en == 1'b1)   delay_exp3_bias <= delay_exp2_bias;
	// synopsys translate_off
	initial
		delay_exp_bias = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_exp_bias <= 10'b0;
		else if  (clk_en == 1'b1)   delay_exp_bias <= wire_exp_bias_subtr_result;
	// synopsys translate_off
	initial
		delay_man_product_msb = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_man_product_msb <= 1'b0;
		else if  (clk_en == 1'b1)   delay_man_product_msb <= delay_man_product_msb_p0;
	// synopsys translate_off
	initial
		delay_man_product_msb2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_man_product_msb2 <= 1'b0;
		else if  (clk_en == 1'b1)   delay_man_product_msb2 <= delay_man_product_msb;
	// synopsys translate_off
	initial
		delay_man_product_msb_p0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_man_product_msb_p0 <= 1'b0;
		else if  (clk_en == 1'b1)   delay_man_product_msb_p0 <= wire_man_product2_mult_result[47];
	// synopsys translate_off
	initial
		delay_round = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_round <= 24'b0;
		else if  (clk_en == 1'b1)   delay_round <= ((man_round_p2[23:0] & {24{(~ man_round_p2[24])}}) | (man_round_p2[24:1] & {24{man_round_p2[24]}}));
	// synopsys translate_off
	initial
		exp_add_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_add_p1 <= 9'b0;
		else if  (clk_en == 1'b1)   exp_add_p1 <= wire_exp_add_adder_result;
	// synopsys translate_off
	initial
		exp_adj_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_adj_p1 <= 10'b0;
		else if  (clk_en == 1'b1)   exp_adj_p1 <= delay_exp3_bias;
	// synopsys translate_off
	initial
		exp_adj_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_adj_p2 <= 10'b0;
		else if  (clk_en == 1'b1)   exp_adj_p2 <= wire_exp_adj_adder_result;
	// synopsys translate_off
	initial
		exp_bias_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_bias_p1 <= 9'b0;
		else if  (clk_en == 1'b1)   exp_bias_p1 <= exp_add_p1[8:0];
	// synopsys translate_off
	initial
		exp_bias_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_bias_p2 <= 9'b0;
		else if  (clk_en == 1'b1)   exp_bias_p2 <= exp_bias_p1;
	// synopsys translate_off
	initial
		exp_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_ff <= 8'b0;
		else if  (clk_en == 1'b1)   exp_result_ff <= ((inf_num & {8{((exp_is_inf | input_is_infinity_ff4) | input_is_nan_ff4)}}) | ((exp_adj_p2[7:0] & {8{(~ exp_is_zero)}}) & {8{input_not_zero_ff4}}));
	// synopsys translate_off
	initial
		input_is_infinity_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_dffe_0 <= ((dataa_exp_all_one_ff_p1 & (~ (dataa_man_not_zero_ff_p1 | dataa_man_not_zero_ff_p2))) | (datab_exp_all_one_ff_p1 & (~ (datab_man_not_zero_ff_p1 | datab_man_not_zero_ff_p2))));
	// synopsys translate_off
	initial
		input_is_infinity_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_dffe_1 <= input_is_infinity_dffe_0;
	// synopsys translate_off
	initial
		input_is_infinity_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_dffe_2 <= input_is_infinity_dffe_1;
	// synopsys translate_off
	initial
		input_is_infinity_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_dffe_3 <= input_is_infinity_dffe_2;
	// synopsys translate_off
	initial
		input_is_infinity_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_ff1 <= input_is_infinity_dffe_3;
	// synopsys translate_off
	initial
		input_is_infinity_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_ff2 <= input_is_infinity_ff1;
	// synopsys translate_off
	initial
		input_is_infinity_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_ff3 <= input_is_infinity_ff2;
	// synopsys translate_off
	initial
		input_is_infinity_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_ff4 <= input_is_infinity_ff3;
	// synopsys translate_off
	initial
		input_is_nan_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe_0 <= ((dataa_exp_all_one_ff_p1 & (dataa_man_not_zero_ff_p1 | dataa_man_not_zero_ff_p2)) | (datab_exp_all_one_ff_p1 & (datab_man_not_zero_ff_p1 | datab_man_not_zero_ff_p2)));
	// synopsys translate_off
	initial
		input_is_nan_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe_1 <= input_is_nan_dffe_0;
	// synopsys translate_off
	initial
		input_is_nan_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe_2 <= input_is_nan_dffe_1;
	// synopsys translate_off
	initial
		input_is_nan_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe_3 <= input_is_nan_dffe_2;
	// synopsys translate_off
	initial
		input_is_nan_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_ff1 <= input_is_nan_dffe_3;
	// synopsys translate_off
	initial
		input_is_nan_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_ff2 <= input_is_nan_ff1;
	// synopsys translate_off
	initial
		input_is_nan_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_ff3 <= input_is_nan_ff2;
	// synopsys translate_off
	initial
		input_is_nan_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_ff4 <= input_is_nan_ff3;
	// synopsys translate_off
	initial
		input_not_zero_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_dffe_0 <= (dataa_exp_not_zero_ff_p1 & datab_exp_not_zero_ff_p1);
	// synopsys translate_off
	initial
		input_not_zero_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_dffe_1 <= input_not_zero_dffe_0;
	// synopsys translate_off
	initial
		input_not_zero_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_dffe_2 <= input_not_zero_dffe_1;
	// synopsys translate_off
	initial
		input_not_zero_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_dffe_3 <= input_not_zero_dffe_2;
	// synopsys translate_off
	initial
		input_not_zero_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_ff1 <= input_not_zero_dffe_3;
	// synopsys translate_off
	initial
		input_not_zero_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_ff2 <= input_not_zero_ff1;
	// synopsys translate_off
	initial
		input_not_zero_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_ff3 <= input_not_zero_ff2;
	// synopsys translate_off
	initial
		input_not_zero_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_ff4 <= input_not_zero_ff3;
	// synopsys translate_off
	initial
		lsb_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lsb_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   lsb_dffe <= lsb_bit;
	// synopsys translate_off
	initial
		man_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_result_ff <= 23'b0;
		else if  (clk_en == 1'b1)   man_result_ff <= {((((((delay_round[22] & input_not_zero_ff4) & (~ input_is_infinity_ff4)) & (~ exp_is_inf)) & (~ exp_is_zero)) | (input_is_infinity_ff4 & (~ input_not_zero_ff4))) | input_is_nan_ff4), (((((delay_round[21:0] & {22{input_not_zero_ff4}}) & {22{(~ input_is_infinity_ff4)}}) & {22{(~ exp_is_inf)}}) & {22{(~ exp_is_zero)}}) & {22{(~ input_is_nan_ff4)}})};
	// synopsys translate_off
	initial
		man_round_carry_p0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_carry_p0 <= 1'b0;
		else if  (clk_en == 1'b1)   man_round_carry_p0 <= round_carry;
	// synopsys translate_off
	initial
		man_round_p = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_p <= 24'b0;
		else if  (clk_en == 1'b1)   man_round_p <= man_shift_full[24:1];
	// synopsys translate_off
	initial
		man_round_p0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_p0 <= 24'b0;
		else if  (clk_en == 1'b1)   man_round_p0 <= man_round_p;
	// synopsys translate_off
	initial
		man_round_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_p2 <= 25'b0;
		else if  (clk_en == 1'b1)   man_round_p2 <= wire_man_round_adder_result;
	// synopsys translate_off
	initial
		round_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   round_dffe <= round_bit;
	// synopsys translate_off
	initial
		sign_node_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff0 <= (dataa[31] ^ datab[31]);
	// synopsys translate_off
	initial
		sign_node_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff1 <= sign_node_ff0[0:0];
	// synopsys translate_off
	initial
		sign_node_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff2 <= sign_node_ff1[0:0];
	// synopsys translate_off
	initial
		sign_node_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff3 <= sign_node_ff2[0:0];
	// synopsys translate_off
	initial
		sign_node_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff4 <= sign_node_ff3[0:0];
	// synopsys translate_off
	initial
		sign_node_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff5 <= sign_node_ff4[0:0];
	// synopsys translate_off
	initial
		sign_node_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff6 <= sign_node_ff5[0:0];
	// synopsys translate_off
	initial
		sign_node_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff7 <= sign_node_ff6[0:0];
	// synopsys translate_off
	initial
		sign_node_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff8 <= sign_node_ff7[0:0];
	// synopsys translate_off
	initial
		sign_node_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff9 <= sign_node_ff8[0:0];
	// synopsys translate_off
	initial
		sticky_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_dffe <= sticky_bit[22];
	lpm_add_sub   exp_add_adder
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({1'b0, dataa[30:23]}),
	.datab({1'b0, datab[30:23]}),
	.overflow(),
	.result(wire_exp_add_adder_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_add_adder.lpm_pipeline = 1,
		exp_add_adder.lpm_width = 9,
		exp_add_adder.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_adj_adder
	( 
	.cin(1'b0),
	.cout(),
	.dataa(exp_adj_p1),
	.datab({expmod[9:0]}),
	.overflow(),
	.result(wire_exp_adj_adder_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_adj_adder.lpm_pipeline = 0,
		exp_adj_adder.lpm_width = 10,
		exp_adj_adder.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_bias_subtr
	( 
	.cout(),
	.dataa({1'b0, exp_bias_p2}),
	.datab({bias[9:0]}),
	.overflow(),
	.result(wire_exp_bias_subtr_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_bias_subtr.lpm_direction = "SUB",
		exp_bias_subtr.lpm_pipeline = 0,
		exp_bias_subtr.lpm_representation = "UNSIGNED",
		exp_bias_subtr.lpm_width = 10,
		exp_bias_subtr.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_round_adder
	( 
	.cout(),
	.dataa({1'b0, man_round_p0}),
	.datab({{24{1'b0}}, man_round_carry_p0}),
	.overflow(),
	.result(wire_man_round_adder_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_round_adder.lpm_pipeline = 0,
		man_round_adder.lpm_width = 25,
		man_round_adder.lpm_type = "lpm_add_sub";
	lpm_mult   man_product2_mult
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa({1'b1, dataa[22:0]}),
	.datab({1'b1, datab[22:0]}),
	.result(wire_man_product2_mult_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_product2_mult.lpm_pipeline = 5,
		man_product2_mult.lpm_representation = "UNSIGNED",
		man_product2_mult.lpm_widtha = 24,
		man_product2_mult.lpm_widthb = 24,
		man_product2_mult.lpm_widthp = 48,
		man_product2_mult.lpm_widths = 1,
		man_product2_mult.lpm_type = "lpm_mult",
		man_product2_mult.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	assign
		bias = {{3{1'b0}}, {7{1'b1}}},
		dataa_exp_all_one = {(dataa[30] & dataa_exp_all_one[6]), (dataa[29] & dataa_exp_all_one[5]), (dataa[28] & dataa_exp_all_one[4]), (dataa[27] & dataa_exp_all_one[3]), (dataa[26] & dataa_exp_all_one[2]), (dataa[25] & dataa_exp_all_one[1]), (dataa[24] & dataa_exp_all_one[0]), dataa[23]},
		dataa_exp_not_zero = {(dataa[30] | dataa_exp_not_zero[6]), (dataa[29] | dataa_exp_not_zero[5]), (dataa[28] | dataa_exp_not_zero[4]), (dataa[27] | dataa_exp_not_zero[3]), (dataa[26] | dataa_exp_not_zero[2]), (dataa[25] | dataa_exp_not_zero[1]), (dataa[24] | dataa_exp_not_zero[0]), dataa[23]},
		dataa_man_not_zero = {(dataa[22] | dataa_man_not_zero[21]), (dataa[21] | dataa_man_not_zero[20]), (dataa[20] | dataa_man_not_zero[19]), (dataa[19] | dataa_man_not_zero[18]), (dataa[18] | dataa_man_not_zero[17]), (dataa[17] | dataa_man_not_zero[16]), (dataa[16] | dataa_man_not_zero[15]), (dataa[15] | dataa_man_not_zero[14]), (dataa[14] | dataa_man_not_zero[13]), (dataa[13] | dataa_man_not_zero[12]), (dataa[12] | dataa_man_not_zero[11]), dataa[11], (dataa[10] | dataa_man_not_zero[9]), (dataa[9] | dataa_man_not_zero[8]), (dataa[8] | dataa_man_not_zero[7]), (dataa[7] | dataa_man_not_zero[6]), (dataa[6] | dataa_man_not_zero[5]), (dataa[5] | dataa_man_not_zero[4]), (dataa[4] | dataa_man_not_zero[3]), (dataa[3] | dataa_man_not_zero[2]), (dataa[2] | dataa_man_not_zero[1]), (dataa[1] | dataa_man_not_zero[0]), dataa[0]},
		datab_exp_all_one = {(datab[30] & datab_exp_all_one[6]), (datab[29] & datab_exp_all_one[5]), (datab[28] & datab_exp_all_one[4]), (datab[27] & datab_exp_all_one[3]), (datab[26] & datab_exp_all_one[2]), (datab[25] & datab_exp_all_one[1]), (datab[24] & datab_exp_all_one[0]), datab[23]},
		datab_exp_not_zero = {(datab[30] | datab_exp_not_zero[6]), (datab[29] | datab_exp_not_zero[5]), (datab[28] | datab_exp_not_zero[4]), (datab[27] | datab_exp_not_zero[3]), (datab[26] | datab_exp_not_zero[2]), (datab[25] | datab_exp_not_zero[1]), (datab[24] | datab_exp_not_zero[0]), datab[23]},
		datab_man_not_zero = {(datab[22] | datab_man_not_zero[21]), (datab[21] | datab_man_not_zero[20]), (datab[20] | datab_man_not_zero[19]), (datab[19] | datab_man_not_zero[18]), (datab[18] | datab_man_not_zero[17]), (datab[17] | datab_man_not_zero[16]), (datab[16] | datab_man_not_zero[15]), (datab[15] | datab_man_not_zero[14]), (datab[14] | datab_man_not_zero[13]), (datab[13] | datab_man_not_zero[12]), (datab[12] | datab_man_not_zero[11]), datab[11], (datab[10] | datab_man_not_zero[9]), (datab[9] | datab_man_not_zero[8]), (datab[8] | datab_man_not_zero[7]), (datab[7] | datab_man_not_zero[6]), (datab[6] | datab_man_not_zero[5]), (datab[5] | datab_man_not_zero[4]), (datab[4] | datab_man_not_zero[3]), (datab[3] | datab_man_not_zero[2]), (datab[2] | datab_man_not_zero[1]), (datab[1] | datab_man_not_zero[0]), datab[0]},
		exp_is_inf = (((~ exp_adj_p2[9]) & exp_adj_p2[8]) | ((~ exp_adj_p2[8]) & result_exp_all_one[7])),
		exp_is_zero = (exp_adj_p2[9] | (~ result_exp_not_zero[8])),
		expmod = {{8{1'b0}}, (delay_man_product_msb2 & man_round_p2[24]), (delay_man_product_msb2 ^ man_round_p2[24])},
		inf_num = {8{1'b1}},
		lsb_bit = man_shift_full[1],
		man_shift_full = ((wire_man_product2_mult_result[46:22] & {25{(~ wire_man_product2_mult_result[47])}}) | (wire_man_product2_mult_result[47:23] & {25{wire_man_product2_mult_result[47]}})),
		result = {sign_node_ff9[0:0], exp_result_ff[7:0], man_result_ff[22:0]},
		result_exp_all_one = {(result_exp_all_one[6] & exp_adj_p2[7]), (result_exp_all_one[5] & exp_adj_p2[6]), (result_exp_all_one[4] & exp_adj_p2[5]), (result_exp_all_one[3] & exp_adj_p2[4]), (result_exp_all_one[2] & exp_adj_p2[3]), (result_exp_all_one[1] & exp_adj_p2[2]), (result_exp_all_one[0] & exp_adj_p2[1]), exp_adj_p2[0]},
		result_exp_not_zero = {(result_exp_not_zero[7] | exp_adj_p2[8]), (result_exp_not_zero[6] | exp_adj_p2[7]), (result_exp_not_zero[5] | exp_adj_p2[6]), (result_exp_not_zero[4] | exp_adj_p2[5]), (result_exp_not_zero[3] | exp_adj_p2[4]), (result_exp_not_zero[2] | exp_adj_p2[3]), (result_exp_not_zero[1] | exp_adj_p2[2]), (result_exp_not_zero[0] | exp_adj_p2[1]), exp_adj_p2[0]},
		round_bit = man_shift_full[0],
		round_carry = (round_dffe & (lsb_dffe | sticky_dffe)),
		sticky_bit = {(sticky_bit[21] | (wire_man_product2_mult_result[47] & wire_man_product2_mult_result[22])), (sticky_bit[20] | wire_man_product2_mult_result[21]), (sticky_bit[19] | wire_man_product2_mult_result[20]), (sticky_bit[18] | wire_man_product2_mult_result[19]), (sticky_bit[17] | wire_man_product2_mult_result[18]), (sticky_bit[16] | wire_man_product2_mult_result[17]), (sticky_bit[15] | wire_man_product2_mult_result[16]), (sticky_bit[14] | wire_man_product2_mult_result[15]), (sticky_bit[13] | wire_man_product2_mult_result[14]), (sticky_bit[12] | wire_man_product2_mult_result[13]), (sticky_bit[11] | wire_man_product2_mult_result[12]), (sticky_bit[10] | wire_man_product2_mult_result[11]), (sticky_bit[9] | wire_man_product2_mult_result[10]), (sticky_bit[8] | wire_man_product2_mult_result[9]), (sticky_bit[7] | wire_man_product2_mult_result[8]), (sticky_bit[6] | wire_man_product2_mult_result[7]), (sticky_bit[5] | wire_man_product2_mult_result[6]), (sticky_bit[4] | wire_man_product2_mult_result[5]), (sticky_bit[3] | wire_man_product2_mult_result[4]), (sticky_bit[2] | wire_man_product2_mult_result[3]), (sticky_bit[1] | wire_man_product2_mult_result[2]), (sticky_bit[0] | wire_man_product2_mult_result[1]), wire_man_product2_mult_result[0]};
endmodule //fpoint_hw_qsys_mult_single
//VALID FILE

//altfp_add_sub CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DENORMAL_SUPPORT="NO" DEVICE_FAMILY="STRATIXIV" DIRECTION="VARIABLE" EXCEPTION_HANDLING="NO" PIPELINE=8 REDUCED_FUNCTIONALITY="NO" SPEED_OPTIMIZED="YES" WIDTH_EXP=8 WIDTH_MAN=23 aclr add_sub clk_en clock dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_add_sub 2010:09:06:21:07:24:PN cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2010 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.




//altbarrel_shift CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="STRATIXIV" PIPELINE=1 SHIFTDIR="LEFT" WIDTH=26 WIDTHDIST=5 aclr clk_en clock data distance result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END

//synthesis_resources = reg 27 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altbarrel_shift_fjg
	( 
	aclr,
	clk_en,
	clock,
	data,
	distance,
	result) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [25:0]  data;
	input   [4:0]  distance;
	output   [25:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	dir_pipe;
	reg	[25:0]	sbit_piper1d;
	wire  [5:0]  dir_w;
	wire  direction_w;
	wire  [15:0]  pad_w;
	wire  [155:0]  sbit_w;
	wire  [4:0]  sel_w;
	wire  [129:0]  smux_w;

	// synopsys translate_off
	initial
		dir_pipe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dir_pipe <= 1'b0;
		else if  (clk_en == 1'b1)   dir_pipe <= {dir_w[4]};
	// synopsys translate_off
	initial
		sbit_piper1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper1d <= 26'b0;
		else if  (clk_en == 1'b1)   sbit_piper1d <= smux_w[129:104];
	assign
		dir_w = {dir_pipe[0], dir_w[3:0], direction_w},
		direction_w = 1'b0,
		pad_w = {16{1'b0}},
		result = sbit_w[155:130],
		sbit_w = {sbit_piper1d, smux_w[103:0], data},
		sel_w = {distance[4:0]},
		smux_w = {((({26{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[113:104], pad_w[15:0]}) | ({26{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[129:120]})) | ({26{(~ sel_w[4])}} & sbit_w[129:104])), ((({26{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[95:78], pad_w[7:0]}) | ({26{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[103:86]})) | ({26{(~ sel_w[3])}} & sbit_w[103:78])), ((({26{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[73:52], pad_w[3:0]}) | ({26{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[77:56]})) | ({26{(~ sel_w[2])}} & sbit_w[77:52])), ((({26{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[49:26], pad_w[1:0]}) | ({26{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[51:28]})) | ({26{(~ sel_w[1])}} & sbit_w[51:26])), ((({26{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[24:0], pad_w[0]}) | ({26{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[25:1]})) | ({26{(~ sel_w[0])}} & sbit_w[25:0]))};
endmodule //fpoint_hw_qsys_addsub_single_altbarrel_shift_fjg


//altbarrel_shift CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="STRATIXIV" SHIFTDIR="RIGHT" WIDTH=26 WIDTHDIST=5 data distance result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altbarrel_shift_44e
	( 
	data,
	distance,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [25:0]  data;
	input   [4:0]  distance;
	output   [25:0]  result;

	wire  [5:0]  dir_w;
	wire  direction_w;
	wire  [15:0]  pad_w;
	wire  [155:0]  sbit_w;
	wire  [4:0]  sel_w;
	wire  [129:0]  smux_w;

	assign
		dir_w = {dir_w[4:0], direction_w},
		direction_w = 1'b1,
		pad_w = {16{1'b0}},
		result = sbit_w[155:130],
		sbit_w = {smux_w[129:0], data},
		sel_w = {distance[4:0]},
		smux_w = {((({26{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[113:104], pad_w[15:0]}) | ({26{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[129:120]})) | ({26{(~ sel_w[4])}} & sbit_w[129:104])), ((({26{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[95:78], pad_w[7:0]}) | ({26{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[103:86]})) | ({26{(~ sel_w[3])}} & sbit_w[103:78])), ((({26{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[73:52], pad_w[3:0]}) | ({26{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[77:56]})) | ({26{(~ sel_w[2])}} & sbit_w[77:52])), ((({26{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[49:26], pad_w[1:0]}) | ({26{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[51:28]})) | ({26{(~ sel_w[1])}} & sbit_w[51:26])), ((({26{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[24:0], pad_w[0]}) | ({26{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[25:1]})) | ({26{(~ sel_w[0])}} & sbit_w[25:0]))};
endmodule //fpoint_hw_qsys_addsub_single_altbarrel_shift_44e


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" WIDTH=32 WIDTHAD=5 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=16 WIDTHAD=4 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=8 WIDTHAD=3 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=4 WIDTHAD=2 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=2 WIDTHAD=1 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_i0b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  data;
	output   [0:0]  q;
	output   zero;


	assign
		q = {data[1]},
		zero = (~ (data[0] | data[1]));
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_i0b

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_l0b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [3:0]  data;
	output   [1:0]  q;
	output   zero;

	wire  [0:0]   wire_altpriority_encoder13_q;
	wire  wire_altpriority_encoder13_zero;
	wire  [0:0]   wire_altpriority_encoder14_q;
	wire  wire_altpriority_encoder14_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_i0b   altpriority_encoder13
	( 
	.data(data[1:0]),
	.q(wire_altpriority_encoder13_q),
	.zero(wire_altpriority_encoder13_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_i0b   altpriority_encoder14
	( 
	.data(data[3:2]),
	.q(wire_altpriority_encoder14_q),
	.zero(wire_altpriority_encoder14_zero));
	assign
		q = {(~ wire_altpriority_encoder14_zero), ((wire_altpriority_encoder14_zero & wire_altpriority_encoder13_q) | ((~ wire_altpriority_encoder14_zero) & wire_altpriority_encoder14_q))},
		zero = (wire_altpriority_encoder13_zero & wire_altpriority_encoder14_zero);
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_l0b

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_q0b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;

	wire  [1:0]   wire_altpriority_encoder11_q;
	wire  wire_altpriority_encoder11_zero;
	wire  [1:0]   wire_altpriority_encoder12_q;
	wire  wire_altpriority_encoder12_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_l0b   altpriority_encoder11
	( 
	.data(data[3:0]),
	.q(wire_altpriority_encoder11_q),
	.zero(wire_altpriority_encoder11_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_l0b   altpriority_encoder12
	( 
	.data(data[7:4]),
	.q(wire_altpriority_encoder12_q),
	.zero(wire_altpriority_encoder12_zero));
	assign
		q = {(~ wire_altpriority_encoder12_zero), (({2{wire_altpriority_encoder12_zero}} & wire_altpriority_encoder11_q) | ({2{(~ wire_altpriority_encoder12_zero)}} & wire_altpriority_encoder12_q))},
		zero = (wire_altpriority_encoder11_zero & wire_altpriority_encoder12_zero);
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_q0b


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=8 WIDTHAD=3 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=4 WIDTHAD=2 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=2 WIDTHAD=1 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_iha
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  data;
	output   [0:0]  q;


	assign
		q = {data[1]};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_iha

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_lha
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [3:0]  data;
	output   [1:0]  q;

	wire  [0:0]   wire_altpriority_encoder17_q;
	wire  [0:0]   wire_altpriority_encoder18_q;
	wire  wire_altpriority_encoder18_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_iha   altpriority_encoder17
	( 
	.data(data[1:0]),
	.q(wire_altpriority_encoder17_q));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_i0b   altpriority_encoder18
	( 
	.data(data[3:2]),
	.q(wire_altpriority_encoder18_q),
	.zero(wire_altpriority_encoder18_zero));
	assign
		q = {(~ wire_altpriority_encoder18_zero), ((wire_altpriority_encoder18_zero & wire_altpriority_encoder17_q) | ((~ wire_altpriority_encoder18_zero) & wire_altpriority_encoder18_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_lha

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_qha
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  data;
	output   [2:0]  q;

	wire  [1:0]   wire_altpriority_encoder15_q;
	wire  [1:0]   wire_altpriority_encoder16_q;
	wire  wire_altpriority_encoder16_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_lha   altpriority_encoder15
	( 
	.data(data[3:0]),
	.q(wire_altpriority_encoder15_q));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_l0b   altpriority_encoder16
	( 
	.data(data[7:4]),
	.q(wire_altpriority_encoder16_q),
	.zero(wire_altpriority_encoder16_zero));
	assign
		q = {(~ wire_altpriority_encoder16_zero), (({2{wire_altpriority_encoder16_zero}} & wire_altpriority_encoder15_q) | ({2{(~ wire_altpriority_encoder16_zero)}} & wire_altpriority_encoder16_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_qha

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_aja
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [15:0]  data;
	output   [3:0]  q;

	wire  [2:0]   wire_altpriority_encoder10_q;
	wire  wire_altpriority_encoder10_zero;
	wire  [2:0]   wire_altpriority_encoder9_q;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_q0b   altpriority_encoder10
	( 
	.data(data[15:8]),
	.q(wire_altpriority_encoder10_q),
	.zero(wire_altpriority_encoder10_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_qha   altpriority_encoder9
	( 
	.data(data[7:0]),
	.q(wire_altpriority_encoder9_q));
	assign
		q = {(~ wire_altpriority_encoder10_zero), (({3{wire_altpriority_encoder10_zero}} & wire_altpriority_encoder9_q) | ({3{(~ wire_altpriority_encoder10_zero)}} & wire_altpriority_encoder10_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_aja


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=16 WIDTHAD=4 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_a2b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;

	wire  [2:0]   wire_altpriority_encoder19_q;
	wire  wire_altpriority_encoder19_zero;
	wire  [2:0]   wire_altpriority_encoder20_q;
	wire  wire_altpriority_encoder20_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_q0b   altpriority_encoder19
	( 
	.data(data[7:0]),
	.q(wire_altpriority_encoder19_q),
	.zero(wire_altpriority_encoder19_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_q0b   altpriority_encoder20
	( 
	.data(data[15:8]),
	.q(wire_altpriority_encoder20_q),
	.zero(wire_altpriority_encoder20_zero));
	assign
		q = {(~ wire_altpriority_encoder20_zero), (({3{wire_altpriority_encoder20_zero}} & wire_altpriority_encoder19_q) | ({3{(~ wire_altpriority_encoder20_zero)}} & wire_altpriority_encoder20_q))},
		zero = (wire_altpriority_encoder19_zero & wire_altpriority_encoder20_zero);
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_a2b

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_9u8
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [31:0]  data;
	output   [4:0]  q;

	wire  [3:0]   wire_altpriority_encoder7_q;
	wire  [3:0]   wire_altpriority_encoder8_q;
	wire  wire_altpriority_encoder8_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_aja   altpriority_encoder7
	( 
	.data(data[15:0]),
	.q(wire_altpriority_encoder7_q));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_a2b   altpriority_encoder8
	( 
	.data(data[31:16]),
	.q(wire_altpriority_encoder8_q),
	.zero(wire_altpriority_encoder8_zero));
	assign
		q = {(~ wire_altpriority_encoder8_zero), (({4{wire_altpriority_encoder8_zero}} & wire_altpriority_encoder7_q) | ({4{(~ wire_altpriority_encoder8_zero)}} & wire_altpriority_encoder8_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_9u8


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=32 WIDTHAD=5 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=16 WIDTHAD=4 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=8 WIDTHAD=3 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=4 WIDTHAD=2 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=2 WIDTHAD=1 data q zero
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_64b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  data;
	output   [0:0]  q;
	output   zero;


	assign
		q = {(~ data[0])},
		zero = (~ (data[0] | data[1]));
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_64b

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_94b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [3:0]  data;
	output   [1:0]  q;
	output   zero;

	wire  [0:0]   wire_altpriority_encoder27_q;
	wire  wire_altpriority_encoder27_zero;
	wire  [0:0]   wire_altpriority_encoder28_q;
	wire  wire_altpriority_encoder28_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_64b   altpriority_encoder27
	( 
	.data(data[1:0]),
	.q(wire_altpriority_encoder27_q),
	.zero(wire_altpriority_encoder27_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_64b   altpriority_encoder28
	( 
	.data(data[3:2]),
	.q(wire_altpriority_encoder28_q),
	.zero(wire_altpriority_encoder28_zero));
	assign
		q = {wire_altpriority_encoder27_zero, ((wire_altpriority_encoder27_zero & wire_altpriority_encoder28_q) | ((~ wire_altpriority_encoder27_zero) & wire_altpriority_encoder27_q))},
		zero = (wire_altpriority_encoder27_zero & wire_altpriority_encoder28_zero);
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_94b

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_e4b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;

	wire  [1:0]   wire_altpriority_encoder25_q;
	wire  wire_altpriority_encoder25_zero;
	wire  [1:0]   wire_altpriority_encoder26_q;
	wire  wire_altpriority_encoder26_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_94b   altpriority_encoder25
	( 
	.data(data[3:0]),
	.q(wire_altpriority_encoder25_q),
	.zero(wire_altpriority_encoder25_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_94b   altpriority_encoder26
	( 
	.data(data[7:4]),
	.q(wire_altpriority_encoder26_q),
	.zero(wire_altpriority_encoder26_zero));
	assign
		q = {wire_altpriority_encoder25_zero, (({2{wire_altpriority_encoder25_zero}} & wire_altpriority_encoder26_q) | ({2{(~ wire_altpriority_encoder25_zero)}} & wire_altpriority_encoder25_q))},
		zero = (wire_altpriority_encoder25_zero & wire_altpriority_encoder26_zero);
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_e4b

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_u5b
	( 
	data,
	q,
	zero) /* synthesis synthesis_clearbox=1 */;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;

	wire  [2:0]   wire_altpriority_encoder23_q;
	wire  wire_altpriority_encoder23_zero;
	wire  [2:0]   wire_altpriority_encoder24_q;
	wire  wire_altpriority_encoder24_zero;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_e4b   altpriority_encoder23
	( 
	.data(data[7:0]),
	.q(wire_altpriority_encoder23_q),
	.zero(wire_altpriority_encoder23_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_e4b   altpriority_encoder24
	( 
	.data(data[15:8]),
	.q(wire_altpriority_encoder24_q),
	.zero(wire_altpriority_encoder24_zero));
	assign
		q = {wire_altpriority_encoder23_zero, (({3{wire_altpriority_encoder23_zero}} & wire_altpriority_encoder24_q) | ({3{(~ wire_altpriority_encoder23_zero)}} & wire_altpriority_encoder23_q))},
		zero = (wire_altpriority_encoder23_zero & wire_altpriority_encoder24_zero);
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_u5b


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=16 WIDTHAD=4 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=8 WIDTHAD=3 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=4 WIDTHAD=2 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END


//altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=2 WIDTHAD=1 data q
//VERSION_BEGIN 10.1 cbx_altpriority_encoder 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_6la
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  data;
	output   [0:0]  q;


	assign
		q = {(~ data[0])};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_6la

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_9la
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [3:0]  data;
	output   [1:0]  q;

	wire  [0:0]   wire_altpriority_encoder33_q;
	wire  wire_altpriority_encoder33_zero;
	wire  [0:0]   wire_altpriority_encoder34_q;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_64b   altpriority_encoder33
	( 
	.data(data[1:0]),
	.q(wire_altpriority_encoder33_q),
	.zero(wire_altpriority_encoder33_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_6la   altpriority_encoder34
	( 
	.data(data[3:2]),
	.q(wire_altpriority_encoder34_q));
	assign
		q = {wire_altpriority_encoder33_zero, ((wire_altpriority_encoder33_zero & wire_altpriority_encoder34_q) | ((~ wire_altpriority_encoder33_zero) & wire_altpriority_encoder33_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_9la

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_ela
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  data;
	output   [2:0]  q;

	wire  [1:0]   wire_altpriority_encoder31_q;
	wire  wire_altpriority_encoder31_zero;
	wire  [1:0]   wire_altpriority_encoder32_q;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_94b   altpriority_encoder31
	( 
	.data(data[3:0]),
	.q(wire_altpriority_encoder31_q),
	.zero(wire_altpriority_encoder31_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_9la   altpriority_encoder32
	( 
	.data(data[7:4]),
	.q(wire_altpriority_encoder32_q));
	assign
		q = {wire_altpriority_encoder31_zero, (({2{wire_altpriority_encoder31_zero}} & wire_altpriority_encoder32_q) | ({2{(~ wire_altpriority_encoder31_zero)}} & wire_altpriority_encoder31_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_ela

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_uma
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [15:0]  data;
	output   [3:0]  q;

	wire  [2:0]   wire_altpriority_encoder29_q;
	wire  wire_altpriority_encoder29_zero;
	wire  [2:0]   wire_altpriority_encoder30_q;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_e4b   altpriority_encoder29
	( 
	.data(data[7:0]),
	.q(wire_altpriority_encoder29_q),
	.zero(wire_altpriority_encoder29_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_ela   altpriority_encoder30
	( 
	.data(data[15:8]),
	.q(wire_altpriority_encoder30_q));
	assign
		q = {wire_altpriority_encoder29_zero, (({3{wire_altpriority_encoder29_zero}} & wire_altpriority_encoder30_q) | ({3{(~ wire_altpriority_encoder29_zero)}} & wire_altpriority_encoder29_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_uma

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single_altpriority_encoder_tma
	( 
	data,
	q) /* synthesis synthesis_clearbox=1 */;
	input   [31:0]  data;
	output   [4:0]  q;

	wire  [3:0]   wire_altpriority_encoder21_q;
	wire  wire_altpriority_encoder21_zero;
	wire  [3:0]   wire_altpriority_encoder22_q;

	fpoint_hw_qsys_addsub_single_altpriority_encoder_u5b   altpriority_encoder21
	( 
	.data(data[15:0]),
	.q(wire_altpriority_encoder21_q),
	.zero(wire_altpriority_encoder21_zero));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_uma   altpriority_encoder22
	( 
	.data(data[31:16]),
	.q(wire_altpriority_encoder22_q));
	assign
		q = {wire_altpriority_encoder21_zero, (({4{wire_altpriority_encoder21_zero}} & wire_altpriority_encoder22_q) | ({4{(~ wire_altpriority_encoder21_zero)}} & wire_altpriority_encoder21_q))};
endmodule //fpoint_hw_qsys_addsub_single_altpriority_encoder_tma

//synthesis_resources = lpm_add_sub 14 lpm_compare 1 reg 356 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_addsub_single
	( 
	aclr,
	add_sub,
	clk_en,
	clock,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   add_sub;
	input   clk_en;
	input   clock;
	input   [31:0]  dataa;
	input   [31:0]  datab;
	output   [31:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   add_sub;
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [25:0]   wire_lbarrel_shift_result;
	wire  [25:0]   wire_rbarrel_shift_result;
	wire  [4:0]   wire_leading_zeroes_cnt_q;
	wire  [4:0]   wire_trailing_zeros_cnt_q;
	reg	add_sub_dffe1;
	reg	add_sub_dffe12;
	reg	[8:0]	aligned_dataa_exp_dffe12;
	reg	[23:0]	aligned_dataa_man_dffe12;
	reg	aligned_dataa_sign_dffe12;
	reg	[8:0]	aligned_datab_exp_dffe12;
	reg	[23:0]	aligned_datab_man_dffe12;
	reg	aligned_datab_sign_dffe12;
	reg	both_inputs_are_infinite_dffe1;
	reg	[7:0]	data_exp_dffe1;
	reg	[25:0]	dataa_man_dffe1;
	reg	dataa_sign_dffe1;
	reg	[25:0]	datab_man_dffe1;
	reg	datab_sign_dffe1;
	reg	denormal_res_dffe3;
	reg	denormal_res_dffe4;
	reg	[1:0]	exp_adj_dffe21;
	reg	[7:0]	exp_out_dffe5;
	reg	[7:0]	exp_res_dffe2;
	reg	[7:0]	exp_res_dffe21;
	reg	[7:0]	exp_res_dffe3;
	reg	[7:0]	exp_res_dffe4;
	reg	infinite_output_sign_dffe1;
	reg	infinite_output_sign_dffe2;
	reg	infinite_output_sign_dffe21;
	reg	infinite_output_sign_dffe3;
	reg	infinite_output_sign_dffe31;
	reg	infinite_output_sign_dffe4;
	reg	infinite_res_dffe3;
	reg	infinite_res_dffe4;
	reg	infinity_magnitude_sub_dffe2;
	reg	infinity_magnitude_sub_dffe21;
	reg	infinity_magnitude_sub_dffe3;
	reg	infinity_magnitude_sub_dffe31;
	reg	infinity_magnitude_sub_dffe4;
	reg	input_dataa_infinite_dffe12;
	reg	input_dataa_nan_dffe12;
	reg	input_datab_infinite_dffe12;
	reg	input_datab_nan_dffe12;
	reg	input_is_infinite_dffe1;
	reg	input_is_infinite_dffe2;
	reg	input_is_infinite_dffe21;
	reg	input_is_infinite_dffe3;
	reg	input_is_infinite_dffe31;
	reg	input_is_infinite_dffe4;
	reg	input_is_nan_dffe1;
	reg	input_is_nan_dffe2;
	reg	input_is_nan_dffe21;
	reg	input_is_nan_dffe3;
	reg	input_is_nan_dffe31;
	reg	input_is_nan_dffe4;
	reg	[25:0]	man_add_sub_res_mag_dffe21;
	reg	man_add_sub_res_sign_dffe21;
	reg	[25:0]	man_dffe31;
	reg	[4:0]	man_leading_zeros_dffe31;
	reg	[22:0]	man_out_dffe5;
	reg	[22:0]	man_res_dffe4;
	reg	man_res_is_not_zero_dffe3;
	reg	man_res_is_not_zero_dffe31;
	reg	man_res_is_not_zero_dffe4;
	reg	need_complement_dffe2;
	reg	round_bit_dffe21;
	reg	round_bit_dffe3;
	reg	round_bit_dffe31;
	reg	rounded_res_infinity_dffe4;
	reg	sign_dffe31;
	reg	sign_out_dffe5;
	reg	sign_res_dffe3;
	reg	sign_res_dffe4;
	reg	sticky_bit_dffe1;
	reg	sticky_bit_dffe2;
	reg	sticky_bit_dffe21;
	reg	sticky_bit_dffe3;
	reg	sticky_bit_dffe31;
	reg	zero_man_sign_dffe2;
	reg	zero_man_sign_dffe21;
	wire  [8:0]   wire_add_sub1_result;
	wire  [8:0]   wire_add_sub2_result;
	wire  [5:0]   wire_add_sub3_result;
	wire  [8:0]   wire_add_sub4_result;
	wire  [8:0]   wire_add_sub5_result;
	wire  [8:0]   wire_add_sub6_result;
	wire  wire_man_2comp_res_lower_cout;
	wire  [13:0]   wire_man_2comp_res_lower_result;
	wire  [13:0]   wire_man_2comp_res_upper0_result;
	wire  [13:0]   wire_man_2comp_res_upper1_result;
	wire  wire_man_add_sub_lower_cout;
	wire  [13:0]   wire_man_add_sub_lower_result;
	wire  [13:0]   wire_man_add_sub_upper0_result;
	wire  [13:0]   wire_man_add_sub_upper1_result;
	wire  wire_man_res_rounding_add_sub_lower_cout;
	wire  [12:0]   wire_man_res_rounding_add_sub_lower_result;
	wire  [12:0]   wire_man_res_rounding_add_sub_upper1_result;
	wire  wire_trailing_zeros_limit_comparator_agb;
	wire  add_sub_dffe11_wi;
	wire  add_sub_dffe11_wo;
	wire  add_sub_dffe12_wi;
	wire  add_sub_dffe12_wo;
	wire  add_sub_dffe13_wi;
	wire  add_sub_dffe13_wo;
	wire  add_sub_dffe14_wi;
	wire  add_sub_dffe14_wo;
	wire  add_sub_dffe15_wi;
	wire  add_sub_dffe15_wo;
	wire  add_sub_dffe1_wi;
	wire  add_sub_dffe1_wo;
	wire  add_sub_dffe25_wi;
	wire  add_sub_dffe25_wo;
	wire  add_sub_w2;
	wire  [12:0]  adder_upper_w;
	wire  [8:0]  aligned_dataa_exp_dffe12_wi;
	wire  [8:0]  aligned_dataa_exp_dffe12_wo;
	wire  [8:0]  aligned_dataa_exp_dffe13_wi;
	wire  [8:0]  aligned_dataa_exp_dffe13_wo;
	wire  [8:0]  aligned_dataa_exp_dffe14_wi;
	wire  [8:0]  aligned_dataa_exp_dffe14_wo;
	wire  [8:0]  aligned_dataa_exp_dffe15_wi;
	wire  [8:0]  aligned_dataa_exp_dffe15_wo;
	wire  [8:0]  aligned_dataa_exp_w;
	wire  [23:0]  aligned_dataa_man_dffe12_wi;
	wire  [23:0]  aligned_dataa_man_dffe12_wo;
	wire  [23:0]  aligned_dataa_man_dffe13_wi;
	wire  [23:0]  aligned_dataa_man_dffe13_wo;
	wire  [23:0]  aligned_dataa_man_dffe14_wi;
	wire  [23:0]  aligned_dataa_man_dffe14_wo;
	wire  [25:0]  aligned_dataa_man_dffe15_w;
	wire  [23:0]  aligned_dataa_man_dffe15_wi;
	wire  [23:0]  aligned_dataa_man_dffe15_wo;
	wire  [25:0]  aligned_dataa_man_w;
	wire  aligned_dataa_sign_dffe12_wi;
	wire  aligned_dataa_sign_dffe12_wo;
	wire  aligned_dataa_sign_dffe13_wi;
	wire  aligned_dataa_sign_dffe13_wo;
	wire  aligned_dataa_sign_dffe14_wi;
	wire  aligned_dataa_sign_dffe14_wo;
	wire  aligned_dataa_sign_dffe15_wi;
	wire  aligned_dataa_sign_dffe15_wo;
	wire  aligned_dataa_sign_w;
	wire  [8:0]  aligned_datab_exp_dffe12_wi;
	wire  [8:0]  aligned_datab_exp_dffe12_wo;
	wire  [8:0]  aligned_datab_exp_dffe13_wi;
	wire  [8:0]  aligned_datab_exp_dffe13_wo;
	wire  [8:0]  aligned_datab_exp_dffe14_wi;
	wire  [8:0]  aligned_datab_exp_dffe14_wo;
	wire  [8:0]  aligned_datab_exp_dffe15_wi;
	wire  [8:0]  aligned_datab_exp_dffe15_wo;
	wire  [8:0]  aligned_datab_exp_w;
	wire  [23:0]  aligned_datab_man_dffe12_wi;
	wire  [23:0]  aligned_datab_man_dffe12_wo;
	wire  [23:0]  aligned_datab_man_dffe13_wi;
	wire  [23:0]  aligned_datab_man_dffe13_wo;
	wire  [23:0]  aligned_datab_man_dffe14_wi;
	wire  [23:0]  aligned_datab_man_dffe14_wo;
	wire  [25:0]  aligned_datab_man_dffe15_w;
	wire  [23:0]  aligned_datab_man_dffe15_wi;
	wire  [23:0]  aligned_datab_man_dffe15_wo;
	wire  [25:0]  aligned_datab_man_w;
	wire  aligned_datab_sign_dffe12_wi;
	wire  aligned_datab_sign_dffe12_wo;
	wire  aligned_datab_sign_dffe13_wi;
	wire  aligned_datab_sign_dffe13_wo;
	wire  aligned_datab_sign_dffe14_wi;
	wire  aligned_datab_sign_dffe14_wo;
	wire  aligned_datab_sign_dffe15_wi;
	wire  aligned_datab_sign_dffe15_wo;
	wire  aligned_datab_sign_w;
	wire  borrow_w;
	wire  both_inputs_are_infinite_dffe1_wi;
	wire  both_inputs_are_infinite_dffe1_wo;
	wire  both_inputs_are_infinite_dffe25_wi;
	wire  both_inputs_are_infinite_dffe25_wo;
	wire  [7:0]  data_exp_dffe1_wi;
	wire  [7:0]  data_exp_dffe1_wo;
	wire  [31:0]  dataa_dffe11_wi;
	wire  [31:0]  dataa_dffe11_wo;
	wire  [25:0]  dataa_man_dffe1_wi;
	wire  [25:0]  dataa_man_dffe1_wo;
	wire  dataa_sign_dffe1_wi;
	wire  dataa_sign_dffe1_wo;
	wire  dataa_sign_dffe25_wi;
	wire  dataa_sign_dffe25_wo;
	wire  [31:0]  datab_dffe11_wi;
	wire  [31:0]  datab_dffe11_wo;
	wire  [25:0]  datab_man_dffe1_wi;
	wire  [25:0]  datab_man_dffe1_wo;
	wire  datab_sign_dffe1_wi;
	wire  datab_sign_dffe1_wo;
	wire  denormal_flag_w;
	wire  denormal_res_dffe32_wi;
	wire  denormal_res_dffe32_wo;
	wire  denormal_res_dffe33_wi;
	wire  denormal_res_dffe33_wo;
	wire  denormal_res_dffe3_wi;
	wire  denormal_res_dffe3_wo;
	wire  denormal_res_dffe41_wi;
	wire  denormal_res_dffe41_wo;
	wire  denormal_res_dffe42_wi;
	wire  denormal_res_dffe42_wo;
	wire  denormal_res_dffe4_wi;
	wire  denormal_res_dffe4_wo;
	wire  denormal_result_w;
	wire  [7:0]  exp_a_all_one_w;
	wire  [7:0]  exp_a_not_zero_w;
	wire  [6:0]  exp_adj_0pads;
	wire  [1:0]  exp_adj_dffe21_wi;
	wire  [1:0]  exp_adj_dffe21_wo;
	wire  [1:0]  exp_adj_dffe23_wi;
	wire  [1:0]  exp_adj_dffe23_wo;
	wire  [1:0]  exp_adj_dffe26_wi;
	wire  [1:0]  exp_adj_dffe26_wo;
	wire  [1:0]  exp_adjust_by_add1;
	wire  [1:0]  exp_adjust_by_add2;
	wire  [8:0]  exp_adjustment2_add_sub_dataa_w;
	wire  [8:0]  exp_adjustment2_add_sub_datab_w;
	wire  [8:0]  exp_adjustment2_add_sub_w;
	wire  [8:0]  exp_adjustment_add_sub_dataa_w;
	wire  [8:0]  exp_adjustment_add_sub_datab_w;
	wire  [8:0]  exp_adjustment_add_sub_w;
	wire  [7:0]  exp_all_ones_w;
	wire  [7:0]  exp_all_zeros_w;
	wire  exp_amb_mux_dffe13_wi;
	wire  exp_amb_mux_dffe13_wo;
	wire  exp_amb_mux_dffe14_wi;
	wire  exp_amb_mux_dffe14_wo;
	wire  exp_amb_mux_dffe15_wi;
	wire  exp_amb_mux_dffe15_wo;
	wire  exp_amb_mux_w;
	wire  [8:0]  exp_amb_w;
	wire  [7:0]  exp_b_all_one_w;
	wire  [7:0]  exp_b_not_zero_w;
	wire  [8:0]  exp_bma_w;
	wire  [2:0]  exp_diff_abs_exceed_max_w;
	wire  [4:0]  exp_diff_abs_max_w;
	wire  [7:0]  exp_diff_abs_w;
	wire  [7:0]  exp_intermediate_res_dffe41_wi;
	wire  [7:0]  exp_intermediate_res_dffe41_wo;
	wire  [7:0]  exp_intermediate_res_dffe42_wi;
	wire  [7:0]  exp_intermediate_res_dffe42_wo;
	wire  [7:0]  exp_intermediate_res_w;
	wire  [7:0]  exp_out_dffe5_wi;
	wire  [7:0]  exp_out_dffe5_wo;
	wire  [7:0]  exp_res_dffe21_wi;
	wire  [7:0]  exp_res_dffe21_wo;
	wire  [7:0]  exp_res_dffe22_wi;
	wire  [7:0]  exp_res_dffe22_wo;
	wire  [7:0]  exp_res_dffe23_wi;
	wire  [7:0]  exp_res_dffe23_wo;
	wire  [7:0]  exp_res_dffe25_wi;
	wire  [7:0]  exp_res_dffe25_wo;
	wire  [7:0]  exp_res_dffe26_wi;
	wire  [7:0]  exp_res_dffe26_wo;
	wire  [7:0]  exp_res_dffe27_wi;
	wire  [7:0]  exp_res_dffe27_wo;
	wire  [7:0]  exp_res_dffe2_wi;
	wire  [7:0]  exp_res_dffe2_wo;
	wire  [7:0]  exp_res_dffe32_wi;
	wire  [7:0]  exp_res_dffe32_wo;
	wire  [7:0]  exp_res_dffe33_wi;
	wire  [7:0]  exp_res_dffe33_wo;
	wire  [7:0]  exp_res_dffe3_wi;
	wire  [7:0]  exp_res_dffe3_wo;
	wire  [7:0]  exp_res_dffe4_wi;
	wire  [7:0]  exp_res_dffe4_wo;
	wire  [7:0]  exp_res_max_w;
	wire  [8:0]  exp_res_not_zero_w;
	wire  [8:0]  exp_res_rounding_adder_dataa_w;
	wire  [8:0]  exp_res_rounding_adder_w;
	wire  exp_rounded_res_infinity_w;
	wire  [7:0]  exp_rounded_res_max_w;
	wire  [7:0]  exp_rounded_res_w;
	wire  [8:0]  exp_rounding_adjustment_w;
	wire  [8:0]  exp_value;
	wire  force_infinity_w;
	wire  force_nan_w;
	wire  force_zero_w;
	wire  guard_bit_dffe3_wo;
	wire  infinite_output_sign_dffe1_wi;
	wire  infinite_output_sign_dffe1_wo;
	wire  infinite_output_sign_dffe21_wi;
	wire  infinite_output_sign_dffe21_wo;
	wire  infinite_output_sign_dffe22_wi;
	wire  infinite_output_sign_dffe22_wo;
	wire  infinite_output_sign_dffe23_wi;
	wire  infinite_output_sign_dffe23_wo;
	wire  infinite_output_sign_dffe25_wi;
	wire  infinite_output_sign_dffe25_wo;
	wire  infinite_output_sign_dffe26_wi;
	wire  infinite_output_sign_dffe26_wo;
	wire  infinite_output_sign_dffe27_wi;
	wire  infinite_output_sign_dffe27_wo;
	wire  infinite_output_sign_dffe2_wi;
	wire  infinite_output_sign_dffe2_wo;
	wire  infinite_output_sign_dffe31_wi;
	wire  infinite_output_sign_dffe31_wo;
	wire  infinite_output_sign_dffe32_wi;
	wire  infinite_output_sign_dffe32_wo;
	wire  infinite_output_sign_dffe33_wi;
	wire  infinite_output_sign_dffe33_wo;
	wire  infinite_output_sign_dffe3_wi;
	wire  infinite_output_sign_dffe3_wo;
	wire  infinite_output_sign_dffe41_wi;
	wire  infinite_output_sign_dffe41_wo;
	wire  infinite_output_sign_dffe42_wi;
	wire  infinite_output_sign_dffe42_wo;
	wire  infinite_output_sign_dffe4_wi;
	wire  infinite_output_sign_dffe4_wo;
	wire  infinite_res_dff32_wi;
	wire  infinite_res_dff32_wo;
	wire  infinite_res_dff33_wi;
	wire  infinite_res_dff33_wo;
	wire  infinite_res_dffe3_wi;
	wire  infinite_res_dffe3_wo;
	wire  infinite_res_dffe41_wi;
	wire  infinite_res_dffe41_wo;
	wire  infinite_res_dffe42_wi;
	wire  infinite_res_dffe42_wo;
	wire  infinite_res_dffe4_wi;
	wire  infinite_res_dffe4_wo;
	wire  infinity_magnitude_sub_dffe21_wi;
	wire  infinity_magnitude_sub_dffe21_wo;
	wire  infinity_magnitude_sub_dffe22_wi;
	wire  infinity_magnitude_sub_dffe22_wo;
	wire  infinity_magnitude_sub_dffe23_wi;
	wire  infinity_magnitude_sub_dffe23_wo;
	wire  infinity_magnitude_sub_dffe26_wi;
	wire  infinity_magnitude_sub_dffe26_wo;
	wire  infinity_magnitude_sub_dffe27_wi;
	wire  infinity_magnitude_sub_dffe27_wo;
	wire  infinity_magnitude_sub_dffe2_wi;
	wire  infinity_magnitude_sub_dffe2_wo;
	wire  infinity_magnitude_sub_dffe31_wi;
	wire  infinity_magnitude_sub_dffe31_wo;
	wire  infinity_magnitude_sub_dffe32_wi;
	wire  infinity_magnitude_sub_dffe32_wo;
	wire  infinity_magnitude_sub_dffe33_wi;
	wire  infinity_magnitude_sub_dffe33_wo;
	wire  infinity_magnitude_sub_dffe3_wi;
	wire  infinity_magnitude_sub_dffe3_wo;
	wire  infinity_magnitude_sub_dffe41_wi;
	wire  infinity_magnitude_sub_dffe41_wo;
	wire  infinity_magnitude_sub_dffe42_wi;
	wire  infinity_magnitude_sub_dffe42_wo;
	wire  infinity_magnitude_sub_dffe4_wi;
	wire  infinity_magnitude_sub_dffe4_wo;
	wire  input_dataa_denormal_dffe11_wi;
	wire  input_dataa_denormal_dffe11_wo;
	wire  input_dataa_denormal_w;
	wire  input_dataa_infinite_dffe11_wi;
	wire  input_dataa_infinite_dffe11_wo;
	wire  input_dataa_infinite_dffe12_wi;
	wire  input_dataa_infinite_dffe12_wo;
	wire  input_dataa_infinite_dffe13_wi;
	wire  input_dataa_infinite_dffe13_wo;
	wire  input_dataa_infinite_dffe14_wi;
	wire  input_dataa_infinite_dffe14_wo;
	wire  input_dataa_infinite_dffe15_wi;
	wire  input_dataa_infinite_dffe15_wo;
	wire  input_dataa_infinite_w;
	wire  input_dataa_nan_dffe11_wi;
	wire  input_dataa_nan_dffe11_wo;
	wire  input_dataa_nan_dffe12_wi;
	wire  input_dataa_nan_dffe12_wo;
	wire  input_dataa_nan_w;
	wire  input_dataa_zero_dffe11_wi;
	wire  input_dataa_zero_dffe11_wo;
	wire  input_dataa_zero_w;
	wire  input_datab_denormal_dffe11_wi;
	wire  input_datab_denormal_dffe11_wo;
	wire  input_datab_denormal_w;
	wire  input_datab_infinite_dffe11_wi;
	wire  input_datab_infinite_dffe11_wo;
	wire  input_datab_infinite_dffe12_wi;
	wire  input_datab_infinite_dffe12_wo;
	wire  input_datab_infinite_dffe13_wi;
	wire  input_datab_infinite_dffe13_wo;
	wire  input_datab_infinite_dffe14_wi;
	wire  input_datab_infinite_dffe14_wo;
	wire  input_datab_infinite_dffe15_wi;
	wire  input_datab_infinite_dffe15_wo;
	wire  input_datab_infinite_w;
	wire  input_datab_nan_dffe11_wi;
	wire  input_datab_nan_dffe11_wo;
	wire  input_datab_nan_dffe12_wi;
	wire  input_datab_nan_dffe12_wo;
	wire  input_datab_nan_w;
	wire  input_datab_zero_dffe11_wi;
	wire  input_datab_zero_dffe11_wo;
	wire  input_datab_zero_w;
	wire  input_is_infinite_dffe1_wi;
	wire  input_is_infinite_dffe1_wo;
	wire  input_is_infinite_dffe21_wi;
	wire  input_is_infinite_dffe21_wo;
	wire  input_is_infinite_dffe22_wi;
	wire  input_is_infinite_dffe22_wo;
	wire  input_is_infinite_dffe23_wi;
	wire  input_is_infinite_dffe23_wo;
	wire  input_is_infinite_dffe25_wi;
	wire  input_is_infinite_dffe25_wo;
	wire  input_is_infinite_dffe26_wi;
	wire  input_is_infinite_dffe26_wo;
	wire  input_is_infinite_dffe27_wi;
	wire  input_is_infinite_dffe27_wo;
	wire  input_is_infinite_dffe2_wi;
	wire  input_is_infinite_dffe2_wo;
	wire  input_is_infinite_dffe31_wi;
	wire  input_is_infinite_dffe31_wo;
	wire  input_is_infinite_dffe32_wi;
	wire  input_is_infinite_dffe32_wo;
	wire  input_is_infinite_dffe33_wi;
	wire  input_is_infinite_dffe33_wo;
	wire  input_is_infinite_dffe3_wi;
	wire  input_is_infinite_dffe3_wo;
	wire  input_is_infinite_dffe41_wi;
	wire  input_is_infinite_dffe41_wo;
	wire  input_is_infinite_dffe42_wi;
	wire  input_is_infinite_dffe42_wo;
	wire  input_is_infinite_dffe4_wi;
	wire  input_is_infinite_dffe4_wo;
	wire  input_is_nan_dffe13_wi;
	wire  input_is_nan_dffe13_wo;
	wire  input_is_nan_dffe14_wi;
	wire  input_is_nan_dffe14_wo;
	wire  input_is_nan_dffe15_wi;
	wire  input_is_nan_dffe15_wo;
	wire  input_is_nan_dffe1_wi;
	wire  input_is_nan_dffe1_wo;
	wire  input_is_nan_dffe21_wi;
	wire  input_is_nan_dffe21_wo;
	wire  input_is_nan_dffe22_wi;
	wire  input_is_nan_dffe22_wo;
	wire  input_is_nan_dffe23_wi;
	wire  input_is_nan_dffe23_wo;
	wire  input_is_nan_dffe25_wi;
	wire  input_is_nan_dffe25_wo;
	wire  input_is_nan_dffe26_wi;
	wire  input_is_nan_dffe26_wo;
	wire  input_is_nan_dffe27_wi;
	wire  input_is_nan_dffe27_wo;
	wire  input_is_nan_dffe2_wi;
	wire  input_is_nan_dffe2_wo;
	wire  input_is_nan_dffe31_wi;
	wire  input_is_nan_dffe31_wo;
	wire  input_is_nan_dffe32_wi;
	wire  input_is_nan_dffe32_wo;
	wire  input_is_nan_dffe33_wi;
	wire  input_is_nan_dffe33_wo;
	wire  input_is_nan_dffe3_wi;
	wire  input_is_nan_dffe3_wo;
	wire  input_is_nan_dffe41_wi;
	wire  input_is_nan_dffe41_wo;
	wire  input_is_nan_dffe42_wi;
	wire  input_is_nan_dffe42_wo;
	wire  input_is_nan_dffe4_wi;
	wire  input_is_nan_dffe4_wo;
	wire  [27:0]  man_2comp_res_dataa_w;
	wire  [27:0]  man_2comp_res_datab_w;
	wire  [27:0]  man_2comp_res_w;
	wire  [22:0]  man_a_not_zero_w;
	wire  [27:0]  man_add_sub_dataa_w;
	wire  [27:0]  man_add_sub_datab_w;
	wire  [25:0]  man_add_sub_res_mag_dffe21_wi;
	wire  [25:0]  man_add_sub_res_mag_dffe21_wo;
	wire  [25:0]  man_add_sub_res_mag_dffe23_wi;
	wire  [25:0]  man_add_sub_res_mag_dffe23_wo;
	wire  [25:0]  man_add_sub_res_mag_dffe26_wi;
	wire  [25:0]  man_add_sub_res_mag_dffe26_wo;
	wire  [27:0]  man_add_sub_res_mag_dffe27_wi;
	wire  [27:0]  man_add_sub_res_mag_dffe27_wo;
	wire  [27:0]  man_add_sub_res_mag_w2;
	wire  man_add_sub_res_sign_dffe21_wo;
	wire  man_add_sub_res_sign_dffe23_wi;
	wire  man_add_sub_res_sign_dffe23_wo;
	wire  man_add_sub_res_sign_dffe26_wi;
	wire  man_add_sub_res_sign_dffe26_wo;
	wire  man_add_sub_res_sign_dffe27_wi;
	wire  man_add_sub_res_sign_dffe27_wo;
	wire  man_add_sub_res_sign_w2;
	wire  [27:0]  man_add_sub_w;
	wire  [22:0]  man_all_zeros_w;
	wire  [22:0]  man_b_not_zero_w;
	wire  [25:0]  man_dffe31_wo;
	wire  [25:0]  man_intermediate_res_w;
	wire  [4:0]  man_leading_zeros_cnt_w;
	wire  [4:0]  man_leading_zeros_dffe31_wi;
	wire  [4:0]  man_leading_zeros_dffe31_wo;
	wire  [22:0]  man_nan_w;
	wire  [22:0]  man_out_dffe5_wi;
	wire  [22:0]  man_out_dffe5_wo;
	wire  [22:0]  man_res_dffe4_wi;
	wire  [22:0]  man_res_dffe4_wo;
	wire  man_res_is_not_zero_dffe31_wi;
	wire  man_res_is_not_zero_dffe31_wo;
	wire  man_res_is_not_zero_dffe32_wi;
	wire  man_res_is_not_zero_dffe32_wo;
	wire  man_res_is_not_zero_dffe33_wi;
	wire  man_res_is_not_zero_dffe33_wo;
	wire  man_res_is_not_zero_dffe3_wi;
	wire  man_res_is_not_zero_dffe3_wo;
	wire  man_res_is_not_zero_dffe41_wi;
	wire  man_res_is_not_zero_dffe41_wo;
	wire  man_res_is_not_zero_dffe42_wi;
	wire  man_res_is_not_zero_dffe42_wo;
	wire  man_res_is_not_zero_dffe4_wi;
	wire  man_res_is_not_zero_dffe4_wo;
	wire  [25:0]  man_res_mag_w2;
	wire  man_res_not_zero_dffe23_wi;
	wire  man_res_not_zero_dffe23_wo;
	wire  man_res_not_zero_dffe26_wi;
	wire  man_res_not_zero_dffe26_wo;
	wire  [24:0]  man_res_not_zero_w2;
	wire  [25:0]  man_res_rounding_add_sub_datab_w;
	wire  [25:0]  man_res_rounding_add_sub_w;
	wire  [23:0]  man_res_w3;
	wire  [22:0]  man_rounded_res_w;
	wire  man_rounding_add_value_w;
	wire  [23:0]  man_smaller_dffe13_wi;
	wire  [23:0]  man_smaller_dffe13_wo;
	wire  [23:0]  man_smaller_w;
	wire  need_complement_dffe22_wi;
	wire  need_complement_dffe22_wo;
	wire  need_complement_dffe2_wi;
	wire  need_complement_dffe2_wo;
	wire  [1:0]  pos_sign_bit_ext;
	wire  [3:0]  priority_encoder_1pads_w;
	wire  round_bit_dffe21_wi;
	wire  round_bit_dffe21_wo;
	wire  round_bit_dffe23_wi;
	wire  round_bit_dffe23_wo;
	wire  round_bit_dffe26_wi;
	wire  round_bit_dffe26_wo;
	wire  round_bit_dffe31_wi;
	wire  round_bit_dffe31_wo;
	wire  round_bit_dffe32_wi;
	wire  round_bit_dffe32_wo;
	wire  round_bit_dffe33_wi;
	wire  round_bit_dffe33_wo;
	wire  round_bit_dffe3_wi;
	wire  round_bit_dffe3_wo;
	wire  round_bit_w;
	wire  rounded_res_infinity_dffe4_wi;
	wire  rounded_res_infinity_dffe4_wo;
	wire  [4:0]  rshift_distance_dffe13_wi;
	wire  [4:0]  rshift_distance_dffe13_wo;
	wire  [4:0]  rshift_distance_dffe14_wi;
	wire  [4:0]  rshift_distance_dffe14_wo;
	wire  [4:0]  rshift_distance_dffe15_wi;
	wire  [4:0]  rshift_distance_dffe15_wo;
	wire  [4:0]  rshift_distance_w;
	wire  sign_dffe31_wi;
	wire  sign_dffe31_wo;
	wire  sign_dffe32_wi;
	wire  sign_dffe32_wo;
	wire  sign_dffe33_wi;
	wire  sign_dffe33_wo;
	wire  sign_out_dffe5_wi;
	wire  sign_out_dffe5_wo;
	wire  sign_res_dffe3_wi;
	wire  sign_res_dffe3_wo;
	wire  sign_res_dffe41_wi;
	wire  sign_res_dffe41_wo;
	wire  sign_res_dffe42_wi;
	wire  sign_res_dffe42_wo;
	wire  sign_res_dffe4_wi;
	wire  sign_res_dffe4_wo;
	wire  [5:0]  sticky_bit_cnt_dataa_w;
	wire  [5:0]  sticky_bit_cnt_datab_w;
	wire  [5:0]  sticky_bit_cnt_res_w;
	wire  sticky_bit_dffe1_wi;
	wire  sticky_bit_dffe1_wo;
	wire  sticky_bit_dffe21_wi;
	wire  sticky_bit_dffe21_wo;
	wire  sticky_bit_dffe22_wi;
	wire  sticky_bit_dffe22_wo;
	wire  sticky_bit_dffe23_wi;
	wire  sticky_bit_dffe23_wo;
	wire  sticky_bit_dffe25_wi;
	wire  sticky_bit_dffe25_wo;
	wire  sticky_bit_dffe26_wi;
	wire  sticky_bit_dffe26_wo;
	wire  sticky_bit_dffe27_wi;
	wire  sticky_bit_dffe27_wo;
	wire  sticky_bit_dffe2_wi;
	wire  sticky_bit_dffe2_wo;
	wire  sticky_bit_dffe31_wi;
	wire  sticky_bit_dffe31_wo;
	wire  sticky_bit_dffe32_wi;
	wire  sticky_bit_dffe32_wo;
	wire  sticky_bit_dffe33_wi;
	wire  sticky_bit_dffe33_wo;
	wire  sticky_bit_dffe3_wi;
	wire  sticky_bit_dffe3_wo;
	wire  sticky_bit_w;
	wire  [5:0]  trailing_zeros_limit_w;
	wire  zero_man_sign_dffe21_wi;
	wire  zero_man_sign_dffe21_wo;
	wire  zero_man_sign_dffe22_wi;
	wire  zero_man_sign_dffe22_wo;
	wire  zero_man_sign_dffe23_wi;
	wire  zero_man_sign_dffe23_wo;
	wire  zero_man_sign_dffe26_wi;
	wire  zero_man_sign_dffe26_wo;
	wire  zero_man_sign_dffe27_wi;
	wire  zero_man_sign_dffe27_wo;
	wire  zero_man_sign_dffe2_wi;
	wire  zero_man_sign_dffe2_wo;

	fpoint_hw_qsys_addsub_single_altbarrel_shift_fjg   lbarrel_shift
	( 
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data(man_dffe31_wo),
	.distance(man_leading_zeros_cnt_w),
	.result(wire_lbarrel_shift_result));
	fpoint_hw_qsys_addsub_single_altbarrel_shift_44e   rbarrel_shift
	( 
	.data({man_smaller_dffe13_wo, {2{1'b0}}}),
	.distance(rshift_distance_dffe13_wo),
	.result(wire_rbarrel_shift_result));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_9u8   leading_zeroes_cnt
	( 
	.data({man_add_sub_res_mag_dffe21_wo[25:1], 1'b1, {6{1'b0}}}),
	.q(wire_leading_zeroes_cnt_q));
	fpoint_hw_qsys_addsub_single_altpriority_encoder_tma   trailing_zeros_cnt
	( 
	.data({{9{1'b1}}, man_smaller_dffe13_wo[22:0]}),
	.q(wire_trailing_zeros_cnt_q));
	// synopsys translate_off
	initial
		add_sub_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) add_sub_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   add_sub_dffe1 <= add_sub_dffe1_wi;
	// synopsys translate_off
	initial
		add_sub_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) add_sub_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   add_sub_dffe12 <= add_sub_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_dataa_exp_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_exp_dffe12 <= 9'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_exp_dffe12 <= aligned_dataa_exp_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_dataa_man_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_man_dffe12 <= 24'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_man_dffe12 <= aligned_dataa_man_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_dataa_sign_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_sign_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_sign_dffe12 <= aligned_dataa_sign_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_datab_exp_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_exp_dffe12 <= 9'b0;
		else if  (clk_en == 1'b1)   aligned_datab_exp_dffe12 <= aligned_datab_exp_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_datab_man_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_man_dffe12 <= 24'b0;
		else if  (clk_en == 1'b1)   aligned_datab_man_dffe12 <= aligned_datab_man_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_datab_sign_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_sign_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_datab_sign_dffe12 <= aligned_datab_sign_dffe12_wi;
	// synopsys translate_off
	initial
		both_inputs_are_infinite_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) both_inputs_are_infinite_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   both_inputs_are_infinite_dffe1 <= both_inputs_are_infinite_dffe1_wi;
	// synopsys translate_off
	initial
		data_exp_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) data_exp_dffe1 <= 8'b0;
		else if  (clk_en == 1'b1)   data_exp_dffe1 <= data_exp_dffe1_wi;
	// synopsys translate_off
	initial
		dataa_man_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_man_dffe1 <= 26'b0;
		else if  (clk_en == 1'b1)   dataa_man_dffe1 <= dataa_man_dffe1_wi;
	// synopsys translate_off
	initial
		dataa_sign_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_sign_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_sign_dffe1 <= dataa_sign_dffe1_wi;
	// synopsys translate_off
	initial
		datab_man_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_man_dffe1 <= 26'b0;
		else if  (clk_en == 1'b1)   datab_man_dffe1 <= datab_man_dffe1_wi;
	// synopsys translate_off
	initial
		datab_sign_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_sign_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_sign_dffe1 <= datab_sign_dffe1_wi;
	// synopsys translate_off
	initial
		denormal_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) denormal_res_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   denormal_res_dffe3 <= denormal_res_dffe3_wi;
	// synopsys translate_off
	initial
		denormal_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) denormal_res_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   denormal_res_dffe4 <= denormal_res_dffe4_wi;
	// synopsys translate_off
	initial
		exp_adj_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_adj_dffe21 <= 2'b0;
		else if  (clk_en == 1'b1)   exp_adj_dffe21 <= exp_adj_dffe21_wi;
	// synopsys translate_off
	initial
		exp_out_dffe5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_out_dffe5 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_out_dffe5 <= exp_out_dffe5_wi;
	// synopsys translate_off
	initial
		exp_res_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe2 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe2 <= exp_res_dffe2_wi;
	// synopsys translate_off
	initial
		exp_res_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe21 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe21 <= exp_res_dffe21_wi;
	// synopsys translate_off
	initial
		exp_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe3 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe3 <= exp_res_dffe3_wi;
	// synopsys translate_off
	initial
		exp_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe4 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe4 <= exp_res_dffe4_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe1 <= infinite_output_sign_dffe1_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe2 <= infinite_output_sign_dffe2_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe21 <= infinite_output_sign_dffe21_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe3 <= infinite_output_sign_dffe3_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe31 <= infinite_output_sign_dffe31_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe4 <= infinite_output_sign_dffe4_wi;
	// synopsys translate_off
	initial
		infinite_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_res_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_res_dffe3 <= infinite_res_dffe3_wi;
	// synopsys translate_off
	initial
		infinite_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_res_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_res_dffe4 <= infinite_res_dffe4_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe2 <= infinity_magnitude_sub_dffe2_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe21 <= infinity_magnitude_sub_dffe21_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe3 <= infinity_magnitude_sub_dffe3_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe31 <= infinity_magnitude_sub_dffe31_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe4 <= infinity_magnitude_sub_dffe4_wi;
	// synopsys translate_off
	initial
		input_dataa_infinite_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_infinite_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_infinite_dffe12 <= input_dataa_infinite_dffe12_wi;
	// synopsys translate_off
	initial
		input_dataa_nan_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_nan_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_nan_dffe12 <= input_dataa_nan_dffe12_wi;
	// synopsys translate_off
	initial
		input_datab_infinite_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_infinite_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_infinite_dffe12 <= input_datab_infinite_dffe12_wi;
	// synopsys translate_off
	initial
		input_datab_nan_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_nan_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_nan_dffe12 <= input_datab_nan_dffe12_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe1 <= input_is_infinite_dffe1_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe2 <= input_is_infinite_dffe2_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe21 <= input_is_infinite_dffe21_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe3 <= input_is_infinite_dffe3_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe31 <= input_is_infinite_dffe31_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe4 <= input_is_infinite_dffe4_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe1 <= input_is_nan_dffe1_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe2 <= input_is_nan_dffe2_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe21 <= input_is_nan_dffe21_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe3 <= input_is_nan_dffe3_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe31 <= input_is_nan_dffe31_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe4 <= input_is_nan_dffe4_wi;
	// synopsys translate_off
	initial
		man_add_sub_res_mag_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_mag_dffe21 <= 26'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_mag_dffe21 <= man_add_sub_res_mag_dffe21_wi;
	// synopsys translate_off
	initial
		man_add_sub_res_sign_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_sign_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_sign_dffe21 <= man_add_sub_res_sign_dffe27_wo;
	// synopsys translate_off
	initial
		man_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_dffe31 <= 26'b0;
		else if  (clk_en == 1'b1)   man_dffe31 <= man_add_sub_res_mag_dffe26_wo;
	// synopsys translate_off
	initial
		man_leading_zeros_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_leading_zeros_dffe31 <= 5'b0;
		else if  (clk_en == 1'b1)   man_leading_zeros_dffe31 <= man_leading_zeros_dffe31_wi;
	// synopsys translate_off
	initial
		man_out_dffe5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_out_dffe5 <= 23'b0;
		else if  (clk_en == 1'b1)   man_out_dffe5 <= man_out_dffe5_wi;
	// synopsys translate_off
	initial
		man_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_dffe4 <= 23'b0;
		else if  (clk_en == 1'b1)   man_res_dffe4 <= man_res_dffe4_wi;
	// synopsys translate_off
	initial
		man_res_is_not_zero_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_is_not_zero_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_is_not_zero_dffe3 <= man_res_is_not_zero_dffe3_wi;
	// synopsys translate_off
	initial
		man_res_is_not_zero_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_is_not_zero_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_is_not_zero_dffe31 <= man_res_is_not_zero_dffe31_wi;
	// synopsys translate_off
	initial
		man_res_is_not_zero_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_is_not_zero_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_is_not_zero_dffe4 <= man_res_is_not_zero_dffe4_wi;
	// synopsys translate_off
	initial
		need_complement_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) need_complement_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   need_complement_dffe2 <= need_complement_dffe2_wi;
	// synopsys translate_off
	initial
		round_bit_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_bit_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   round_bit_dffe21 <= round_bit_dffe21_wi;
	// synopsys translate_off
	initial
		round_bit_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_bit_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   round_bit_dffe3 <= round_bit_dffe3_wi;
	// synopsys translate_off
	initial
		round_bit_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_bit_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   round_bit_dffe31 <= round_bit_dffe31_wi;
	// synopsys translate_off
	initial
		rounded_res_infinity_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rounded_res_infinity_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   rounded_res_infinity_dffe4 <= rounded_res_infinity_dffe4_wi;
	// synopsys translate_off
	initial
		sign_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe31 <= sign_dffe31_wi;
	// synopsys translate_off
	initial
		sign_out_dffe5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_out_dffe5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_out_dffe5 <= sign_out_dffe5_wi;
	// synopsys translate_off
	initial
		sign_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_res_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_res_dffe3 <= sign_res_dffe3_wi;
	// synopsys translate_off
	initial
		sign_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_res_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_res_dffe4 <= sign_res_dffe4_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe1 <= sticky_bit_dffe1_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe2 <= sticky_bit_dffe2_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe21 <= sticky_bit_dffe21_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe3 <= sticky_bit_dffe3_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe31 <= sticky_bit_dffe31_wi;
	// synopsys translate_off
	initial
		zero_man_sign_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_man_sign_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_man_sign_dffe2 <= zero_man_sign_dffe2_wi;
	// synopsys translate_off
	initial
		zero_man_sign_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_man_sign_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_man_sign_dffe21 <= zero_man_sign_dffe21_wi;
	lpm_add_sub   add_sub1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(aligned_dataa_exp_w),
	.datab(aligned_datab_exp_w),
	.overflow(),
	.result(wire_add_sub1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub1.lpm_direction = "SUB",
		add_sub1.lpm_pipeline = 1,
		add_sub1.lpm_representation = "SIGNED",
		add_sub1.lpm_width = 9,
		add_sub1.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub2
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(aligned_datab_exp_w),
	.datab(aligned_dataa_exp_w),
	.overflow(),
	.result(wire_add_sub2_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub2.lpm_direction = "SUB",
		add_sub2.lpm_pipeline = 1,
		add_sub2.lpm_representation = "SIGNED",
		add_sub2.lpm_width = 9,
		add_sub2.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub3
	( 
	.cout(),
	.dataa(sticky_bit_cnt_dataa_w),
	.datab(sticky_bit_cnt_datab_w),
	.overflow(),
	.result(wire_add_sub3_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub3.lpm_direction = "SUB",
		add_sub3.lpm_representation = "SIGNED",
		add_sub3.lpm_width = 6,
		add_sub3.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub4
	( 
	.cout(),
	.dataa(exp_adjustment_add_sub_dataa_w),
	.datab(exp_adjustment_add_sub_datab_w),
	.overflow(),
	.result(wire_add_sub4_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub4.lpm_direction = "ADD",
		add_sub4.lpm_representation = "SIGNED",
		add_sub4.lpm_width = 9,
		add_sub4.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub5
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(exp_adjustment2_add_sub_dataa_w),
	.datab(exp_adjustment2_add_sub_datab_w),
	.overflow(),
	.result(wire_add_sub5_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub5.lpm_direction = "ADD",
		add_sub5.lpm_pipeline = 1,
		add_sub5.lpm_representation = "SIGNED",
		add_sub5.lpm_width = 9,
		add_sub5.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub6
	( 
	.cout(),
	.dataa(exp_res_rounding_adder_dataa_w),
	.datab(exp_rounding_adjustment_w),
	.overflow(),
	.result(wire_add_sub6_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub6.lpm_direction = "ADD",
		add_sub6.lpm_representation = "SIGNED",
		add_sub6.lpm_width = 9,
		add_sub6.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_2comp_res_lower
	( 
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(borrow_w),
	.clken(clk_en),
	.clock(clock),
	.cout(wire_man_2comp_res_lower_cout),
	.dataa(man_2comp_res_dataa_w[13:0]),
	.datab(man_2comp_res_datab_w[13:0]),
	.overflow(),
	.result(wire_man_2comp_res_lower_result));
	defparam
		man_2comp_res_lower.lpm_pipeline = 1,
		man_2comp_res_lower.lpm_representation = "SIGNED",
		man_2comp_res_lower.lpm_width = 14,
		man_2comp_res_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_2comp_res_upper0
	( 
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b0),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_2comp_res_dataa_w[27:14]),
	.datab(man_2comp_res_datab_w[27:14]),
	.overflow(),
	.result(wire_man_2comp_res_upper0_result));
	defparam
		man_2comp_res_upper0.lpm_pipeline = 1,
		man_2comp_res_upper0.lpm_representation = "SIGNED",
		man_2comp_res_upper0.lpm_width = 14,
		man_2comp_res_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_2comp_res_upper1
	( 
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b1),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_2comp_res_dataa_w[27:14]),
	.datab(man_2comp_res_datab_w[27:14]),
	.overflow(),
	.result(wire_man_2comp_res_upper1_result));
	defparam
		man_2comp_res_upper1.lpm_pipeline = 1,
		man_2comp_res_upper1.lpm_representation = "SIGNED",
		man_2comp_res_upper1.lpm_width = 14,
		man_2comp_res_upper1.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_add_sub_lower
	( 
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(borrow_w),
	.clken(clk_en),
	.clock(clock),
	.cout(wire_man_add_sub_lower_cout),
	.dataa(man_add_sub_dataa_w[13:0]),
	.datab(man_add_sub_datab_w[13:0]),
	.overflow(),
	.result(wire_man_add_sub_lower_result));
	defparam
		man_add_sub_lower.lpm_pipeline = 1,
		man_add_sub_lower.lpm_representation = "SIGNED",
		man_add_sub_lower.lpm_width = 14,
		man_add_sub_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_add_sub_upper0
	( 
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b0),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_add_sub_dataa_w[27:14]),
	.datab(man_add_sub_datab_w[27:14]),
	.overflow(),
	.result(wire_man_add_sub_upper0_result));
	defparam
		man_add_sub_upper0.lpm_pipeline = 1,
		man_add_sub_upper0.lpm_representation = "SIGNED",
		man_add_sub_upper0.lpm_width = 14,
		man_add_sub_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_add_sub_upper1
	( 
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b1),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_add_sub_dataa_w[27:14]),
	.datab(man_add_sub_datab_w[27:14]),
	.overflow(),
	.result(wire_man_add_sub_upper1_result));
	defparam
		man_add_sub_upper1.lpm_pipeline = 1,
		man_add_sub_upper1.lpm_representation = "SIGNED",
		man_add_sub_upper1.lpm_width = 14,
		man_add_sub_upper1.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_res_rounding_add_sub_lower
	( 
	.cout(wire_man_res_rounding_add_sub_lower_cout),
	.dataa(man_intermediate_res_w[12:0]),
	.datab(man_res_rounding_add_sub_datab_w[12:0]),
	.overflow(),
	.result(wire_man_res_rounding_add_sub_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_res_rounding_add_sub_lower.lpm_direction = "ADD",
		man_res_rounding_add_sub_lower.lpm_representation = "SIGNED",
		man_res_rounding_add_sub_lower.lpm_width = 13,
		man_res_rounding_add_sub_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_res_rounding_add_sub_upper1
	( 
	.cin(1'b1),
	.cout(),
	.dataa(man_intermediate_res_w[25:13]),
	.datab(man_res_rounding_add_sub_datab_w[25:13]),
	.overflow(),
	.result(wire_man_res_rounding_add_sub_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_res_rounding_add_sub_upper1.lpm_direction = "ADD",
		man_res_rounding_add_sub_upper1.lpm_representation = "SIGNED",
		man_res_rounding_add_sub_upper1.lpm_width = 13,
		man_res_rounding_add_sub_upper1.lpm_type = "lpm_add_sub";
	lpm_compare   trailing_zeros_limit_comparator
	( 
	.aeb(),
	.agb(wire_trailing_zeros_limit_comparator_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(sticky_bit_cnt_res_w),
	.datab(trailing_zeros_limit_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		trailing_zeros_limit_comparator.lpm_representation = "SIGNED",
		trailing_zeros_limit_comparator.lpm_width = 6,
		trailing_zeros_limit_comparator.lpm_type = "lpm_compare";
	assign
		add_sub_dffe11_wi = add_sub,
		add_sub_dffe11_wo = add_sub_dffe11_wi,
		add_sub_dffe12_wi = add_sub_dffe11_wo,
		add_sub_dffe12_wo = add_sub_dffe12,
		add_sub_dffe13_wi = add_sub_dffe12_wo,
		add_sub_dffe13_wo = add_sub_dffe13_wi,
		add_sub_dffe14_wi = add_sub_dffe13_wo,
		add_sub_dffe14_wo = add_sub_dffe14_wi,
		add_sub_dffe15_wi = add_sub_dffe14_wo,
		add_sub_dffe15_wo = add_sub_dffe15_wi,
		add_sub_dffe1_wi = add_sub_dffe15_wo,
		add_sub_dffe1_wo = add_sub_dffe1,
		add_sub_dffe25_wi = add_sub_w2,
		add_sub_dffe25_wo = add_sub_dffe25_wi,
		add_sub_w2 = (((((dataa_sign_dffe1_wo & (~ datab_sign_dffe1_wo)) & (~ add_sub_dffe1_wo)) | (((~ dataa_sign_dffe1_wo) & (~ datab_sign_dffe1_wo)) & add_sub_dffe1_wo)) | (((~ dataa_sign_dffe1_wo) & datab_sign_dffe1_wo) & (~ add_sub_dffe1_wo))) | ((dataa_sign_dffe1_wo & datab_sign_dffe1_wo) & add_sub_dffe1_wo)),
		adder_upper_w = man_intermediate_res_w[25:13],
		aligned_dataa_exp_dffe12_wi = aligned_dataa_exp_w,
		aligned_dataa_exp_dffe12_wo = aligned_dataa_exp_dffe12,
		aligned_dataa_exp_dffe13_wi = aligned_dataa_exp_dffe12_wo,
		aligned_dataa_exp_dffe13_wo = aligned_dataa_exp_dffe13_wi,
		aligned_dataa_exp_dffe14_wi = aligned_dataa_exp_dffe13_wo,
		aligned_dataa_exp_dffe14_wo = aligned_dataa_exp_dffe14_wi,
		aligned_dataa_exp_dffe15_wi = aligned_dataa_exp_dffe14_wo,
		aligned_dataa_exp_dffe15_wo = aligned_dataa_exp_dffe15_wi,
		aligned_dataa_exp_w = {1'b0, ({8{(~ input_dataa_denormal_dffe11_wo)}} & dataa_dffe11_wo[30:23])},
		aligned_dataa_man_dffe12_wi = aligned_dataa_man_w[25:2],
		aligned_dataa_man_dffe12_wo = aligned_dataa_man_dffe12,
		aligned_dataa_man_dffe13_wi = aligned_dataa_man_dffe12_wo,
		aligned_dataa_man_dffe13_wo = aligned_dataa_man_dffe13_wi,
		aligned_dataa_man_dffe14_wi = aligned_dataa_man_dffe13_wo,
		aligned_dataa_man_dffe14_wo = aligned_dataa_man_dffe14_wi,
		aligned_dataa_man_dffe15_w = {aligned_dataa_man_dffe15_wo, {2{1'b0}}},
		aligned_dataa_man_dffe15_wi = aligned_dataa_man_dffe14_wo,
		aligned_dataa_man_dffe15_wo = aligned_dataa_man_dffe15_wi,
		aligned_dataa_man_w = {(((~ input_dataa_infinite_dffe11_wo) & (~ input_dataa_denormal_dffe11_wo)) & (~ input_dataa_zero_dffe11_wo)), ({23{(~ input_dataa_denormal_dffe11_wo)}} & dataa_dffe11_wo[22:0]), {2{1'b0}}},
		aligned_dataa_sign_dffe12_wi = aligned_dataa_sign_w,
		aligned_dataa_sign_dffe12_wo = aligned_dataa_sign_dffe12,
		aligned_dataa_sign_dffe13_wi = aligned_dataa_sign_dffe12_wo,
		aligned_dataa_sign_dffe13_wo = aligned_dataa_sign_dffe13_wi,
		aligned_dataa_sign_dffe14_wi = aligned_dataa_sign_dffe13_wo,
		aligned_dataa_sign_dffe14_wo = aligned_dataa_sign_dffe14_wi,
		aligned_dataa_sign_dffe15_wi = aligned_dataa_sign_dffe14_wo,
		aligned_dataa_sign_dffe15_wo = aligned_dataa_sign_dffe15_wi,
		aligned_dataa_sign_w = dataa_dffe11_wo[31],
		aligned_datab_exp_dffe12_wi = aligned_datab_exp_w,
		aligned_datab_exp_dffe12_wo = aligned_datab_exp_dffe12,
		aligned_datab_exp_dffe13_wi = aligned_datab_exp_dffe12_wo,
		aligned_datab_exp_dffe13_wo = aligned_datab_exp_dffe13_wi,
		aligned_datab_exp_dffe14_wi = aligned_datab_exp_dffe13_wo,
		aligned_datab_exp_dffe14_wo = aligned_datab_exp_dffe14_wi,
		aligned_datab_exp_dffe15_wi = aligned_datab_exp_dffe14_wo,
		aligned_datab_exp_dffe15_wo = aligned_datab_exp_dffe15_wi,
		aligned_datab_exp_w = {1'b0, ({8{(~ input_datab_denormal_dffe11_wo)}} & datab_dffe11_wo[30:23])},
		aligned_datab_man_dffe12_wi = aligned_datab_man_w[25:2],
		aligned_datab_man_dffe12_wo = aligned_datab_man_dffe12,
		aligned_datab_man_dffe13_wi = aligned_datab_man_dffe12_wo,
		aligned_datab_man_dffe13_wo = aligned_datab_man_dffe13_wi,
		aligned_datab_man_dffe14_wi = aligned_datab_man_dffe13_wo,
		aligned_datab_man_dffe14_wo = aligned_datab_man_dffe14_wi,
		aligned_datab_man_dffe15_w = {aligned_datab_man_dffe15_wo, {2{1'b0}}},
		aligned_datab_man_dffe15_wi = aligned_datab_man_dffe14_wo,
		aligned_datab_man_dffe15_wo = aligned_datab_man_dffe15_wi,
		aligned_datab_man_w = {(((~ input_datab_infinite_dffe11_wo) & (~ input_datab_denormal_dffe11_wo)) & (~ input_datab_zero_dffe11_wo)), ({23{(~ input_datab_denormal_dffe11_wo)}} & datab_dffe11_wo[22:0]), {2{1'b0}}},
		aligned_datab_sign_dffe12_wi = aligned_datab_sign_w,
		aligned_datab_sign_dffe12_wo = aligned_datab_sign_dffe12,
		aligned_datab_sign_dffe13_wi = aligned_datab_sign_dffe12_wo,
		aligned_datab_sign_dffe13_wo = aligned_datab_sign_dffe13_wi,
		aligned_datab_sign_dffe14_wi = aligned_datab_sign_dffe13_wo,
		aligned_datab_sign_dffe14_wo = aligned_datab_sign_dffe14_wi,
		aligned_datab_sign_dffe15_wi = aligned_datab_sign_dffe14_wo,
		aligned_datab_sign_dffe15_wo = aligned_datab_sign_dffe15_wi,
		aligned_datab_sign_w = datab_dffe11_wo[31],
		borrow_w = ((~ sticky_bit_dffe1_wo) & (~ add_sub_w2)),
		both_inputs_are_infinite_dffe1_wi = (input_dataa_infinite_dffe15_wo & input_datab_infinite_dffe15_wo),
		both_inputs_are_infinite_dffe1_wo = both_inputs_are_infinite_dffe1,
		both_inputs_are_infinite_dffe25_wi = both_inputs_are_infinite_dffe1_wo,
		both_inputs_are_infinite_dffe25_wo = both_inputs_are_infinite_dffe25_wi,
		data_exp_dffe1_wi = (({8{(~ exp_amb_mux_dffe15_wo)}} & aligned_dataa_exp_dffe15_wo[7:0]) | ({8{exp_amb_mux_dffe15_wo}} & aligned_datab_exp_dffe15_wo[7:0])),
		data_exp_dffe1_wo = data_exp_dffe1,
		dataa_dffe11_wi = dataa,
		dataa_dffe11_wo = dataa_dffe11_wi,
		dataa_man_dffe1_wi = (({26{(~ exp_amb_mux_dffe15_wo)}} & aligned_dataa_man_dffe15_w) | ({26{exp_amb_mux_dffe15_wo}} & wire_rbarrel_shift_result)),
		dataa_man_dffe1_wo = dataa_man_dffe1,
		dataa_sign_dffe1_wi = aligned_dataa_sign_dffe15_wo,
		dataa_sign_dffe1_wo = dataa_sign_dffe1,
		dataa_sign_dffe25_wi = dataa_sign_dffe1_wo,
		dataa_sign_dffe25_wo = dataa_sign_dffe25_wi,
		datab_dffe11_wi = datab,
		datab_dffe11_wo = datab_dffe11_wi,
		datab_man_dffe1_wi = (({26{(~ exp_amb_mux_dffe15_wo)}} & wire_rbarrel_shift_result) | ({26{exp_amb_mux_dffe15_wo}} & aligned_datab_man_dffe15_w)),
		datab_man_dffe1_wo = datab_man_dffe1,
		datab_sign_dffe1_wi = aligned_datab_sign_dffe15_wo,
		datab_sign_dffe1_wo = datab_sign_dffe1,
		denormal_flag_w = ((((~ force_nan_w) & (~ force_infinity_w)) & (~ force_zero_w)) & denormal_res_dffe4_wo),
		denormal_res_dffe32_wi = denormal_result_w,
		denormal_res_dffe32_wo = denormal_res_dffe32_wi,
		denormal_res_dffe33_wi = denormal_res_dffe32_wo,
		denormal_res_dffe33_wo = denormal_res_dffe33_wi,
		denormal_res_dffe3_wi = denormal_res_dffe33_wo,
		denormal_res_dffe3_wo = denormal_res_dffe3,
		denormal_res_dffe41_wi = denormal_res_dffe42_wo,
		denormal_res_dffe41_wo = denormal_res_dffe41_wi,
		denormal_res_dffe42_wi = denormal_res_dffe3_wo,
		denormal_res_dffe42_wo = denormal_res_dffe42_wi,
		denormal_res_dffe4_wi = denormal_res_dffe41_wo,
		denormal_res_dffe4_wo = denormal_res_dffe4,
		denormal_result_w = ((~ exp_res_not_zero_w[8]) | exp_adjustment2_add_sub_w[8]),
		exp_a_all_one_w = {(dataa[30] & exp_a_all_one_w[6]), (dataa[29] & exp_a_all_one_w[5]), (dataa[28] & exp_a_all_one_w[4]), (dataa[27] & exp_a_all_one_w[3]), (dataa[26] & exp_a_all_one_w[2]), (dataa[25] & exp_a_all_one_w[1]), (dataa[24] & exp_a_all_one_w[0]), dataa[23]},
		exp_a_not_zero_w = {(dataa[30] | exp_a_not_zero_w[6]), (dataa[29] | exp_a_not_zero_w[5]), (dataa[28] | exp_a_not_zero_w[4]), (dataa[27] | exp_a_not_zero_w[3]), (dataa[26] | exp_a_not_zero_w[2]), (dataa[25] | exp_a_not_zero_w[1]), (dataa[24] | exp_a_not_zero_w[0]), dataa[23]},
		exp_adj_0pads = {7{1'b0}},
		exp_adj_dffe21_wi = (({2{man_add_sub_res_mag_dffe27_wo[26]}} & exp_adjust_by_add2) | ({2{(~ man_add_sub_res_mag_dffe27_wo[26])}} & exp_adjust_by_add1)),
		exp_adj_dffe21_wo = exp_adj_dffe21,
		exp_adj_dffe23_wi = exp_adj_dffe21_wo,
		exp_adj_dffe23_wo = exp_adj_dffe23_wi,
		exp_adj_dffe26_wi = exp_adj_dffe23_wo,
		exp_adj_dffe26_wo = exp_adj_dffe26_wi,
		exp_adjust_by_add1 = 2'b01,
		exp_adjust_by_add2 = 2'b10,
		exp_adjustment2_add_sub_dataa_w = exp_value,
		exp_adjustment2_add_sub_datab_w = exp_adjustment_add_sub_w,
		exp_adjustment2_add_sub_w = wire_add_sub5_result,
		exp_adjustment_add_sub_dataa_w = {priority_encoder_1pads_w, wire_leading_zeroes_cnt_q},
		exp_adjustment_add_sub_datab_w = {exp_adj_0pads, exp_adj_dffe26_wo},
		exp_adjustment_add_sub_w = wire_add_sub4_result,
		exp_all_ones_w = {8{1'b1}},
		exp_all_zeros_w = {8{1'b0}},
		exp_amb_mux_dffe13_wi = exp_amb_mux_w,
		exp_amb_mux_dffe13_wo = exp_amb_mux_dffe13_wi,
		exp_amb_mux_dffe14_wi = exp_amb_mux_dffe13_wo,
		exp_amb_mux_dffe14_wo = exp_amb_mux_dffe14_wi,
		exp_amb_mux_dffe15_wi = exp_amb_mux_dffe14_wo,
		exp_amb_mux_dffe15_wo = exp_amb_mux_dffe15_wi,
		exp_amb_mux_w = exp_amb_w[8],
		exp_amb_w = wire_add_sub1_result,
		exp_b_all_one_w = {(datab[30] & exp_b_all_one_w[6]), (datab[29] & exp_b_all_one_w[5]), (datab[28] & exp_b_all_one_w[4]), (datab[27] & exp_b_all_one_w[3]), (datab[26] & exp_b_all_one_w[2]), (datab[25] & exp_b_all_one_w[1]), (datab[24] & exp_b_all_one_w[0]), datab[23]},
		exp_b_not_zero_w = {(datab[30] | exp_b_not_zero_w[6]), (datab[29] | exp_b_not_zero_w[5]), (datab[28] | exp_b_not_zero_w[4]), (datab[27] | exp_b_not_zero_w[3]), (datab[26] | exp_b_not_zero_w[2]), (datab[25] | exp_b_not_zero_w[1]), (datab[24] | exp_b_not_zero_w[0]), datab[23]},
		exp_bma_w = wire_add_sub2_result,
		exp_diff_abs_exceed_max_w = {(exp_diff_abs_exceed_max_w[1] | exp_diff_abs_w[7]), (exp_diff_abs_exceed_max_w[0] | exp_diff_abs_w[6]), exp_diff_abs_w[5]},
		exp_diff_abs_max_w = {5{1'b1}},
		exp_diff_abs_w = (({8{(~ exp_amb_mux_w)}} & exp_amb_w[7:0]) | ({8{exp_amb_mux_w}} & exp_bma_w[7:0])),
		exp_intermediate_res_dffe41_wi = exp_intermediate_res_dffe42_wo,
		exp_intermediate_res_dffe41_wo = exp_intermediate_res_dffe41_wi,
		exp_intermediate_res_dffe42_wi = exp_intermediate_res_w,
		exp_intermediate_res_dffe42_wo = exp_intermediate_res_dffe42_wi,
		exp_intermediate_res_w = exp_res_dffe3_wo,
		exp_out_dffe5_wi = (({8{force_nan_w}} & exp_all_ones_w) | ({8{(~ force_nan_w)}} & (({8{force_infinity_w}} & exp_all_ones_w) | ({8{(~ force_infinity_w)}} & (({8{(force_zero_w | denormal_flag_w)}} & exp_all_zeros_w) | ({8{(~ (force_zero_w | denormal_flag_w))}} & exp_res_dffe4_wo)))))),
		exp_out_dffe5_wo = exp_out_dffe5,
		exp_res_dffe21_wi = exp_res_dffe27_wo,
		exp_res_dffe21_wo = exp_res_dffe21,
		exp_res_dffe22_wi = exp_res_dffe2_wo,
		exp_res_dffe22_wo = exp_res_dffe22_wi,
		exp_res_dffe23_wi = exp_res_dffe21_wo,
		exp_res_dffe23_wo = exp_res_dffe23_wi,
		exp_res_dffe25_wi = data_exp_dffe1_wo,
		exp_res_dffe25_wo = exp_res_dffe25_wi,
		exp_res_dffe26_wi = exp_res_dffe23_wo,
		exp_res_dffe26_wo = exp_res_dffe26_wi,
		exp_res_dffe27_wi = exp_res_dffe22_wo,
		exp_res_dffe27_wo = exp_res_dffe27_wi,
		exp_res_dffe2_wi = exp_res_dffe25_wo,
		exp_res_dffe2_wo = exp_res_dffe2,
		exp_res_dffe32_wi = ({8{(~ denormal_result_w)}} & exp_adjustment2_add_sub_w[7:0]),
		exp_res_dffe32_wo = exp_res_dffe32_wi,
		exp_res_dffe33_wi = exp_res_dffe32_wo,
		exp_res_dffe33_wo = exp_res_dffe33_wi,
		exp_res_dffe3_wi = exp_res_dffe33_wo,
		exp_res_dffe3_wo = exp_res_dffe3,
		exp_res_dffe4_wi = exp_rounded_res_w,
		exp_res_dffe4_wo = exp_res_dffe4,
		exp_res_max_w = {(exp_res_max_w[6] & exp_adjustment2_add_sub_w[7]), (exp_res_max_w[5] & exp_adjustment2_add_sub_w[6]), (exp_res_max_w[4] & exp_adjustment2_add_sub_w[5]), (exp_res_max_w[3] & exp_adjustment2_add_sub_w[4]), (exp_res_max_w[2] & exp_adjustment2_add_sub_w[3]), (exp_res_max_w[1] & exp_adjustment2_add_sub_w[2]), (exp_res_max_w[0] & exp_adjustment2_add_sub_w[1]), exp_adjustment2_add_sub_w[0]},
		exp_res_not_zero_w = {(exp_res_not_zero_w[7] | exp_adjustment2_add_sub_w[8]), (exp_res_not_zero_w[6] | exp_adjustment2_add_sub_w[7]), (exp_res_not_zero_w[5] | exp_adjustment2_add_sub_w[6]), (exp_res_not_zero_w[4] | exp_adjustment2_add_sub_w[5]), (exp_res_not_zero_w[3] | exp_adjustment2_add_sub_w[4]), (exp_res_not_zero_w[2] | exp_adjustment2_add_sub_w[3]), (exp_res_not_zero_w[1] | exp_adjustment2_add_sub_w[2]), (exp_res_not_zero_w[0] | exp_adjustment2_add_sub_w[1]), exp_adjustment2_add_sub_w[0]},
		exp_res_rounding_adder_dataa_w = {1'b0, exp_intermediate_res_dffe41_wo},
		exp_res_rounding_adder_w = wire_add_sub6_result,
		exp_rounded_res_infinity_w = exp_rounded_res_max_w[7],
		exp_rounded_res_max_w = {(exp_rounded_res_max_w[6] & exp_rounded_res_w[7]), (exp_rounded_res_max_w[5] & exp_rounded_res_w[6]), (exp_rounded_res_max_w[4] & exp_rounded_res_w[5]), (exp_rounded_res_max_w[3] & exp_rounded_res_w[4]), (exp_rounded_res_max_w[2] & exp_rounded_res_w[3]), (exp_rounded_res_max_w[1] & exp_rounded_res_w[2]), (exp_rounded_res_max_w[0] & exp_rounded_res_w[1]), exp_rounded_res_w[0]},
		exp_rounded_res_w = exp_res_rounding_adder_w[7:0],
		exp_rounding_adjustment_w = {{8{1'b0}}, man_res_rounding_add_sub_w[24]},
		exp_value = {1'b0, exp_res_dffe26_wo},
		force_infinity_w = ((input_is_infinite_dffe4_wo | rounded_res_infinity_dffe4_wo) | infinite_res_dffe4_wo),
		force_nan_w = (infinity_magnitude_sub_dffe4_wo | input_is_nan_dffe4_wo),
		force_zero_w = (~ man_res_is_not_zero_dffe4_wo),
		guard_bit_dffe3_wo = man_res_w3[0],
		infinite_output_sign_dffe1_wi = (((~ input_datab_infinite_dffe15_wo) & aligned_dataa_sign_dffe15_wo) | (input_datab_infinite_dffe15_wo & (~ (aligned_datab_sign_dffe15_wo ^ add_sub_dffe15_wo)))),
		infinite_output_sign_dffe1_wo = infinite_output_sign_dffe1,
		infinite_output_sign_dffe21_wi = infinite_output_sign_dffe27_wo,
		infinite_output_sign_dffe21_wo = infinite_output_sign_dffe21,
		infinite_output_sign_dffe22_wi = infinite_output_sign_dffe2_wo,
		infinite_output_sign_dffe22_wo = infinite_output_sign_dffe22_wi,
		infinite_output_sign_dffe23_wi = infinite_output_sign_dffe21_wo,
		infinite_output_sign_dffe23_wo = infinite_output_sign_dffe23_wi,
		infinite_output_sign_dffe25_wi = infinite_output_sign_dffe1_wo,
		infinite_output_sign_dffe25_wo = infinite_output_sign_dffe25_wi,
		infinite_output_sign_dffe26_wi = infinite_output_sign_dffe23_wo,
		infinite_output_sign_dffe26_wo = infinite_output_sign_dffe26_wi,
		infinite_output_sign_dffe27_wi = infinite_output_sign_dffe22_wo,
		infinite_output_sign_dffe27_wo = infinite_output_sign_dffe27_wi,
		infinite_output_sign_dffe2_wi = infinite_output_sign_dffe25_wo,
		infinite_output_sign_dffe2_wo = infinite_output_sign_dffe2,
		infinite_output_sign_dffe31_wi = infinite_output_sign_dffe26_wo,
		infinite_output_sign_dffe31_wo = infinite_output_sign_dffe31,
		infinite_output_sign_dffe32_wi = infinite_output_sign_dffe31_wo,
		infinite_output_sign_dffe32_wo = infinite_output_sign_dffe32_wi,
		infinite_output_sign_dffe33_wi = infinite_output_sign_dffe32_wo,
		infinite_output_sign_dffe33_wo = infinite_output_sign_dffe33_wi,
		infinite_output_sign_dffe3_wi = infinite_output_sign_dffe33_wo,
		infinite_output_sign_dffe3_wo = infinite_output_sign_dffe3,
		infinite_output_sign_dffe41_wi = infinite_output_sign_dffe42_wo,
		infinite_output_sign_dffe41_wo = infinite_output_sign_dffe41_wi,
		infinite_output_sign_dffe42_wi = infinite_output_sign_dffe3_wo,
		infinite_output_sign_dffe42_wo = infinite_output_sign_dffe42_wi,
		infinite_output_sign_dffe4_wi = infinite_output_sign_dffe41_wo,
		infinite_output_sign_dffe4_wo = infinite_output_sign_dffe4,
		infinite_res_dff32_wi = (exp_res_max_w[7] & (~ exp_adjustment2_add_sub_w[8])),
		infinite_res_dff32_wo = infinite_res_dff32_wi,
		infinite_res_dff33_wi = infinite_res_dff32_wo,
		infinite_res_dff33_wo = infinite_res_dff33_wi,
		infinite_res_dffe3_wi = infinite_res_dff33_wo,
		infinite_res_dffe3_wo = infinite_res_dffe3,
		infinite_res_dffe41_wi = infinite_res_dffe42_wo,
		infinite_res_dffe41_wo = infinite_res_dffe41_wi,
		infinite_res_dffe42_wi = infinite_res_dffe3_wo,
		infinite_res_dffe42_wo = infinite_res_dffe42_wi,
		infinite_res_dffe4_wi = infinite_res_dffe41_wo,
		infinite_res_dffe4_wo = infinite_res_dffe4,
		infinity_magnitude_sub_dffe21_wi = infinity_magnitude_sub_dffe27_wo,
		infinity_magnitude_sub_dffe21_wo = infinity_magnitude_sub_dffe21,
		infinity_magnitude_sub_dffe22_wi = infinity_magnitude_sub_dffe2_wo,
		infinity_magnitude_sub_dffe22_wo = infinity_magnitude_sub_dffe22_wi,
		infinity_magnitude_sub_dffe23_wi = infinity_magnitude_sub_dffe21_wo,
		infinity_magnitude_sub_dffe23_wo = infinity_magnitude_sub_dffe23_wi,
		infinity_magnitude_sub_dffe26_wi = infinity_magnitude_sub_dffe23_wo,
		infinity_magnitude_sub_dffe26_wo = infinity_magnitude_sub_dffe26_wi,
		infinity_magnitude_sub_dffe27_wi = infinity_magnitude_sub_dffe22_wo,
		infinity_magnitude_sub_dffe27_wo = infinity_magnitude_sub_dffe27_wi,
		infinity_magnitude_sub_dffe2_wi = ((~ add_sub_dffe25_wo) & both_inputs_are_infinite_dffe25_wo),
		infinity_magnitude_sub_dffe2_wo = infinity_magnitude_sub_dffe2,
		infinity_magnitude_sub_dffe31_wi = infinity_magnitude_sub_dffe26_wo,
		infinity_magnitude_sub_dffe31_wo = infinity_magnitude_sub_dffe31,
		infinity_magnitude_sub_dffe32_wi = infinity_magnitude_sub_dffe31_wo,
		infinity_magnitude_sub_dffe32_wo = infinity_magnitude_sub_dffe32_wi,
		infinity_magnitude_sub_dffe33_wi = infinity_magnitude_sub_dffe32_wo,
		infinity_magnitude_sub_dffe33_wo = infinity_magnitude_sub_dffe33_wi,
		infinity_magnitude_sub_dffe3_wi = infinity_magnitude_sub_dffe33_wo,
		infinity_magnitude_sub_dffe3_wo = infinity_magnitude_sub_dffe3,
		infinity_magnitude_sub_dffe41_wi = infinity_magnitude_sub_dffe42_wo,
		infinity_magnitude_sub_dffe41_wo = infinity_magnitude_sub_dffe41_wi,
		infinity_magnitude_sub_dffe42_wi = infinity_magnitude_sub_dffe3_wo,
		infinity_magnitude_sub_dffe42_wo = infinity_magnitude_sub_dffe42_wi,
		infinity_magnitude_sub_dffe4_wi = infinity_magnitude_sub_dffe41_wo,
		infinity_magnitude_sub_dffe4_wo = infinity_magnitude_sub_dffe4,
		input_dataa_denormal_dffe11_wi = input_dataa_denormal_w,
		input_dataa_denormal_dffe11_wo = input_dataa_denormal_dffe11_wi,
		input_dataa_denormal_w = ((~ exp_a_not_zero_w[7]) & man_a_not_zero_w[22]),
		input_dataa_infinite_dffe11_wi = input_dataa_infinite_w,
		input_dataa_infinite_dffe11_wo = input_dataa_infinite_dffe11_wi,
		input_dataa_infinite_dffe12_wi = input_dataa_infinite_dffe11_wo,
		input_dataa_infinite_dffe12_wo = input_dataa_infinite_dffe12,
		input_dataa_infinite_dffe13_wi = input_dataa_infinite_dffe12_wo,
		input_dataa_infinite_dffe13_wo = input_dataa_infinite_dffe13_wi,
		input_dataa_infinite_dffe14_wi = input_dataa_infinite_dffe13_wo,
		input_dataa_infinite_dffe14_wo = input_dataa_infinite_dffe14_wi,
		input_dataa_infinite_dffe15_wi = input_dataa_infinite_dffe14_wo,
		input_dataa_infinite_dffe15_wo = input_dataa_infinite_dffe15_wi,
		input_dataa_infinite_w = (exp_a_all_one_w[7] & (~ man_a_not_zero_w[22])),
		input_dataa_nan_dffe11_wi = input_dataa_nan_w,
		input_dataa_nan_dffe11_wo = input_dataa_nan_dffe11_wi,
		input_dataa_nan_dffe12_wi = input_dataa_nan_dffe11_wo,
		input_dataa_nan_dffe12_wo = input_dataa_nan_dffe12,
		input_dataa_nan_w = (exp_a_all_one_w[7] & man_a_not_zero_w[22]),
		input_dataa_zero_dffe11_wi = input_dataa_zero_w,
		input_dataa_zero_dffe11_wo = input_dataa_zero_dffe11_wi,
		input_dataa_zero_w = ((~ exp_a_not_zero_w[7]) & (~ man_a_not_zero_w[22])),
		input_datab_denormal_dffe11_wi = input_datab_denormal_w,
		input_datab_denormal_dffe11_wo = input_datab_denormal_dffe11_wi,
		input_datab_denormal_w = ((~ exp_b_not_zero_w[7]) & man_b_not_zero_w[22]),
		input_datab_infinite_dffe11_wi = input_datab_infinite_w,
		input_datab_infinite_dffe11_wo = input_datab_infinite_dffe11_wi,
		input_datab_infinite_dffe12_wi = input_datab_infinite_dffe11_wo,
		input_datab_infinite_dffe12_wo = input_datab_infinite_dffe12,
		input_datab_infinite_dffe13_wi = input_datab_infinite_dffe12_wo,
		input_datab_infinite_dffe13_wo = input_datab_infinite_dffe13_wi,
		input_datab_infinite_dffe14_wi = input_datab_infinite_dffe13_wo,
		input_datab_infinite_dffe14_wo = input_datab_infinite_dffe14_wi,
		input_datab_infinite_dffe15_wi = input_datab_infinite_dffe14_wo,
		input_datab_infinite_dffe15_wo = input_datab_infinite_dffe15_wi,
		input_datab_infinite_w = (exp_b_all_one_w[7] & (~ man_b_not_zero_w[22])),
		input_datab_nan_dffe11_wi = input_datab_nan_w,
		input_datab_nan_dffe11_wo = input_datab_nan_dffe11_wi,
		input_datab_nan_dffe12_wi = input_datab_nan_dffe11_wo,
		input_datab_nan_dffe12_wo = input_datab_nan_dffe12,
		input_datab_nan_w = (exp_b_all_one_w[7] & man_b_not_zero_w[22]),
		input_datab_zero_dffe11_wi = input_datab_zero_w,
		input_datab_zero_dffe11_wo = input_datab_zero_dffe11_wi,
		input_datab_zero_w = ((~ exp_b_not_zero_w[7]) & (~ man_b_not_zero_w[22])),
		input_is_infinite_dffe1_wi = (input_dataa_infinite_dffe15_wo | input_datab_infinite_dffe15_wo),
		input_is_infinite_dffe1_wo = input_is_infinite_dffe1,
		input_is_infinite_dffe21_wi = input_is_infinite_dffe27_wo,
		input_is_infinite_dffe21_wo = input_is_infinite_dffe21,
		input_is_infinite_dffe22_wi = input_is_infinite_dffe2_wo,
		input_is_infinite_dffe22_wo = input_is_infinite_dffe22_wi,
		input_is_infinite_dffe23_wi = input_is_infinite_dffe21_wo,
		input_is_infinite_dffe23_wo = input_is_infinite_dffe23_wi,
		input_is_infinite_dffe25_wi = input_is_infinite_dffe1_wo,
		input_is_infinite_dffe25_wo = input_is_infinite_dffe25_wi,
		input_is_infinite_dffe26_wi = input_is_infinite_dffe23_wo,
		input_is_infinite_dffe26_wo = input_is_infinite_dffe26_wi,
		input_is_infinite_dffe27_wi = input_is_infinite_dffe22_wo,
		input_is_infinite_dffe27_wo = input_is_infinite_dffe27_wi,
		input_is_infinite_dffe2_wi = input_is_infinite_dffe25_wo,
		input_is_infinite_dffe2_wo = input_is_infinite_dffe2,
		input_is_infinite_dffe31_wi = input_is_infinite_dffe26_wo,
		input_is_infinite_dffe31_wo = input_is_infinite_dffe31,
		input_is_infinite_dffe32_wi = input_is_infinite_dffe31_wo,
		input_is_infinite_dffe32_wo = input_is_infinite_dffe32_wi,
		input_is_infinite_dffe33_wi = input_is_infinite_dffe32_wo,
		input_is_infinite_dffe33_wo = input_is_infinite_dffe33_wi,
		input_is_infinite_dffe3_wi = input_is_infinite_dffe33_wo,
		input_is_infinite_dffe3_wo = input_is_infinite_dffe3,
		input_is_infinite_dffe41_wi = input_is_infinite_dffe42_wo,
		input_is_infinite_dffe41_wo = input_is_infinite_dffe41_wi,
		input_is_infinite_dffe42_wi = input_is_infinite_dffe3_wo,
		input_is_infinite_dffe42_wo = input_is_infinite_dffe42_wi,
		input_is_infinite_dffe4_wi = input_is_infinite_dffe41_wo,
		input_is_infinite_dffe4_wo = input_is_infinite_dffe4,
		input_is_nan_dffe13_wi = (input_dataa_nan_dffe12_wo | input_datab_nan_dffe12_wo),
		input_is_nan_dffe13_wo = input_is_nan_dffe13_wi,
		input_is_nan_dffe14_wi = input_is_nan_dffe13_wo,
		input_is_nan_dffe14_wo = input_is_nan_dffe14_wi,
		input_is_nan_dffe15_wi = input_is_nan_dffe14_wo,
		input_is_nan_dffe15_wo = input_is_nan_dffe15_wi,
		input_is_nan_dffe1_wi = input_is_nan_dffe15_wo,
		input_is_nan_dffe1_wo = input_is_nan_dffe1,
		input_is_nan_dffe21_wi = input_is_nan_dffe27_wo,
		input_is_nan_dffe21_wo = input_is_nan_dffe21,
		input_is_nan_dffe22_wi = input_is_nan_dffe2_wo,
		input_is_nan_dffe22_wo = input_is_nan_dffe22_wi,
		input_is_nan_dffe23_wi = input_is_nan_dffe21_wo,
		input_is_nan_dffe23_wo = input_is_nan_dffe23_wi,
		input_is_nan_dffe25_wi = input_is_nan_dffe1_wo,
		input_is_nan_dffe25_wo = input_is_nan_dffe25_wi,
		input_is_nan_dffe26_wi = input_is_nan_dffe23_wo,
		input_is_nan_dffe26_wo = input_is_nan_dffe26_wi,
		input_is_nan_dffe27_wi = input_is_nan_dffe22_wo,
		input_is_nan_dffe27_wo = input_is_nan_dffe27_wi,
		input_is_nan_dffe2_wi = input_is_nan_dffe25_wo,
		input_is_nan_dffe2_wo = input_is_nan_dffe2,
		input_is_nan_dffe31_wi = input_is_nan_dffe26_wo,
		input_is_nan_dffe31_wo = input_is_nan_dffe31,
		input_is_nan_dffe32_wi = input_is_nan_dffe31_wo,
		input_is_nan_dffe32_wo = input_is_nan_dffe32_wi,
		input_is_nan_dffe33_wi = input_is_nan_dffe32_wo,
		input_is_nan_dffe33_wo = input_is_nan_dffe33_wi,
		input_is_nan_dffe3_wi = input_is_nan_dffe33_wo,
		input_is_nan_dffe3_wo = input_is_nan_dffe3,
		input_is_nan_dffe41_wi = input_is_nan_dffe42_wo,
		input_is_nan_dffe41_wo = input_is_nan_dffe41_wi,
		input_is_nan_dffe42_wi = input_is_nan_dffe3_wo,
		input_is_nan_dffe42_wo = input_is_nan_dffe42_wi,
		input_is_nan_dffe4_wi = input_is_nan_dffe41_wo,
		input_is_nan_dffe4_wo = input_is_nan_dffe4,
		man_2comp_res_dataa_w = {pos_sign_bit_ext, datab_man_dffe1_wo},
		man_2comp_res_datab_w = {pos_sign_bit_ext, dataa_man_dffe1_wo},
		man_2comp_res_w = {(({14{(~ wire_man_2comp_res_lower_cout)}} & wire_man_2comp_res_upper0_result) | ({14{wire_man_2comp_res_lower_cout}} & wire_man_2comp_res_upper1_result)), wire_man_2comp_res_lower_result},
		man_a_not_zero_w = {(dataa[22] | man_a_not_zero_w[21]), (dataa[21] | man_a_not_zero_w[20]), (dataa[20] | man_a_not_zero_w[19]), (dataa[19] | man_a_not_zero_w[18]), (dataa[18] | man_a_not_zero_w[17]), (dataa[17] | man_a_not_zero_w[16]), (dataa[16] | man_a_not_zero_w[15]), (dataa[15] | man_a_not_zero_w[14]), (dataa[14] | man_a_not_zero_w[13]), (dataa[13] | man_a_not_zero_w[12]), (dataa[12] | man_a_not_zero_w[11]), (dataa[11] | man_a_not_zero_w[10]), (dataa[10] | man_a_not_zero_w[9]), (dataa[9] | man_a_not_zero_w[8]), (dataa[8] | man_a_not_zero_w[7]), (dataa[7] | man_a_not_zero_w[6]), (dataa[6] | man_a_not_zero_w[5]), (dataa[5] | man_a_not_zero_w[4]), (dataa[4] | man_a_not_zero_w[3]), (dataa[3] | man_a_not_zero_w[2]), (dataa[2] | man_a_not_zero_w[1]), (dataa[1] | man_a_not_zero_w[0]), dataa[0]},
		man_add_sub_dataa_w = {pos_sign_bit_ext, dataa_man_dffe1_wo},
		man_add_sub_datab_w = {pos_sign_bit_ext, datab_man_dffe1_wo},
		man_add_sub_res_mag_dffe21_wi = man_res_mag_w2,
		man_add_sub_res_mag_dffe21_wo = man_add_sub_res_mag_dffe21,
		man_add_sub_res_mag_dffe23_wi = man_add_sub_res_mag_dffe21_wo,
		man_add_sub_res_mag_dffe23_wo = man_add_sub_res_mag_dffe23_wi,
		man_add_sub_res_mag_dffe26_wi = man_add_sub_res_mag_dffe23_wo,
		man_add_sub_res_mag_dffe26_wo = man_add_sub_res_mag_dffe26_wi,
		man_add_sub_res_mag_dffe27_wi = man_add_sub_res_mag_w2,
		man_add_sub_res_mag_dffe27_wo = man_add_sub_res_mag_dffe27_wi,
		man_add_sub_res_mag_w2 = (({28{man_add_sub_w[27]}} & man_2comp_res_w) | ({28{(~ man_add_sub_w[27])}} & man_add_sub_w)),
		man_add_sub_res_sign_dffe21_wo = man_add_sub_res_sign_dffe21,
		man_add_sub_res_sign_dffe23_wi = man_add_sub_res_sign_dffe21_wo,
		man_add_sub_res_sign_dffe23_wo = man_add_sub_res_sign_dffe23_wi,
		man_add_sub_res_sign_dffe26_wi = man_add_sub_res_sign_dffe23_wo,
		man_add_sub_res_sign_dffe26_wo = man_add_sub_res_sign_dffe26_wi,
		man_add_sub_res_sign_dffe27_wi = man_add_sub_res_sign_w2,
		man_add_sub_res_sign_dffe27_wo = man_add_sub_res_sign_dffe27_wi,
		man_add_sub_res_sign_w2 = ((need_complement_dffe22_wo & (~ man_add_sub_w[27])) | ((~ need_complement_dffe22_wo) & man_add_sub_w[27])),
		man_add_sub_w = {(({14{(~ wire_man_add_sub_lower_cout)}} & wire_man_add_sub_upper0_result) | ({14{wire_man_add_sub_lower_cout}} & wire_man_add_sub_upper1_result)), wire_man_add_sub_lower_result},
		man_all_zeros_w = {23{1'b0}},
		man_b_not_zero_w = {(datab[22] | man_b_not_zero_w[21]), (datab[21] | man_b_not_zero_w[20]), (datab[20] | man_b_not_zero_w[19]), (datab[19] | man_b_not_zero_w[18]), (datab[18] | man_b_not_zero_w[17]), (datab[17] | man_b_not_zero_w[16]), (datab[16] | man_b_not_zero_w[15]), (datab[15] | man_b_not_zero_w[14]), (datab[14] | man_b_not_zero_w[13]), (datab[13] | man_b_not_zero_w[12]), (datab[12] | man_b_not_zero_w[11]), (datab[11] | man_b_not_zero_w[10]), (datab[10] | man_b_not_zero_w[9]), (datab[9] | man_b_not_zero_w[8]), (datab[8] | man_b_not_zero_w[7]), (datab[7] | man_b_not_zero_w[6]), (datab[6] | man_b_not_zero_w[5]), (datab[5] | man_b_not_zero_w[4]), (datab[4] | man_b_not_zero_w[3]), (datab[3] | man_b_not_zero_w[2]), (datab[2] | man_b_not_zero_w[1]), (datab[1] | man_b_not_zero_w[0]), datab[0]},
		man_dffe31_wo = man_dffe31,
		man_intermediate_res_w = {{2{1'b0}}, man_res_w3},
		man_leading_zeros_cnt_w = man_leading_zeros_dffe31_wo,
		man_leading_zeros_dffe31_wi = (~ wire_leading_zeroes_cnt_q),
		man_leading_zeros_dffe31_wo = man_leading_zeros_dffe31,
		man_nan_w = 23'b10000000000000000000000,
		man_out_dffe5_wi = (({23{force_nan_w}} & man_nan_w) | ({23{(~ force_nan_w)}} & (({23{force_infinity_w}} & man_all_zeros_w) | ({23{(~ force_infinity_w)}} & (({23{(force_zero_w | denormal_flag_w)}} & man_all_zeros_w) | ({23{(~ (force_zero_w | denormal_flag_w))}} & man_res_dffe4_wo)))))),
		man_out_dffe5_wo = man_out_dffe5,
		man_res_dffe4_wi = man_rounded_res_w,
		man_res_dffe4_wo = man_res_dffe4,
		man_res_is_not_zero_dffe31_wi = man_res_not_zero_dffe26_wo,
		man_res_is_not_zero_dffe31_wo = man_res_is_not_zero_dffe31,
		man_res_is_not_zero_dffe32_wi = man_res_is_not_zero_dffe31_wo,
		man_res_is_not_zero_dffe32_wo = man_res_is_not_zero_dffe32_wi,
		man_res_is_not_zero_dffe33_wi = man_res_is_not_zero_dffe32_wo,
		man_res_is_not_zero_dffe33_wo = man_res_is_not_zero_dffe33_wi,
		man_res_is_not_zero_dffe3_wi = man_res_is_not_zero_dffe33_wo,
		man_res_is_not_zero_dffe3_wo = man_res_is_not_zero_dffe3,
		man_res_is_not_zero_dffe41_wi = man_res_is_not_zero_dffe42_wo,
		man_res_is_not_zero_dffe41_wo = man_res_is_not_zero_dffe41_wi,
		man_res_is_not_zero_dffe42_wi = man_res_is_not_zero_dffe3_wo,
		man_res_is_not_zero_dffe42_wo = man_res_is_not_zero_dffe42_wi,
		man_res_is_not_zero_dffe4_wi = man_res_is_not_zero_dffe41_wo,
		man_res_is_not_zero_dffe4_wo = man_res_is_not_zero_dffe4,
		man_res_mag_w2 = (({26{man_add_sub_res_mag_dffe27_wo[26]}} & man_add_sub_res_mag_dffe27_wo[26:1]) | ({26{(~ man_add_sub_res_mag_dffe27_wo[26])}} & man_add_sub_res_mag_dffe27_wo[25:0])),
		man_res_not_zero_dffe23_wi = man_res_not_zero_w2[24],
		man_res_not_zero_dffe23_wo = man_res_not_zero_dffe23_wi,
		man_res_not_zero_dffe26_wi = man_res_not_zero_dffe23_wo,
		man_res_not_zero_dffe26_wo = man_res_not_zero_dffe26_wi,
		man_res_not_zero_w2 = {(man_res_not_zero_w2[23] | man_add_sub_res_mag_dffe21_wo[25]), (man_res_not_zero_w2[22] | man_add_sub_res_mag_dffe21_wo[24]), (man_res_not_zero_w2[21] | man_add_sub_res_mag_dffe21_wo[23]), (man_res_not_zero_w2[20] | man_add_sub_res_mag_dffe21_wo[22]), (man_res_not_zero_w2[19] | man_add_sub_res_mag_dffe21_wo[21]), (man_res_not_zero_w2[18] | man_add_sub_res_mag_dffe21_wo[20]), (man_res_not_zero_w2[17] | man_add_sub_res_mag_dffe21_wo[19]), (man_res_not_zero_w2[16] | man_add_sub_res_mag_dffe21_wo[18]), (man_res_not_zero_w2[15] | man_add_sub_res_mag_dffe21_wo[17]), (man_res_not_zero_w2[14] | man_add_sub_res_mag_dffe21_wo[16]), (man_res_not_zero_w2[13] | man_add_sub_res_mag_dffe21_wo[15]), (man_res_not_zero_w2[12] | man_add_sub_res_mag_dffe21_wo[14]), (man_res_not_zero_w2[11] | man_add_sub_res_mag_dffe21_wo[13]), (man_res_not_zero_w2[10] | man_add_sub_res_mag_dffe21_wo[12]), (man_res_not_zero_w2[9] | man_add_sub_res_mag_dffe21_wo[11]), (man_res_not_zero_w2[8] | man_add_sub_res_mag_dffe21_wo[10]), (man_res_not_zero_w2[7] | man_add_sub_res_mag_dffe21_wo[9]), (man_res_not_zero_w2[6] | man_add_sub_res_mag_dffe21_wo[8]), (man_res_not_zero_w2[5] | man_add_sub_res_mag_dffe21_wo[7]), (man_res_not_zero_w2[4] | man_add_sub_res_mag_dffe21_wo[6]), (man_res_not_zero_w2[3] | man_add_sub_res_mag_dffe21_wo[5]), (man_res_not_zero_w2[2] | man_add_sub_res_mag_dffe21_wo[4]), (man_res_not_zero_w2[1] | man_add_sub_res_mag_dffe21_wo[3]), (man_res_not_zero_w2[0] | man_add_sub_res_mag_dffe21_wo[2]), man_add_sub_res_mag_dffe21_wo[1]},
		man_res_rounding_add_sub_datab_w = {{25{1'b0}}, man_rounding_add_value_w},
		man_res_rounding_add_sub_w = {(({13{(~ wire_man_res_rounding_add_sub_lower_cout)}} & adder_upper_w) | ({13{wire_man_res_rounding_add_sub_lower_cout}} & wire_man_res_rounding_add_sub_upper1_result)), wire_man_res_rounding_add_sub_lower_result},
		man_res_w3 = wire_lbarrel_shift_result[25:2],
		man_rounded_res_w = (({23{man_res_rounding_add_sub_w[24]}} & man_res_rounding_add_sub_w[23:1]) | ({23{(~ man_res_rounding_add_sub_w[24])}} & man_res_rounding_add_sub_w[22:0])),
		man_rounding_add_value_w = (round_bit_dffe3_wo & (sticky_bit_dffe3_wo | guard_bit_dffe3_wo)),
		man_smaller_dffe13_wi = man_smaller_w,
		man_smaller_dffe13_wo = man_smaller_dffe13_wi,
		man_smaller_w = (({24{exp_amb_mux_w}} & aligned_dataa_man_dffe12_wo) | ({24{(~ exp_amb_mux_w)}} & aligned_datab_man_dffe12_wo)),
		need_complement_dffe22_wi = need_complement_dffe2_wo,
		need_complement_dffe22_wo = need_complement_dffe22_wi,
		need_complement_dffe2_wi = dataa_sign_dffe25_wo,
		need_complement_dffe2_wo = need_complement_dffe2,
		pos_sign_bit_ext = {2{1'b0}},
		priority_encoder_1pads_w = {4{1'b1}},
		result = {sign_out_dffe5_wo, exp_out_dffe5_wo, man_out_dffe5_wo},
		round_bit_dffe21_wi = round_bit_w,
		round_bit_dffe21_wo = round_bit_dffe21,
		round_bit_dffe23_wi = round_bit_dffe21_wo,
		round_bit_dffe23_wo = round_bit_dffe23_wi,
		round_bit_dffe26_wi = round_bit_dffe23_wo,
		round_bit_dffe26_wo = round_bit_dffe26_wi,
		round_bit_dffe31_wi = round_bit_dffe26_wo,
		round_bit_dffe31_wo = round_bit_dffe31,
		round_bit_dffe32_wi = round_bit_dffe31_wo,
		round_bit_dffe32_wo = round_bit_dffe32_wi,
		round_bit_dffe33_wi = round_bit_dffe32_wo,
		round_bit_dffe33_wo = round_bit_dffe33_wi,
		round_bit_dffe3_wi = round_bit_dffe33_wo,
		round_bit_dffe3_wo = round_bit_dffe3,
		round_bit_w = ((((((~ man_add_sub_res_mag_dffe27_wo[26]) & (~ man_add_sub_res_mag_dffe27_wo[25])) & man_add_sub_res_mag_dffe27_wo[0]) | (((~ man_add_sub_res_mag_dffe27_wo[26]) & man_add_sub_res_mag_dffe27_wo[25]) & man_add_sub_res_mag_dffe27_wo[1])) | ((man_add_sub_res_mag_dffe27_wo[26] & (~ man_add_sub_res_mag_dffe27_wo[25])) & man_add_sub_res_mag_dffe27_wo[2])) | ((man_add_sub_res_mag_dffe27_wo[26] & man_add_sub_res_mag_dffe27_wo[25]) & man_add_sub_res_mag_dffe27_wo[2])),
		rounded_res_infinity_dffe4_wi = exp_rounded_res_infinity_w,
		rounded_res_infinity_dffe4_wo = rounded_res_infinity_dffe4,
		rshift_distance_dffe13_wi = rshift_distance_w,
		rshift_distance_dffe13_wo = rshift_distance_dffe13_wi,
		rshift_distance_dffe14_wi = rshift_distance_dffe13_wo,
		rshift_distance_dffe14_wo = rshift_distance_dffe14_wi,
		rshift_distance_dffe15_wi = rshift_distance_dffe14_wo,
		rshift_distance_dffe15_wo = rshift_distance_dffe15_wi,
		rshift_distance_w = (({5{exp_diff_abs_exceed_max_w[2]}} & exp_diff_abs_max_w) | ({5{(~ exp_diff_abs_exceed_max_w[2])}} & exp_diff_abs_w[4:0])),
		sign_dffe31_wi = ((man_res_not_zero_dffe26_wo & man_add_sub_res_sign_dffe26_wo) | ((~ man_res_not_zero_dffe26_wo) & zero_man_sign_dffe26_wo)),
		sign_dffe31_wo = sign_dffe31,
		sign_dffe32_wi = sign_dffe31_wo,
		sign_dffe32_wo = sign_dffe32_wi,
		sign_dffe33_wi = sign_dffe32_wo,
		sign_dffe33_wo = sign_dffe33_wi,
		sign_out_dffe5_wi = ((~ force_nan_w) & ((force_infinity_w & infinite_output_sign_dffe4_wo) | ((~ force_infinity_w) & sign_res_dffe4_wo))),
		sign_out_dffe5_wo = sign_out_dffe5,
		sign_res_dffe3_wi = sign_dffe33_wo,
		sign_res_dffe3_wo = sign_res_dffe3,
		sign_res_dffe41_wi = sign_res_dffe42_wo,
		sign_res_dffe41_wo = sign_res_dffe41_wi,
		sign_res_dffe42_wi = sign_res_dffe3_wo,
		sign_res_dffe42_wo = sign_res_dffe42_wi,
		sign_res_dffe4_wi = sign_res_dffe41_wo,
		sign_res_dffe4_wo = sign_res_dffe4,
		sticky_bit_cnt_dataa_w = {1'b0, rshift_distance_dffe15_wo},
		sticky_bit_cnt_datab_w = {1'b0, wire_trailing_zeros_cnt_q},
		sticky_bit_cnt_res_w = wire_add_sub3_result,
		sticky_bit_dffe1_wi = wire_trailing_zeros_limit_comparator_agb,
		sticky_bit_dffe1_wo = sticky_bit_dffe1,
		sticky_bit_dffe21_wi = sticky_bit_w,
		sticky_bit_dffe21_wo = sticky_bit_dffe21,
		sticky_bit_dffe22_wi = sticky_bit_dffe2_wo,
		sticky_bit_dffe22_wo = sticky_bit_dffe22_wi,
		sticky_bit_dffe23_wi = sticky_bit_dffe21_wo,
		sticky_bit_dffe23_wo = sticky_bit_dffe23_wi,
		sticky_bit_dffe25_wi = sticky_bit_dffe1_wo,
		sticky_bit_dffe25_wo = sticky_bit_dffe25_wi,
		sticky_bit_dffe26_wi = sticky_bit_dffe23_wo,
		sticky_bit_dffe26_wo = sticky_bit_dffe26_wi,
		sticky_bit_dffe27_wi = sticky_bit_dffe22_wo,
		sticky_bit_dffe27_wo = sticky_bit_dffe27_wi,
		sticky_bit_dffe2_wi = sticky_bit_dffe25_wo,
		sticky_bit_dffe2_wo = sticky_bit_dffe2,
		sticky_bit_dffe31_wi = sticky_bit_dffe26_wo,
		sticky_bit_dffe31_wo = sticky_bit_dffe31,
		sticky_bit_dffe32_wi = sticky_bit_dffe31_wo,
		sticky_bit_dffe32_wo = sticky_bit_dffe32_wi,
		sticky_bit_dffe33_wi = sticky_bit_dffe32_wo,
		sticky_bit_dffe33_wo = sticky_bit_dffe33_wi,
		sticky_bit_dffe3_wi = sticky_bit_dffe33_wo,
		sticky_bit_dffe3_wo = sticky_bit_dffe3,
		sticky_bit_w = ((((((~ man_add_sub_res_mag_dffe27_wo[26]) & (~ man_add_sub_res_mag_dffe27_wo[25])) & sticky_bit_dffe27_wo) | (((~ man_add_sub_res_mag_dffe27_wo[26]) & man_add_sub_res_mag_dffe27_wo[25]) & (sticky_bit_dffe27_wo | man_add_sub_res_mag_dffe27_wo[0]))) | ((man_add_sub_res_mag_dffe27_wo[26] & (~ man_add_sub_res_mag_dffe27_wo[25])) & ((sticky_bit_dffe27_wo | man_add_sub_res_mag_dffe27_wo[0]) | man_add_sub_res_mag_dffe27_wo[1]))) | ((man_add_sub_res_mag_dffe27_wo[26] & man_add_sub_res_mag_dffe27_wo[25]) & ((sticky_bit_dffe27_wo | man_add_sub_res_mag_dffe27_wo[0]) | man_add_sub_res_mag_dffe27_wo[1]))),
		trailing_zeros_limit_w = 6'b000010,
		zero_man_sign_dffe21_wi = zero_man_sign_dffe27_wo,
		zero_man_sign_dffe21_wo = zero_man_sign_dffe21,
		zero_man_sign_dffe22_wi = zero_man_sign_dffe2_wo,
		zero_man_sign_dffe22_wo = zero_man_sign_dffe22_wi,
		zero_man_sign_dffe23_wi = zero_man_sign_dffe21_wo,
		zero_man_sign_dffe23_wo = zero_man_sign_dffe23_wi,
		zero_man_sign_dffe26_wi = zero_man_sign_dffe23_wo,
		zero_man_sign_dffe26_wo = zero_man_sign_dffe26_wi,
		zero_man_sign_dffe27_wi = zero_man_sign_dffe22_wo,
		zero_man_sign_dffe27_wo = zero_man_sign_dffe27_wi,
		zero_man_sign_dffe2_wi = (dataa_sign_dffe25_wo & add_sub_dffe25_wo),
		zero_man_sign_dffe2_wo = zero_man_sign_dffe2;
endmodule //fpoint_hw_qsys_addsub_single
//VALID FILE

//altfp_div CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DECODER_SUPPORT="YES" DENORMAL_SUPPORT="NO" DEVICE_FAMILY="STRATIXIV" EXCEPTION_HANDLING="NO" PIPELINE=33 REDUCED_FUNCTIONALITY="NO" WIDTH_EXP=8 WIDTH_MAN=23 aclr clk_en clock dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2010 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.




//altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="YES" LPM_DIRECTION="ADD" LPM_WIDTH=24 cin cout dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_add_sub 2 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_altfp_div_csa_vhf
	( 
	cin,
	cout,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   cin;
	output   cout;
	input   [23:0]  dataa;
	input   [23:0]  datab;
	output   [23:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   cin;
	tri0   [23:0]  dataa;
	tri0   [23:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [11:0]   wire_csa_lower_result;
	wire  wire_csa_upper1_cout;
	wire  [11:0]   wire_csa_upper1_result;
	wire  [11:0]  adder_upper_w;
	wire  cout_w;
	wire  [23:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.cin(cin),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[11:0]),
	.datab(datab[11:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_representation = "SIGNED",
		csa_lower.lpm_width = 12,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.cin(1'b1),
	.cout(wire_csa_upper1_cout),
	.dataa(dataa[23:12]),
	.datab(datab[23:12]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_representation = "SIGNED",
		csa_upper1.lpm_width = 12,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		adder_upper_w = dataa[23:12],
		cout = cout_w,
		cout_w = (wire_csa_lower_cout & wire_csa_upper1_cout),
		result = result_w,
		result_w = {(({12{(~ wire_csa_lower_cout)}} & adder_upper_w) | ({12{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //fpoint_hw_qsys_div_single_altfp_div_csa_vhf


//altfp_div_srt_ext CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="STRATIXIV" ITERATION=14 OPTMIZE="SPEED" WIDTH_DIV=24 aclr clken clock denom divider numer quotient remain
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END


//altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="ADD" LPM_WIDTH=24 dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_altfp_div_csa_mke
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [23:0]  dataa;
	input   [23:0]  datab;
	output   [23:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [23:0]  dataa;
	tri0   [23:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [11:0]   wire_csa_lower_result;
	wire  [11:0]   wire_csa_upper0_result;
	wire  [11:0]   wire_csa_upper1_result;
	wire  [23:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.cout(wire_csa_lower_cout),
	.dataa(dataa[11:0]),
	.datab(datab[11:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_representation = "SIGNED",
		csa_lower.lpm_width = 12,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.cin(1'b0),
	.cout(),
	.dataa(dataa[23:12]),
	.datab(datab[23:12]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_representation = "SIGNED",
		csa_upper0.lpm_width = 12,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.cin(1'b1),
	.cout(),
	.dataa(dataa[23:12]),
	.datab(datab[23:12]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_representation = "SIGNED",
		csa_upper1.lpm_width = 12,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({12{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({12{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //fpoint_hw_qsys_div_single_altfp_div_csa_mke


//altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_WIDTH=28 aclr clken clock dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_altfp_div_csa_2jh
	( 
	aclr,
	clken,
	clock,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [27:0]  dataa;
	input   [27:0]  datab;
	output   [27:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [27:0]  dataa;
	tri0   [27:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [13:0]   wire_csa_lower_result;
	wire  [13:0]   wire_csa_upper0_result;
	wire  [13:0]   wire_csa_upper1_result;
	wire  [27:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.cout(wire_csa_lower_cout),
	.dataa(dataa[13:0]),
	.datab(datab[13:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_pipeline = 1,
		csa_lower.lpm_representation = "SIGNED",
		csa_lower.lpm_width = 14,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[27:14]),
	.datab(datab[27:14]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_pipeline = 1,
		csa_upper0.lpm_representation = "SIGNED",
		csa_upper0.lpm_width = 14,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.aclr(aclr),
	.cin(1'b1),
	.clken(clken),
	.clock(clock),
	.cout(),
	.dataa(dataa[27:14]),
	.datab(datab[27:14]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_pipeline = 1,
		csa_upper1.lpm_representation = "SIGNED",
		csa_upper1.lpm_width = 14,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({14{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({14{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //fpoint_hw_qsys_div_single_altfp_div_csa_2jh


//altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="SUB" LPM_WIDTH=28 dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_altfp_div_csa_rle
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [27:0]  dataa;
	input   [27:0]  datab;
	output   [27:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [27:0]  dataa;
	tri0   [27:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [13:0]   wire_csa_lower_result;
	wire  [13:0]   wire_csa_upper0_result;
	wire  [13:0]   wire_csa_upper1_result;
	wire  [27:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.cout(wire_csa_lower_cout),
	.dataa(dataa[13:0]),
	.datab(datab[13:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_representation = "SIGNED",
		csa_lower.lpm_width = 14,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.cin(1'b0),
	.cout(),
	.dataa(dataa[27:14]),
	.datab(datab[27:14]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_representation = "SIGNED",
		csa_upper0.lpm_width = 14,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.cin(1'b1),
	.cout(),
	.dataa(dataa[27:14]),
	.datab(datab[27:14]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_representation = "SIGNED",
		csa_upper1.lpm_width = 14,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({14{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({14{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //fpoint_hw_qsys_div_single_altfp_div_csa_rle


//srt_block_int CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="STRATIXIV" OPTIMIZE="SPEED" POSITION="FIRST" WIDTH_DIV=24 WIDTH_RK_IN=24 WIDTH_RK_OUT=25 WIDTH_ROM=3 WIDTH_ROM_ADD=12 aclr clken clock divider divider_reg Rk Rk_next rom
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END


//altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="ADD" LPM_WIDTH=27 dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_altfp_div_csa_pke
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [26:0]  dataa;
	input   [26:0]  datab;
	output   [26:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [26:0]  dataa;
	tri0   [26:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [13:0]   wire_csa_lower_result;
	wire  [12:0]   wire_csa_upper0_result;
	wire  [12:0]   wire_csa_upper1_result;
	wire  [26:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.cout(wire_csa_lower_cout),
	.dataa(dataa[13:0]),
	.datab(datab[13:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "ADD",
		csa_lower.lpm_representation = "SIGNED",
		csa_lower.lpm_width = 14,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.cin(1'b0),
	.cout(),
	.dataa(dataa[26:14]),
	.datab(datab[26:14]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "ADD",
		csa_upper0.lpm_representation = "SIGNED",
		csa_upper0.lpm_width = 13,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.cin(1'b1),
	.cout(),
	.dataa(dataa[26:14]),
	.datab(datab[26:14]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "ADD",
		csa_upper1.lpm_representation = "SIGNED",
		csa_upper1.lpm_width = 13,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({13{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({13{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //fpoint_hw_qsys_div_single_altfp_div_csa_pke


//altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="SUB" LPM_WIDTH=27 dataa datab result
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_add_sub 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_altfp_div_csa_qle
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [26:0]  dataa;
	input   [26:0]  datab;
	output   [26:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [26:0]  dataa;
	tri0   [26:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_csa_lower_cout;
	wire  [13:0]   wire_csa_lower_result;
	wire  [12:0]   wire_csa_upper0_result;
	wire  [12:0]   wire_csa_upper1_result;
	wire  [26:0]  result_w;

	lpm_add_sub   csa_lower
	( 
	.cout(wire_csa_lower_cout),
	.dataa(dataa[13:0]),
	.datab(datab[13:0]),
	.overflow(),
	.result(wire_csa_lower_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_lower.lpm_direction = "SUB",
		csa_lower.lpm_representation = "SIGNED",
		csa_lower.lpm_width = 14,
		csa_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper0
	( 
	.cin(1'b0),
	.cout(),
	.dataa(dataa[26:14]),
	.datab(datab[26:14]),
	.overflow(),
	.result(wire_csa_upper0_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper0.lpm_direction = "SUB",
		csa_upper0.lpm_representation = "SIGNED",
		csa_upper0.lpm_width = 13,
		csa_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   csa_upper1
	( 
	.cin(1'b1),
	.cout(),
	.dataa(dataa[26:14]),
	.datab(datab[26:14]),
	.overflow(),
	.result(wire_csa_upper1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		csa_upper1.lpm_direction = "SUB",
		csa_upper1.lpm_representation = "SIGNED",
		csa_upper1.lpm_width = 13,
		csa_upper1.lpm_type = "lpm_add_sub";
	assign
		result = result_w,
		result_w = {(({13{(~ wire_csa_lower_cout)}} & wire_csa_upper0_result) | ({13{wire_csa_lower_cout}} & wire_csa_upper1_result)), wire_csa_lower_result};
endmodule //fpoint_hw_qsys_div_single_altfp_div_csa_qle


//qds_block CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" FIRST_QDS="YES" aclr clken clock decoder_bus decoder_output
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_compare 4 lpm_mux 1 reg 2 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_qds_block_mab
	( 
	aclr,
	clken,
	clock,
	decoder_bus,
	decoder_output) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [11:0]  decoder_bus;
	output   [2:0]  decoder_output;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[1:0]	q_next_dffe;
	wire  wire_cmpr35_aleb;
	wire  wire_cmpr36_aleb;
	wire  wire_cmpr37_aleb;
	wire  wire_cmpr38_aleb;
	wire  [31:0]   wire_mux34_result;
	wire  [2:0]  decoder_output_w;
	wire  [3:0]  Div_w;
	wire  [3:0]  k_comp_w;
	wire  [511:0]  mk_bus_const_w;
	wire  [31:0]  mk_bus_w;
	wire  [8:0]  mk_neg1_w;
	wire  [8:0]  mk_pos0_w;
	wire  [8:0]  mk_pos1_w;
	wire  [8:0]  mk_pos2_w;
	wire  [2:0]  q_next_w;
	wire  [8:0]  Rk_in_w;
	wire  [8:0]  Rk_w;

	// synopsys translate_off
	initial
		q_next_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_next_dffe <= 2'b0;
		else if  (clken == 1'b1)   q_next_dffe <= q_next_w[1:0];
	lpm_compare   cmpr35
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr35_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_neg1_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr35.lpm_representation = "SIGNED",
		cmpr35.lpm_width = 9,
		cmpr35.lpm_type = "lpm_compare";
	lpm_compare   cmpr36
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr36_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_pos0_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr36.lpm_representation = "SIGNED",
		cmpr36.lpm_width = 9,
		cmpr36.lpm_type = "lpm_compare";
	lpm_compare   cmpr37
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr37_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_pos1_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr37.lpm_representation = "SIGNED",
		cmpr37.lpm_width = 9,
		cmpr37.lpm_type = "lpm_compare";
	lpm_compare   cmpr38
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr38_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_pos2_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr38.lpm_representation = "SIGNED",
		cmpr38.lpm_width = 9,
		cmpr38.lpm_type = "lpm_compare";
	lpm_mux   mux34
	( 
	.data(mk_bus_const_w),
	.result(wire_mux34_result),
	.sel(Div_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mux34.lpm_size = 16,
		mux34.lpm_width = 32,
		mux34.lpm_widths = 4,
		mux34.lpm_type = "lpm_mux";
	assign
		decoder_output = decoder_output_w,
		decoder_output_w = {1'b0, q_next_dffe},
		Div_w = decoder_bus[3:0],
		k_comp_w = {wire_cmpr38_aleb, wire_cmpr37_aleb, wire_cmpr36_aleb, wire_cmpr35_aleb},
		mk_bus_const_w = {32'b01011101000111111110000110100011, 32'b01011010000111101110001010100110, 32'b01010111000111011110001110101001, 32'b01010100000111001110010010101100, 32'b01010001000110111110010110101111, 32'b01001110000110101110011010110010, 32'b01001011000110011110011110110101, 32'b01001000000110001110100010111000, 32'b01000101000101111110100110111011, 32'b01000010000101101110101010111110, 32'b00111111000101011110101111000001, 32'b00111100000101001110110011000100, 32'b00111001000100111110110111000111, 32'b00110110000100101110111011001010, 32'b00110011000100011110111111001101, 32'b00110000000100001111000011010000},
		mk_bus_w = wire_mux34_result,
		mk_neg1_w = {mk_bus_w[7], mk_bus_w[7:0]},
		mk_pos0_w = {mk_bus_w[15], mk_bus_w[15:8]},
		mk_pos1_w = {mk_bus_w[23], mk_bus_w[23:16]},
		mk_pos2_w = {mk_bus_w[31], mk_bus_w[31:24]},
		q_next_w = {k_comp_w[1], ((~ k_comp_w[3]) | k_comp_w[0]), ((k_comp_w[3] & (~ k_comp_w[2])) | (k_comp_w[1] & (~ k_comp_w[0])))},
		Rk_in_w = {decoder_bus[11:4], 1'b0},
		Rk_w = Rk_in_w;
endmodule //fpoint_hw_qsys_div_single_qds_block_mab

//synthesis_resources = lpm_add_sub 12 lpm_compare 4 lpm_mux 2 reg 197 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_srt_block_int_02n
	( 
	aclr,
	clken,
	clock,
	divider,
	divider_reg,
	Rk,
	Rk_next,
	rom) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [23:0]  divider;
	output   [23:0]  divider_reg;
	input   [23:0]  Rk;
	output   [24:0]  Rk_next;
	output   [2:0]  rom;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [26:0]   wire_altfp_div_csa29_result;
	wire  [26:0]   wire_altfp_div_csa30_result;
	wire  [26:0]   wire_altfp_div_csa31_result;
	wire  [26:0]   wire_altfp_div_csa32_result;
	reg	[22:0]	divider_dffe;
	reg	[22:0]	divider_dffe_1a;
	reg	[24:0]	neg_qk1d_dffe;
	reg	[24:0]	neg_qk2d_dffe;
	reg	[24:0]	pos_qk1d_dffe;
	reg	[24:0]	pos_qk2d_dffe;
	reg	[20:0]	Rk_adder_padded_dffe;
	reg	[24:0]	Rk_next_dffe;
	reg	[2:0]	rom_out_dffe;
	wire  [24:0]   wire_mux33_result;
	wire  [2:0]   wire_qds_block28_decoder_output;
	wire  [26:0]  divider_1D_w;
	wire  [26:0]  divider_2D_w;
	wire  [22:0]  divider_dffe_1a_w;
	wire  [23:0]  divider_dffe_w;
	wire  [23:0]  divider_in_w;
	wire  [24:0]  neg_qk1d_int_w;
	wire  [24:0]  neg_qk2d_int_w;
	wire  [1:0]  padded_2_zeros_w;
	wire  [2:0]  padded_3_zeros_w;
	wire  [24:0]  pos_qk0d_int_w;
	wire  [24:0]  pos_qk1d_int_w;
	wire  [24:0]  pos_qk2d_int_w;
	wire  [199:0]  qkd_mux_input_w;
	wire  [24:0]  qkd_mux_w;
	wire  [26:0]  Rk_adder_padded_w;
	wire  [23:0]  Rk_dffe_1a_w;
	wire  [23:0]  Rk_in_w;
	wire  [24:0]  Rk_next_dffe_w;
	wire  [11:0]  rom_add_w;
	wire  [2:0]  rom_mux_w;
	wire  [2:0]  rom_out_1a_w;
	wire  [2:0]  rom_out_dffe_w;

	fpoint_hw_qsys_div_single_altfp_div_csa_pke   altfp_div_csa29
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_1D_w),
	.result(wire_altfp_div_csa29_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_pke   altfp_div_csa30
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_2D_w),
	.result(wire_altfp_div_csa30_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_qle   altfp_div_csa31
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_1D_w),
	.result(wire_altfp_div_csa31_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_qle   altfp_div_csa32
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_2D_w),
	.result(wire_altfp_div_csa32_result));
	// synopsys translate_off
	initial
		divider_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divider_dffe <= 23'b0;
		else if  (clken == 1'b1)   divider_dffe <= divider_dffe_1a_w;
	// synopsys translate_off
	initial
		divider_dffe_1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divider_dffe_1a <= 23'b0;
		else if  (clken == 1'b1)   divider_dffe_1a <= divider_in_w[22:0];
	// synopsys translate_off
	initial
		neg_qk1d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) neg_qk1d_dffe <= 25'b0;
		else if  (clken == 1'b1)   neg_qk1d_dffe <= wire_altfp_div_csa31_result[24:0];
	// synopsys translate_off
	initial
		neg_qk2d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) neg_qk2d_dffe <= 25'b0;
		else if  (clken == 1'b1)   neg_qk2d_dffe <= wire_altfp_div_csa32_result[24:0];
	// synopsys translate_off
	initial
		pos_qk1d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pos_qk1d_dffe <= 25'b0;
		else if  (clken == 1'b1)   pos_qk1d_dffe <= wire_altfp_div_csa29_result[24:0];
	// synopsys translate_off
	initial
		pos_qk2d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pos_qk2d_dffe <= 25'b0;
		else if  (clken == 1'b1)   pos_qk2d_dffe <= wire_altfp_div_csa30_result[24:0];
	// synopsys translate_off
	initial
		Rk_adder_padded_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Rk_adder_padded_dffe <= 21'b0;
		else if  (clken == 1'b1)   Rk_adder_padded_dffe <= Rk_adder_padded_w[20:0];
	// synopsys translate_off
	initial
		Rk_next_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Rk_next_dffe <= 25'b0;
		else if  (clken == 1'b1)   Rk_next_dffe <= qkd_mux_w;
	// synopsys translate_off
	initial
		rom_out_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_out_dffe <= 3'b0;
		else if  (clken == 1'b1)   rom_out_dffe <= rom_out_1a_w;
	lpm_mux   mux33
	( 
	.data(qkd_mux_input_w),
	.result(wire_mux33_result),
	.sel(rom_mux_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mux33.lpm_size = 8,
		mux33.lpm_width = 25,
		mux33.lpm_widths = 3,
		mux33.lpm_type = "lpm_mux";
	fpoint_hw_qsys_div_single_qds_block_mab   qds_block28
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.decoder_bus(rom_add_w),
	.decoder_output(wire_qds_block28_decoder_output));
	assign
		divider_1D_w = {padded_3_zeros_w, divider_in_w},
		divider_2D_w = {padded_2_zeros_w, divider_in_w, 1'b0},
		divider_dffe_1a_w = divider_dffe_1a,
		divider_dffe_w = {1'b1, divider_dffe},
		divider_in_w = divider,
		divider_reg = divider_dffe_w,
		neg_qk1d_int_w = neg_qk1d_dffe,
		neg_qk2d_int_w = neg_qk2d_dffe,
		padded_2_zeros_w = {2{1'b0}},
		padded_3_zeros_w = {3{1'b0}},
		pos_qk0d_int_w = {padded_3_zeros_w, 1'b1, Rk_adder_padded_dffe[20:0]},
		pos_qk1d_int_w = pos_qk1d_dffe,
		pos_qk2d_int_w = pos_qk2d_dffe,
		qkd_mux_input_w = {{2{pos_qk2d_int_w}}, pos_qk1d_int_w, pos_qk0d_int_w, {2{neg_qk2d_int_w}}, neg_qk1d_int_w, pos_qk0d_int_w},
		qkd_mux_w = wire_mux33_result[24:0],
		Rk_adder_padded_w = {padded_3_zeros_w, Rk_dffe_1a_w},
		Rk_dffe_1a_w = Rk_in_w,
		Rk_in_w = Rk,
		Rk_next = Rk_next_dffe_w,
		Rk_next_dffe_w = Rk_next_dffe,
		rom = rom_out_dffe_w,
		rom_add_w = {padded_3_zeros_w, Rk_in_w[23:19], divider_in_w[22:19]},
		rom_mux_w = rom_out_1a_w,
		rom_out_1a_w = wire_qds_block28_decoder_output,
		rom_out_dffe_w = rom_out_dffe;
endmodule //fpoint_hw_qsys_div_single_srt_block_int_02n


//srt_block_int CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="STRATIXIV" OPTIMIZE="SPEED" POSITION="MIDDLE" WIDTH_DIV=24 WIDTH_RK_IN=25 WIDTH_RK_OUT=25 WIDTH_ROM=3 WIDTH_ROM_ADD=12 aclr clken clock divider divider_reg Rk Rk_next rom
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END


//qds_block CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" aclr clken clock decoder_bus decoder_output
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_compare 4 lpm_mux 1 reg 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_qds_block_ls9
	( 
	aclr,
	clken,
	clock,
	decoder_bus,
	decoder_output) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [11:0]  decoder_bus;
	output   [2:0]  decoder_output;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[2:0]	q_next_dffe;
	wire  wire_cmpr46_aleb;
	wire  wire_cmpr47_aleb;
	wire  wire_cmpr48_aleb;
	wire  wire_cmpr49_aleb;
	wire  [31:0]   wire_mux45_result;
	wire  [2:0]  decoder_output_w;
	wire  [3:0]  Div_w;
	wire  [3:0]  k_comp_w;
	wire  [511:0]  mk_bus_const_w;
	wire  [31:0]  mk_bus_w;
	wire  [8:0]  mk_neg1_w;
	wire  [8:0]  mk_pos0_w;
	wire  [8:0]  mk_pos1_w;
	wire  [8:0]  mk_pos2_w;
	wire  [2:0]  q_next_w;
	wire  [8:0]  Rk_in_w;
	wire  [8:0]  Rk_w;

	// synopsys translate_off
	initial
		q_next_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_next_dffe <= 3'b0;
		else if  (clken == 1'b1)   q_next_dffe <= q_next_w;
	lpm_compare   cmpr46
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr46_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_neg1_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr46.lpm_representation = "SIGNED",
		cmpr46.lpm_width = 9,
		cmpr46.lpm_type = "lpm_compare";
	lpm_compare   cmpr47
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr47_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_pos0_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr47.lpm_representation = "SIGNED",
		cmpr47.lpm_width = 9,
		cmpr47.lpm_type = "lpm_compare";
	lpm_compare   cmpr48
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr48_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_pos1_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr48.lpm_representation = "SIGNED",
		cmpr48.lpm_width = 9,
		cmpr48.lpm_type = "lpm_compare";
	lpm_compare   cmpr49
	( 
	.aeb(),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(wire_cmpr49_aleb),
	.aneb(),
	.dataa(Rk_w),
	.datab(mk_pos2_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr49.lpm_representation = "SIGNED",
		cmpr49.lpm_width = 9,
		cmpr49.lpm_type = "lpm_compare";
	lpm_mux   mux45
	( 
	.data(mk_bus_const_w),
	.result(wire_mux45_result),
	.sel(Div_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mux45.lpm_size = 16,
		mux45.lpm_width = 32,
		mux45.lpm_widths = 4,
		mux45.lpm_type = "lpm_mux";
	assign
		decoder_output = decoder_output_w,
		decoder_output_w = q_next_dffe,
		Div_w = decoder_bus[3:0],
		k_comp_w = {wire_cmpr49_aleb, wire_cmpr48_aleb, wire_cmpr47_aleb, wire_cmpr46_aleb},
		mk_bus_const_w = {32'b01011101000111111110000110100011, 32'b01011010000111101110001010100110, 32'b01010111000111011110001110101001, 32'b01010100000111001110010010101100, 32'b01010001000110111110010110101111, 32'b01001110000110101110011010110010, 32'b01001011000110011110011110110101, 32'b01001000000110001110100010111000, 32'b01000101000101111110100110111011, 32'b01000010000101101110101010111110, 32'b00111111000101011110101111000001, 32'b00111100000101001110110011000100, 32'b00111001000100111110110111000111, 32'b00110110000100101110111011001010, 32'b00110011000100011110111111001101, 32'b00110000000100001111000011010000},
		mk_bus_w = wire_mux45_result,
		mk_neg1_w = {mk_bus_w[7], mk_bus_w[7:0]},
		mk_pos0_w = {mk_bus_w[15], mk_bus_w[15:8]},
		mk_pos1_w = {mk_bus_w[23], mk_bus_w[23:16]},
		mk_pos2_w = {mk_bus_w[31], mk_bus_w[31:24]},
		q_next_w = {k_comp_w[1], ((~ k_comp_w[3]) | k_comp_w[0]), ((k_comp_w[3] & (~ k_comp_w[2])) | (k_comp_w[1] & (~ k_comp_w[0])))},
		Rk_in_w = {decoder_bus[11:4], 1'b0},
		Rk_w = Rk_in_w;
endmodule //fpoint_hw_qsys_div_single_qds_block_ls9

//synthesis_resources = lpm_add_sub 12 lpm_compare 4 lpm_mux 2 reg 200 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_srt_block_int_84n
	( 
	aclr,
	clken,
	clock,
	divider,
	divider_reg,
	Rk,
	Rk_next,
	rom) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [23:0]  divider;
	output   [23:0]  divider_reg;
	input   [24:0]  Rk;
	output   [24:0]  Rk_next;
	output   [2:0]  rom;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [26:0]   wire_altfp_div_csa40_result;
	wire  [26:0]   wire_altfp_div_csa41_result;
	wire  [26:0]   wire_altfp_div_csa42_result;
	wire  [26:0]   wire_altfp_div_csa43_result;
	reg	[22:0]	divider_dffe;
	reg	[22:0]	divider_dffe_1a;
	reg	[24:0]	neg_qk1d_dffe;
	reg	[23:0]	neg_qk2d_dffe;
	reg	[24:0]	pos_qk1d_dffe;
	reg	[23:0]	pos_qk2d_dffe;
	reg	[24:0]	Rk_adder_padded_dffe;
	reg	[24:0]	Rk_next_dffe;
	reg	[2:0]	rom_out_dffe;
	wire  [24:0]   wire_mux44_result;
	wire  [2:0]   wire_qds_block39_decoder_output;
	wire  [26:0]  divider_1D_w;
	wire  [26:0]  divider_2D_w;
	wire  [22:0]  divider_dffe_1a_w;
	wire  [23:0]  divider_dffe_w;
	wire  [23:0]  divider_in_w;
	wire  [24:0]  neg_qk1d_int_w;
	wire  [24:0]  neg_qk2d_int_w;
	wire  [1:0]  padded_2_zeros_w;
	wire  [2:0]  padded_3_zeros_w;
	wire  [24:0]  pos_qk0d_int_w;
	wire  [24:0]  pos_qk1d_int_w;
	wire  [24:0]  pos_qk2d_int_w;
	wire  [199:0]  qkd_mux_input_w;
	wire  [24:0]  qkd_mux_w;
	wire  [26:0]  Rk_adder_padded_w;
	wire  [24:0]  Rk_dffe_1a_w;
	wire  [24:0]  Rk_in_w;
	wire  [24:0]  Rk_next_dffe_w;
	wire  [11:0]  rom_add_w;
	wire  [2:0]  rom_mux_w;
	wire  [2:0]  rom_out_1a_w;
	wire  [2:0]  rom_out_dffe_w;

	fpoint_hw_qsys_div_single_altfp_div_csa_pke   altfp_div_csa40
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_1D_w),
	.result(wire_altfp_div_csa40_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_pke   altfp_div_csa41
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_2D_w),
	.result(wire_altfp_div_csa41_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_qle   altfp_div_csa42
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_1D_w),
	.result(wire_altfp_div_csa42_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_qle   altfp_div_csa43
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_2D_w),
	.result(wire_altfp_div_csa43_result));
	// synopsys translate_off
	initial
		divider_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divider_dffe <= 23'b0;
		else if  (clken == 1'b1)   divider_dffe <= divider_dffe_1a_w;
	// synopsys translate_off
	initial
		divider_dffe_1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divider_dffe_1a <= 23'b0;
		else if  (clken == 1'b1)   divider_dffe_1a <= divider_in_w[22:0];
	// synopsys translate_off
	initial
		neg_qk1d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) neg_qk1d_dffe <= 25'b0;
		else if  (clken == 1'b1)   neg_qk1d_dffe <= wire_altfp_div_csa42_result[24:0];
	// synopsys translate_off
	initial
		neg_qk2d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) neg_qk2d_dffe <= 24'b0;
		else if  (clken == 1'b1)   neg_qk2d_dffe <= wire_altfp_div_csa43_result[24:1];
	// synopsys translate_off
	initial
		pos_qk1d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pos_qk1d_dffe <= 25'b0;
		else if  (clken == 1'b1)   pos_qk1d_dffe <= wire_altfp_div_csa40_result[24:0];
	// synopsys translate_off
	initial
		pos_qk2d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pos_qk2d_dffe <= 24'b0;
		else if  (clken == 1'b1)   pos_qk2d_dffe <= wire_altfp_div_csa41_result[24:1];
	// synopsys translate_off
	initial
		Rk_adder_padded_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Rk_adder_padded_dffe <= 25'b0;
		else if  (clken == 1'b1)   Rk_adder_padded_dffe <= Rk_adder_padded_w[26:2];
	// synopsys translate_off
	initial
		Rk_next_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Rk_next_dffe <= 25'b0;
		else if  (clken == 1'b1)   Rk_next_dffe <= qkd_mux_w;
	// synopsys translate_off
	initial
		rom_out_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_out_dffe <= 3'b0;
		else if  (clken == 1'b1)   rom_out_dffe <= rom_out_1a_w;
	lpm_mux   mux44
	( 
	.data(qkd_mux_input_w),
	.result(wire_mux44_result),
	.sel(rom_mux_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mux44.lpm_size = 8,
		mux44.lpm_width = 25,
		mux44.lpm_widths = 3,
		mux44.lpm_type = "lpm_mux";
	fpoint_hw_qsys_div_single_qds_block_ls9   qds_block39
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.decoder_bus(rom_add_w),
	.decoder_output(wire_qds_block39_decoder_output));
	assign
		divider_1D_w = {padded_3_zeros_w, divider_in_w},
		divider_2D_w = {padded_2_zeros_w, divider_in_w, 1'b0},
		divider_dffe_1a_w = divider_dffe_1a,
		divider_dffe_w = {1'b1, divider_dffe},
		divider_in_w = divider,
		divider_reg = divider_dffe_w,
		neg_qk1d_int_w = neg_qk1d_dffe,
		neg_qk2d_int_w = {neg_qk2d_dffe, 1'b0},
		padded_2_zeros_w = {2{1'b0}},
		padded_3_zeros_w = {3{1'b0}},
		pos_qk0d_int_w = {Rk_adder_padded_dffe[22:0], padded_2_zeros_w},
		pos_qk1d_int_w = pos_qk1d_dffe,
		pos_qk2d_int_w = {pos_qk2d_dffe, 1'b0},
		qkd_mux_input_w = {{2{pos_qk2d_int_w}}, pos_qk1d_int_w, pos_qk0d_int_w, {2{neg_qk2d_int_w}}, neg_qk1d_int_w, pos_qk0d_int_w},
		qkd_mux_w = wire_mux44_result[24:0],
		Rk_adder_padded_w = {Rk_dffe_1a_w, padded_2_zeros_w},
		Rk_dffe_1a_w = Rk_in_w,
		Rk_in_w = Rk,
		Rk_next = Rk_next_dffe_w,
		Rk_next_dffe_w = Rk_next_dffe,
		rom = rom_out_dffe_w,
		rom_add_w = {Rk_in_w[24:17], divider_in_w[22:19]},
		rom_mux_w = rom_out_1a_w,
		rom_out_1a_w = wire_qds_block39_decoder_output,
		rom_out_dffe_w = rom_out_dffe;
endmodule //fpoint_hw_qsys_div_single_srt_block_int_84n


//srt_block_int CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="STRATIXIV" OPTIMIZE="SPEED" POSITION="LAST" WIDTH_DIV=24 WIDTH_RK_IN=25 WIDTH_RK_OUT=27 WIDTH_ROM=3 WIDTH_ROM_ADD=12 aclr clken clock divider divider_reg Rk Rk_next rom
//VERSION_BEGIN 10.1 cbx_altbarrel_shift 2010:09:06:21:07:24:PN cbx_altfp_div 2010:09:06:21:07:24:PN cbx_altsyncram 2010:09:06:21:07:25:PN cbx_cycloneii 2010:09:06:21:07:25:PN cbx_lpm_abs 2010:09:06:21:07:25:PN cbx_lpm_add_sub 2010:09:06:21:07:25:PN cbx_lpm_compare 2010:09:06:21:07:25:PN cbx_lpm_decode 2010:09:06:21:07:25:PN cbx_lpm_divide 2010:09:06:21:07:25:PN cbx_lpm_mult 2010:09:06:21:07:25:PN cbx_lpm_mux 2010:09:06:21:07:25:PN cbx_mgl 2010:09:06:21:22:18:PN cbx_padd 2010:09:06:21:07:25:PN cbx_stratix 2010:09:06:21:07:25:PN cbx_stratixii 2010:09:06:21:07:25:PN cbx_stratixiii 2010:09:06:21:07:25:PN cbx_stratixv 2010:09:06:21:07:25:PN cbx_util_mgl 2010:09:06:21:07:25:PN  VERSION_END

//synthesis_resources = lpm_add_sub 12 lpm_compare 4 lpm_mux 2 reg 159 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_srt_block_int_fum
	( 
	aclr,
	clken,
	clock,
	divider,
	divider_reg,
	Rk,
	Rk_next,
	rom) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [23:0]  divider;
	output   [23:0]  divider_reg;
	input   [24:0]  Rk;
	output   [26:0]  Rk_next;
	output   [2:0]  rom;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [26:0]   wire_altfp_div_csa51_result;
	wire  [26:0]   wire_altfp_div_csa52_result;
	wire  [26:0]   wire_altfp_div_csa53_result;
	wire  [26:0]   wire_altfp_div_csa54_result;
	reg	[22:0]	divider_dffe_1a;
	reg	[26:0]	neg_qk1d_dffe;
	reg	[26:0]	neg_qk2d_dffe;
	reg	[26:0]	pos_qk1d_dffe;
	reg	[26:0]	pos_qk2d_dffe;
	reg	[24:0]	Rk_adder_padded_dffe;
	wire  [26:0]   wire_mux55_result;
	wire  [2:0]   wire_qds_block50_decoder_output;
	wire  [26:0]  divider_1D_w;
	wire  [26:0]  divider_2D_w;
	wire  [22:0]  divider_dffe_1a_w;
	wire  [23:0]  divider_dffe_w;
	wire  [23:0]  divider_in_w;
	wire  [26:0]  neg_qk1d_int_w;
	wire  [26:0]  neg_qk2d_int_w;
	wire  [1:0]  padded_2_zeros_w;
	wire  [2:0]  padded_3_zeros_w;
	wire  [26:0]  pos_qk0d_int_w;
	wire  [26:0]  pos_qk1d_int_w;
	wire  [26:0]  pos_qk2d_int_w;
	wire  [215:0]  qkd_mux_input_w;
	wire  [26:0]  qkd_mux_w;
	wire  [26:0]  Rk_adder_padded_w;
	wire  [24:0]  Rk_dffe_1a_w;
	wire  [24:0]  Rk_in_w;
	wire  [26:0]  Rk_next_dffe_w;
	wire  [11:0]  rom_add_w;
	wire  [2:0]  rom_mux_w;
	wire  [2:0]  rom_out_1a_w;
	wire  [2:0]  rom_out_dffe_w;

	fpoint_hw_qsys_div_single_altfp_div_csa_pke   altfp_div_csa51
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_1D_w),
	.result(wire_altfp_div_csa51_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_pke   altfp_div_csa52
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_2D_w),
	.result(wire_altfp_div_csa52_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_qle   altfp_div_csa53
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_1D_w),
	.result(wire_altfp_div_csa53_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_qle   altfp_div_csa54
	( 
	.dataa(Rk_adder_padded_w),
	.datab(divider_2D_w),
	.result(wire_altfp_div_csa54_result));
	// synopsys translate_off
	initial
		divider_dffe_1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divider_dffe_1a <= 23'b0;
		else if  (clken == 1'b1)   divider_dffe_1a <= divider_in_w[22:0];
	// synopsys translate_off
	initial
		neg_qk1d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) neg_qk1d_dffe <= 27'b0;
		else if  (clken == 1'b1)   neg_qk1d_dffe <= wire_altfp_div_csa53_result[26:0];
	// synopsys translate_off
	initial
		neg_qk2d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) neg_qk2d_dffe <= 27'b0;
		else if  (clken == 1'b1)   neg_qk2d_dffe <= wire_altfp_div_csa54_result[26:0];
	// synopsys translate_off
	initial
		pos_qk1d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pos_qk1d_dffe <= 27'b0;
		else if  (clken == 1'b1)   pos_qk1d_dffe <= wire_altfp_div_csa51_result[26:0];
	// synopsys translate_off
	initial
		pos_qk2d_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pos_qk2d_dffe <= 27'b0;
		else if  (clken == 1'b1)   pos_qk2d_dffe <= wire_altfp_div_csa52_result[26:0];
	// synopsys translate_off
	initial
		Rk_adder_padded_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Rk_adder_padded_dffe <= 25'b0;
		else if  (clken == 1'b1)   Rk_adder_padded_dffe <= Rk_adder_padded_w[26:2];
	lpm_mux   mux55
	( 
	.data(qkd_mux_input_w),
	.result(wire_mux55_result),
	.sel(rom_mux_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		mux55.lpm_size = 8,
		mux55.lpm_width = 27,
		mux55.lpm_widths = 3,
		mux55.lpm_type = "lpm_mux";
	fpoint_hw_qsys_div_single_qds_block_ls9   qds_block50
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.decoder_bus(rom_add_w),
	.decoder_output(wire_qds_block50_decoder_output));
	assign
		divider_1D_w = {padded_3_zeros_w, divider_in_w},
		divider_2D_w = {padded_2_zeros_w, divider_in_w, 1'b0},
		divider_dffe_1a_w = divider_dffe_1a,
		divider_dffe_w = {1'b1, divider_dffe_1a_w},
		divider_in_w = divider,
		divider_reg = divider_dffe_w,
		neg_qk1d_int_w = neg_qk1d_dffe,
		neg_qk2d_int_w = neg_qk2d_dffe,
		padded_2_zeros_w = {2{1'b0}},
		padded_3_zeros_w = {3{1'b0}},
		pos_qk0d_int_w = {Rk_adder_padded_dffe[24:0], padded_2_zeros_w},
		pos_qk1d_int_w = pos_qk1d_dffe,
		pos_qk2d_int_w = pos_qk2d_dffe,
		qkd_mux_input_w = {{2{pos_qk2d_int_w}}, pos_qk1d_int_w, pos_qk0d_int_w, {2{neg_qk2d_int_w}}, neg_qk1d_int_w, pos_qk0d_int_w},
		qkd_mux_w = wire_mux55_result[26:0],
		Rk_adder_padded_w = {Rk_dffe_1a_w, padded_2_zeros_w},
		Rk_dffe_1a_w = Rk_in_w,
		Rk_in_w = Rk,
		Rk_next = Rk_next_dffe_w,
		Rk_next_dffe_w = qkd_mux_w,
		rom = rom_out_dffe_w,
		rom_add_w = {Rk_in_w[24:17], divider_in_w[22:19]},
		rom_mux_w = rom_out_1a_w,
		rom_out_1a_w = wire_qds_block50_decoder_output,
		rom_out_dffe_w = rom_out_1a_w;
endmodule //fpoint_hw_qsys_div_single_srt_block_int_fum

//synthesis_resources = lpm_add_sub 177 lpm_compare 56 lpm_mux 28 reg 3289 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single_altfp_div_srt_ext_5mh
	( 
	aclr,
	clken,
	clock,
	denom,
	divider,
	numer,
	quotient,
	remain) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clken;
	input   clock;
	input   [23:0]  denom;
	output   [23:0]  divider;
	input   [23:0]  numer;
	output   [27:0]  quotient;
	output   [23:0]  remain;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [23:0]   wire_altfp_div_csa25_result;
	wire  [27:0]   wire_altfp_div_csa26_result;
	wire  [27:0]   wire_altfp_div_csa27_result;
	reg	[23:0]	divider_next_special_dffe;
	reg	[26:0]	Rk_remainder_special_dffe;
	reg	[49:0]	rom_reg_dffe0c;
	reg	[14:0]	rom_reg_dffe10c;
	reg	[8:0]	rom_reg_dffe11c;
	reg	[2:0]	rom_reg_dffe12c;
	reg	[68:0]	rom_reg_dffe1c;
	reg	[62:0]	rom_reg_dffe2c;
	reg	[56:0]	rom_reg_dffe3c;
	reg	[50:0]	rom_reg_dffe4c;
	reg	[44:0]	rom_reg_dffe5c;
	reg	[38:0]	rom_reg_dffe6c;
	reg	[32:0]	rom_reg_dffe7c;
	reg	[26:0]	rom_reg_dffe8c;
	reg	[20:0]	rom_reg_dffe9c;
	wire  [23:0]   wire_srt_block_int11_divider_reg;
	wire  [24:0]   wire_srt_block_int11_Rk_next;
	wire  [2:0]   wire_srt_block_int11_rom;
	wire  [23:0]   wire_srt_block_int12_divider_reg;
	wire  [24:0]   wire_srt_block_int12_Rk_next;
	wire  [2:0]   wire_srt_block_int12_rom;
	wire  [23:0]   wire_srt_block_int13_divider_reg;
	wire  [24:0]   wire_srt_block_int13_Rk_next;
	wire  [2:0]   wire_srt_block_int13_rom;
	wire  [23:0]   wire_srt_block_int14_divider_reg;
	wire  [24:0]   wire_srt_block_int14_Rk_next;
	wire  [2:0]   wire_srt_block_int14_rom;
	wire  [23:0]   wire_srt_block_int15_divider_reg;
	wire  [24:0]   wire_srt_block_int15_Rk_next;
	wire  [2:0]   wire_srt_block_int15_rom;
	wire  [23:0]   wire_srt_block_int16_divider_reg;
	wire  [24:0]   wire_srt_block_int16_Rk_next;
	wire  [2:0]   wire_srt_block_int16_rom;
	wire  [23:0]   wire_srt_block_int17_divider_reg;
	wire  [24:0]   wire_srt_block_int17_Rk_next;
	wire  [2:0]   wire_srt_block_int17_rom;
	wire  [23:0]   wire_srt_block_int18_divider_reg;
	wire  [24:0]   wire_srt_block_int18_Rk_next;
	wire  [2:0]   wire_srt_block_int18_rom;
	wire  [23:0]   wire_srt_block_int19_divider_reg;
	wire  [24:0]   wire_srt_block_int19_Rk_next;
	wire  [2:0]   wire_srt_block_int19_rom;
	wire  [23:0]   wire_srt_block_int20_divider_reg;
	wire  [24:0]   wire_srt_block_int20_Rk_next;
	wire  [2:0]   wire_srt_block_int20_rom;
	wire  [23:0]   wire_srt_block_int21_divider_reg;
	wire  [24:0]   wire_srt_block_int21_Rk_next;
	wire  [2:0]   wire_srt_block_int21_rom;
	wire  [23:0]   wire_srt_block_int22_divider_reg;
	wire  [24:0]   wire_srt_block_int22_Rk_next;
	wire  [2:0]   wire_srt_block_int22_rom;
	wire  [23:0]   wire_srt_block_int23_divider_reg;
	wire  [24:0]   wire_srt_block_int23_Rk_next;
	wire  [2:0]   wire_srt_block_int23_rom;
	wire  [23:0]   wire_srt_block_int24_divider_reg;
	wire  [26:0]   wire_srt_block_int24_Rk_next;
	wire  [2:0]   wire_srt_block_int24_rom;
	wire  [23:0]  added_remainder_w;
	wire  [23:0]  divider_dffe_w;
	wire  [23:0]  divider_next_special_w;
	wire  [23:0]  divider_next_w0c;
	wire  [23:0]  divider_next_w10c;
	wire  [23:0]  divider_next_w11c;
	wire  [23:0]  divider_next_w12c;
	wire  [23:0]  divider_next_w13c;
	wire  [23:0]  divider_next_w1c;
	wire  [23:0]  divider_next_w2c;
	wire  [23:0]  divider_next_w3c;
	wire  [23:0]  divider_next_w4c;
	wire  [23:0]  divider_next_w5c;
	wire  [23:0]  divider_next_w6c;
	wire  [23:0]  divider_next_w7c;
	wire  [23:0]  divider_next_w8c;
	wire  [23:0]  divider_next_w9c;
	wire  [23:0]  divider_w;
	wire  [27:0]  full_neg_rom_w;
	wire  [27:0]  full_pos_rom_w;
	wire  mux_remainder_w;
	wire  [1:0]  neg_rom_w0c;
	wire  [1:0]  neg_rom_w10c;
	wire  [1:0]  neg_rom_w11c;
	wire  [1:0]  neg_rom_w12c;
	wire  [1:0]  neg_rom_w13c;
	wire  [1:0]  neg_rom_w1c;
	wire  [1:0]  neg_rom_w2c;
	wire  [1:0]  neg_rom_w3c;
	wire  [1:0]  neg_rom_w4c;
	wire  [1:0]  neg_rom_w5c;
	wire  [1:0]  neg_rom_w6c;
	wire  [1:0]  neg_rom_w7c;
	wire  [1:0]  neg_rom_w8c;
	wire  [1:0]  neg_rom_w9c;
	wire  [1:0]  pos_rom_w0c;
	wire  [1:0]  pos_rom_w10c;
	wire  [1:0]  pos_rom_w11c;
	wire  [1:0]  pos_rom_w12c;
	wire  [1:0]  pos_rom_w13c;
	wire  [1:0]  pos_rom_w1c;
	wire  [1:0]  pos_rom_w2c;
	wire  [1:0]  pos_rom_w3c;
	wire  [1:0]  pos_rom_w4c;
	wire  [1:0]  pos_rom_w5c;
	wire  [1:0]  pos_rom_w6c;
	wire  [1:0]  pos_rom_w7c;
	wire  [1:0]  pos_rom_w8c;
	wire  [1:0]  pos_rom_w9c;
	wire  [24:0]  Rk_next0_w;
	wire  [24:0]  Rk_next_w0c;
	wire  [24:0]  Rk_next_w10c;
	wire  [24:0]  Rk_next_w11c;
	wire  [24:0]  Rk_next_w12c;
	wire  [26:0]  Rk_next_w13c;
	wire  [24:0]  Rk_next_w1c;
	wire  [24:0]  Rk_next_w2c;
	wire  [24:0]  Rk_next_w3c;
	wire  [24:0]  Rk_next_w4c;
	wire  [24:0]  Rk_next_w5c;
	wire  [24:0]  Rk_next_w6c;
	wire  [24:0]  Rk_next_w7c;
	wire  [24:0]  Rk_next_w8c;
	wire  [24:0]  Rk_next_w9c;
	wire  [26:0]  Rk_remainder_special_w;
	wire  [23:0]  Rk_remainder_w;
	wire  [23:0]  Rk_w;
	wire  [2:0]  rom_dffe_w0c;
	wire  [2:0]  rom_dffe_w10c;
	wire  [2:0]  rom_dffe_w11c;
	wire  [2:0]  rom_dffe_w12c;
	wire  [2:0]  rom_dffe_w13c;
	wire  [2:0]  rom_dffe_w1c;
	wire  [2:0]  rom_dffe_w2c;
	wire  [2:0]  rom_dffe_w3c;
	wire  [2:0]  rom_dffe_w4c;
	wire  [2:0]  rom_dffe_w5c;
	wire  [2:0]  rom_dffe_w6c;
	wire  [2:0]  rom_dffe_w7c;
	wire  [2:0]  rom_dffe_w8c;
	wire  [2:0]  rom_dffe_w9c;
	wire  [13:0]  rom_mux_w;
	wire  [2:0]  rom_out_1a_w;
	wire  [2:0]  rom_out_w0c;
	wire  [2:0]  rom_out_w10c;
	wire  [2:0]  rom_out_w11c;
	wire  [2:0]  rom_out_w12c;
	wire  [2:0]  rom_out_w13c;
	wire  [2:0]  rom_out_w1c;
	wire  [2:0]  rom_out_w2c;
	wire  [2:0]  rom_out_w3c;
	wire  [2:0]  rom_out_w4c;
	wire  [2:0]  rom_out_w5c;
	wire  [2:0]  rom_out_w6c;
	wire  [2:0]  rom_out_w7c;
	wire  [2:0]  rom_out_w8c;
	wire  [2:0]  rom_out_w9c;
	wire  [27:0]  srt_adjust_w;
	wire  [27:0]  srt_adjusted_w;
	wire  [27:0]  true_quotient_w;
	wire  [27:0]  value_one_w;
	wire  [1:0]  zero_quotient_w;

	fpoint_hw_qsys_div_single_altfp_div_csa_mke   altfp_div_csa25
	( 
	.dataa(Rk_remainder_special_w[23:0]),
	.datab(divider_next_special_w),
	.result(wire_altfp_div_csa25_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_2jh   altfp_div_csa26
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.dataa(full_pos_rom_w),
	.datab(full_neg_rom_w),
	.result(wire_altfp_div_csa26_result));
	fpoint_hw_qsys_div_single_altfp_div_csa_rle   altfp_div_csa27
	( 
	.dataa(srt_adjust_w),
	.datab(value_one_w),
	.result(wire_altfp_div_csa27_result));
	// synopsys translate_off
	initial
		divider_next_special_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divider_next_special_dffe <= 24'b0;
		else if  (clken == 1'b1)   divider_next_special_dffe <= divider_next_w13c;
	// synopsys translate_off
	initial
		Rk_remainder_special_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) Rk_remainder_special_dffe <= 27'b0;
		else if  (clken == 1'b1)   Rk_remainder_special_dffe <= Rk_next_w13c;
	// synopsys translate_off
	initial
		rom_reg_dffe0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe0c <= 50'b0;
		else if  (clken == 1'b1)   rom_reg_dffe0c <= {rom_reg_dffe0c[47:0], rom_out_w0c[1:0]};
	// synopsys translate_off
	initial
		rom_reg_dffe10c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe10c <= 15'b0;
		else if  (clken == 1'b1)   rom_reg_dffe10c <= {rom_reg_dffe10c[11:0], rom_out_w10c};
	// synopsys translate_off
	initial
		rom_reg_dffe11c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe11c <= 9'b0;
		else if  (clken == 1'b1)   rom_reg_dffe11c <= {rom_reg_dffe11c[5:0], rom_out_w11c};
	// synopsys translate_off
	initial
		rom_reg_dffe12c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe12c <= 3'b0;
		else if  (clken == 1'b1)   rom_reg_dffe12c <= {rom_out_w12c};
	// synopsys translate_off
	initial
		rom_reg_dffe1c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe1c <= 69'b0;
		else if  (clken == 1'b1)   rom_reg_dffe1c <= {rom_reg_dffe1c[65:0], rom_out_w1c};
	// synopsys translate_off
	initial
		rom_reg_dffe2c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe2c <= 63'b0;
		else if  (clken == 1'b1)   rom_reg_dffe2c <= {rom_reg_dffe2c[59:0], rom_out_w2c};
	// synopsys translate_off
	initial
		rom_reg_dffe3c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe3c <= 57'b0;
		else if  (clken == 1'b1)   rom_reg_dffe3c <= {rom_reg_dffe3c[53:0], rom_out_w3c};
	// synopsys translate_off
	initial
		rom_reg_dffe4c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe4c <= 51'b0;
		else if  (clken == 1'b1)   rom_reg_dffe4c <= {rom_reg_dffe4c[47:0], rom_out_w4c};
	// synopsys translate_off
	initial
		rom_reg_dffe5c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe5c <= 45'b0;
		else if  (clken == 1'b1)   rom_reg_dffe5c <= {rom_reg_dffe5c[41:0], rom_out_w5c};
	// synopsys translate_off
	initial
		rom_reg_dffe6c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe6c <= 39'b0;
		else if  (clken == 1'b1)   rom_reg_dffe6c <= {rom_reg_dffe6c[35:0], rom_out_w6c};
	// synopsys translate_off
	initial
		rom_reg_dffe7c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe7c <= 33'b0;
		else if  (clken == 1'b1)   rom_reg_dffe7c <= {rom_reg_dffe7c[29:0], rom_out_w7c};
	// synopsys translate_off
	initial
		rom_reg_dffe8c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe8c <= 27'b0;
		else if  (clken == 1'b1)   rom_reg_dffe8c <= {rom_reg_dffe8c[23:0], rom_out_w8c};
	// synopsys translate_off
	initial
		rom_reg_dffe9c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rom_reg_dffe9c <= 21'b0;
		else if  (clken == 1'b1)   rom_reg_dffe9c <= {rom_reg_dffe9c[17:0], rom_out_w9c};
	fpoint_hw_qsys_div_single_srt_block_int_02n   srt_block_int11
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_w),
	.divider_reg(wire_srt_block_int11_divider_reg),
	.Rk(Rk_w),
	.Rk_next(wire_srt_block_int11_Rk_next),
	.rom(wire_srt_block_int11_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int12
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w0c),
	.divider_reg(wire_srt_block_int12_divider_reg),
	.Rk(Rk_next_w0c),
	.Rk_next(wire_srt_block_int12_Rk_next),
	.rom(wire_srt_block_int12_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int13
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w1c),
	.divider_reg(wire_srt_block_int13_divider_reg),
	.Rk(Rk_next_w1c),
	.Rk_next(wire_srt_block_int13_Rk_next),
	.rom(wire_srt_block_int13_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int14
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w2c),
	.divider_reg(wire_srt_block_int14_divider_reg),
	.Rk(Rk_next_w2c),
	.Rk_next(wire_srt_block_int14_Rk_next),
	.rom(wire_srt_block_int14_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int15
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w3c),
	.divider_reg(wire_srt_block_int15_divider_reg),
	.Rk(Rk_next_w3c),
	.Rk_next(wire_srt_block_int15_Rk_next),
	.rom(wire_srt_block_int15_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int16
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w4c),
	.divider_reg(wire_srt_block_int16_divider_reg),
	.Rk(Rk_next_w4c),
	.Rk_next(wire_srt_block_int16_Rk_next),
	.rom(wire_srt_block_int16_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int17
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w5c),
	.divider_reg(wire_srt_block_int17_divider_reg),
	.Rk(Rk_next_w5c),
	.Rk_next(wire_srt_block_int17_Rk_next),
	.rom(wire_srt_block_int17_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int18
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w6c),
	.divider_reg(wire_srt_block_int18_divider_reg),
	.Rk(Rk_next_w6c),
	.Rk_next(wire_srt_block_int18_Rk_next),
	.rom(wire_srt_block_int18_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int19
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w7c),
	.divider_reg(wire_srt_block_int19_divider_reg),
	.Rk(Rk_next_w7c),
	.Rk_next(wire_srt_block_int19_Rk_next),
	.rom(wire_srt_block_int19_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int20
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w8c),
	.divider_reg(wire_srt_block_int20_divider_reg),
	.Rk(Rk_next_w8c),
	.Rk_next(wire_srt_block_int20_Rk_next),
	.rom(wire_srt_block_int20_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int21
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w9c),
	.divider_reg(wire_srt_block_int21_divider_reg),
	.Rk(Rk_next_w9c),
	.Rk_next(wire_srt_block_int21_Rk_next),
	.rom(wire_srt_block_int21_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int22
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w10c),
	.divider_reg(wire_srt_block_int22_divider_reg),
	.Rk(Rk_next_w10c),
	.Rk_next(wire_srt_block_int22_Rk_next),
	.rom(wire_srt_block_int22_rom));
	fpoint_hw_qsys_div_single_srt_block_int_84n   srt_block_int23
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w11c),
	.divider_reg(wire_srt_block_int23_divider_reg),
	.Rk(Rk_next_w11c),
	.Rk_next(wire_srt_block_int23_Rk_next),
	.rom(wire_srt_block_int23_rom));
	fpoint_hw_qsys_div_single_srt_block_int_fum   srt_block_int24
	( 
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.divider(divider_next_w12c),
	.divider_reg(wire_srt_block_int24_divider_reg),
	.Rk(Rk_next_w12c),
	.Rk_next(wire_srt_block_int24_Rk_next),
	.rom(wire_srt_block_int24_rom));
	assign
		added_remainder_w = wire_altfp_div_csa25_result,
		divider = divider_next_special_w,
		divider_dffe_w = wire_srt_block_int11_divider_reg,
		divider_next_special_w = divider_next_special_dffe,
		divider_next_w0c = divider_dffe_w,
		divider_next_w10c = wire_srt_block_int21_divider_reg,
		divider_next_w11c = wire_srt_block_int22_divider_reg,
		divider_next_w12c = wire_srt_block_int23_divider_reg,
		divider_next_w13c = wire_srt_block_int24_divider_reg,
		divider_next_w1c = wire_srt_block_int12_divider_reg,
		divider_next_w2c = wire_srt_block_int13_divider_reg,
		divider_next_w3c = wire_srt_block_int14_divider_reg,
		divider_next_w4c = wire_srt_block_int15_divider_reg,
		divider_next_w5c = wire_srt_block_int16_divider_reg,
		divider_next_w6c = wire_srt_block_int17_divider_reg,
		divider_next_w7c = wire_srt_block_int18_divider_reg,
		divider_next_w8c = wire_srt_block_int19_divider_reg,
		divider_next_w9c = wire_srt_block_int20_divider_reg,
		divider_w = denom,
		full_neg_rom_w = {neg_rom_w0c, neg_rom_w1c, neg_rom_w2c, neg_rom_w3c, neg_rom_w4c, neg_rom_w5c, neg_rom_w6c, neg_rom_w7c, neg_rom_w8c, neg_rom_w9c, neg_rom_w10c, neg_rom_w11c, neg_rom_w12c, neg_rom_w13c},
		full_pos_rom_w = {pos_rom_w0c, pos_rom_w1c, pos_rom_w2c, pos_rom_w3c, pos_rom_w4c, pos_rom_w5c, pos_rom_w6c, pos_rom_w7c, pos_rom_w8c, pos_rom_w9c, pos_rom_w10c, pos_rom_w11c, pos_rom_w12c, pos_rom_w13c},
		mux_remainder_w = ((Rk_remainder_special_w[26] | Rk_remainder_special_w[25]) | Rk_remainder_special_w[24]),
		neg_rom_w0c = (({2{(~ rom_mux_w[0])}} & zero_quotient_w) | ({2{rom_mux_w[0]}} & rom_dffe_w0c[1:0])),
		neg_rom_w10c = (({2{(~ rom_mux_w[10])}} & zero_quotient_w) | ({2{rom_mux_w[10]}} & rom_dffe_w10c[1:0])),
		neg_rom_w11c = (({2{(~ rom_mux_w[11])}} & zero_quotient_w) | ({2{rom_mux_w[11]}} & rom_dffe_w11c[1:0])),
		neg_rom_w12c = (({2{(~ rom_mux_w[12])}} & zero_quotient_w) | ({2{rom_mux_w[12]}} & rom_dffe_w12c[1:0])),
		neg_rom_w13c = (({2{(~ rom_mux_w[13])}} & zero_quotient_w) | ({2{rom_mux_w[13]}} & rom_dffe_w13c[1:0])),
		neg_rom_w1c = (({2{(~ rom_mux_w[1])}} & zero_quotient_w) | ({2{rom_mux_w[1]}} & rom_dffe_w1c[1:0])),
		neg_rom_w2c = (({2{(~ rom_mux_w[2])}} & zero_quotient_w) | ({2{rom_mux_w[2]}} & rom_dffe_w2c[1:0])),
		neg_rom_w3c = (({2{(~ rom_mux_w[3])}} & zero_quotient_w) | ({2{rom_mux_w[3]}} & rom_dffe_w3c[1:0])),
		neg_rom_w4c = (({2{(~ rom_mux_w[4])}} & zero_quotient_w) | ({2{rom_mux_w[4]}} & rom_dffe_w4c[1:0])),
		neg_rom_w5c = (({2{(~ rom_mux_w[5])}} & zero_quotient_w) | ({2{rom_mux_w[5]}} & rom_dffe_w5c[1:0])),
		neg_rom_w6c = (({2{(~ rom_mux_w[6])}} & zero_quotient_w) | ({2{rom_mux_w[6]}} & rom_dffe_w6c[1:0])),
		neg_rom_w7c = (({2{(~ rom_mux_w[7])}} & zero_quotient_w) | ({2{rom_mux_w[7]}} & rom_dffe_w7c[1:0])),
		neg_rom_w8c = (({2{(~ rom_mux_w[8])}} & zero_quotient_w) | ({2{rom_mux_w[8]}} & rom_dffe_w8c[1:0])),
		neg_rom_w9c = (({2{(~ rom_mux_w[9])}} & zero_quotient_w) | ({2{rom_mux_w[9]}} & rom_dffe_w9c[1:0])),
		pos_rom_w0c = (({2{rom_mux_w[0]}} & zero_quotient_w) | ({2{(~ rom_mux_w[0])}} & rom_dffe_w0c[1:0])),
		pos_rom_w10c = (({2{rom_mux_w[10]}} & zero_quotient_w) | ({2{(~ rom_mux_w[10])}} & rom_dffe_w10c[1:0])),
		pos_rom_w11c = (({2{rom_mux_w[11]}} & zero_quotient_w) | ({2{(~ rom_mux_w[11])}} & rom_dffe_w11c[1:0])),
		pos_rom_w12c = (({2{rom_mux_w[12]}} & zero_quotient_w) | ({2{(~ rom_mux_w[12])}} & rom_dffe_w12c[1:0])),
		pos_rom_w13c = (({2{rom_mux_w[13]}} & zero_quotient_w) | ({2{(~ rom_mux_w[13])}} & rom_dffe_w13c[1:0])),
		pos_rom_w1c = (({2{rom_mux_w[1]}} & zero_quotient_w) | ({2{(~ rom_mux_w[1])}} & rom_dffe_w1c[1:0])),
		pos_rom_w2c = (({2{rom_mux_w[2]}} & zero_quotient_w) | ({2{(~ rom_mux_w[2])}} & rom_dffe_w2c[1:0])),
		pos_rom_w3c = (({2{rom_mux_w[3]}} & zero_quotient_w) | ({2{(~ rom_mux_w[3])}} & rom_dffe_w3c[1:0])),
		pos_rom_w4c = (({2{rom_mux_w[4]}} & zero_quotient_w) | ({2{(~ rom_mux_w[4])}} & rom_dffe_w4c[1:0])),
		pos_rom_w5c = (({2{rom_mux_w[5]}} & zero_quotient_w) | ({2{(~ rom_mux_w[5])}} & rom_dffe_w5c[1:0])),
		pos_rom_w6c = (({2{rom_mux_w[6]}} & zero_quotient_w) | ({2{(~ rom_mux_w[6])}} & rom_dffe_w6c[1:0])),
		pos_rom_w7c = (({2{rom_mux_w[7]}} & zero_quotient_w) | ({2{(~ rom_mux_w[7])}} & rom_dffe_w7c[1:0])),
		pos_rom_w8c = (({2{rom_mux_w[8]}} & zero_quotient_w) | ({2{(~ rom_mux_w[8])}} & rom_dffe_w8c[1:0])),
		pos_rom_w9c = (({2{rom_mux_w[9]}} & zero_quotient_w) | ({2{(~ rom_mux_w[9])}} & rom_dffe_w9c[1:0])),
		quotient = true_quotient_w,
		remain = Rk_remainder_w,
		Rk_next0_w = wire_srt_block_int11_Rk_next,
		Rk_next_w0c = Rk_next0_w,
		Rk_next_w10c = wire_srt_block_int21_Rk_next,
		Rk_next_w11c = wire_srt_block_int22_Rk_next,
		Rk_next_w12c = wire_srt_block_int23_Rk_next,
		Rk_next_w13c = wire_srt_block_int24_Rk_next,
		Rk_next_w1c = wire_srt_block_int12_Rk_next,
		Rk_next_w2c = wire_srt_block_int13_Rk_next,
		Rk_next_w3c = wire_srt_block_int14_Rk_next,
		Rk_next_w4c = wire_srt_block_int15_Rk_next,
		Rk_next_w5c = wire_srt_block_int16_Rk_next,
		Rk_next_w6c = wire_srt_block_int17_Rk_next,
		Rk_next_w7c = wire_srt_block_int18_Rk_next,
		Rk_next_w8c = wire_srt_block_int19_Rk_next,
		Rk_next_w9c = wire_srt_block_int20_Rk_next,
		Rk_remainder_special_w = Rk_remainder_special_dffe,
		Rk_remainder_w = (({24{(~ mux_remainder_w)}} & Rk_remainder_special_w[23:0]) | ({24{mux_remainder_w}} & added_remainder_w)),
		Rk_w = numer,
		rom_dffe_w0c = {1'b0, rom_reg_dffe0c[49:48]},
		rom_dffe_w10c = rom_reg_dffe10c[14:12],
		rom_dffe_w11c = rom_reg_dffe11c[8:6],
		rom_dffe_w12c = rom_reg_dffe12c[2:0],
		rom_dffe_w13c = rom_out_w13c,
		rom_dffe_w1c = rom_reg_dffe1c[68:66],
		rom_dffe_w2c = rom_reg_dffe2c[62:60],
		rom_dffe_w3c = rom_reg_dffe3c[56:54],
		rom_dffe_w4c = rom_reg_dffe4c[50:48],
		rom_dffe_w5c = rom_reg_dffe5c[44:42],
		rom_dffe_w6c = rom_reg_dffe6c[38:36],
		rom_dffe_w7c = rom_reg_dffe7c[32:30],
		rom_dffe_w8c = rom_reg_dffe8c[26:24],
		rom_dffe_w9c = rom_reg_dffe9c[20:18],
		rom_mux_w = {rom_dffe_w13c[2], rom_dffe_w12c[2], rom_dffe_w11c[2], rom_dffe_w10c[2], rom_dffe_w9c[2], rom_dffe_w8c[2], rom_dffe_w7c[2], rom_dffe_w6c[2], rom_dffe_w5c[2], rom_dffe_w4c[2], rom_dffe_w3c[2], rom_dffe_w2c[2], rom_dffe_w1c[2], rom_dffe_w0c[2]},
		rom_out_1a_w = wire_srt_block_int11_rom,
		rom_out_w0c = rom_out_1a_w,
		rom_out_w10c = wire_srt_block_int21_rom,
		rom_out_w11c = wire_srt_block_int22_rom,
		rom_out_w12c = wire_srt_block_int23_rom,
		rom_out_w13c = wire_srt_block_int24_rom,
		rom_out_w1c = wire_srt_block_int12_rom,
		rom_out_w2c = wire_srt_block_int13_rom,
		rom_out_w3c = wire_srt_block_int14_rom,
		rom_out_w4c = wire_srt_block_int15_rom,
		rom_out_w5c = wire_srt_block_int16_rom,
		rom_out_w6c = wire_srt_block_int17_rom,
		rom_out_w7c = wire_srt_block_int18_rom,
		rom_out_w8c = wire_srt_block_int19_rom,
		rom_out_w9c = wire_srt_block_int20_rom,
		srt_adjust_w = wire_altfp_div_csa26_result,
		srt_adjusted_w = wire_altfp_div_csa27_result,
		true_quotient_w = (({28{(~ mux_remainder_w)}} & srt_adjust_w) | ({28{mux_remainder_w}} & srt_adjusted_w)),
		value_one_w = 28'b0000000000000000000000000001,
		zero_quotient_w = {2{1'b0}};
endmodule //fpoint_hw_qsys_div_single_altfp_div_srt_ext_5mh

//synthesis_resources = lpm_add_sub 181 lpm_compare 62 lpm_mux 28 reg 4070 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fpoint_hw_qsys_div_single
	( 
	aclr,
	clk_en,
	clock,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [31:0]  dataa;
	input   [31:0]  datab;
	output   [31:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_altfp_div_csa8_cout;
	wire  [23:0]   wire_altfp_div_csa8_result;
	wire  [23:0]   wire_altfp_div_srt_ext1_divider;
	wire  [27:0]   wire_altfp_div_srt_ext1_quotient;
	wire  [23:0]   wire_altfp_div_srt_ext1_remain;
	reg	[7:0]	and_or_dffe;
	reg	[7:0]	and_or_dffe1a;
	reg	[7:0]	and_or_dffe3a;
	reg	[7:0]	and_or_pipeline0c;
	reg	[7:0]	and_or_pipeline10c;
	reg	[7:0]	and_or_pipeline11c;
	reg	[7:0]	and_or_pipeline12c;
	reg	[7:0]	and_or_pipeline13c;
	reg	[7:0]	and_or_pipeline14c;
	reg	[7:0]	and_or_pipeline15c;
	reg	[7:0]	and_or_pipeline16c;
	reg	[7:0]	and_or_pipeline17c;
	reg	[7:0]	and_or_pipeline18c;
	reg	[7:0]	and_or_pipeline19c;
	reg	[7:0]	and_or_pipeline1c;
	reg	[7:0]	and_or_pipeline20c;
	reg	[7:0]	and_or_pipeline21c;
	reg	[7:0]	and_or_pipeline22c;
	reg	[7:0]	and_or_pipeline23c;
	reg	[7:0]	and_or_pipeline24c;
	reg	[7:0]	and_or_pipeline25c;
	reg	[7:0]	and_or_pipeline26c;
	reg	[7:0]	and_or_pipeline27c;
	reg	[7:0]	and_or_pipeline2c;
	reg	[7:0]	and_or_pipeline3c;
	reg	[7:0]	and_or_pipeline4c;
	reg	[7:0]	and_or_pipeline5c;
	reg	[7:0]	and_or_pipeline6c;
	reg	[7:0]	and_or_pipeline7c;
	reg	[7:0]	and_or_pipeline8c;
	reg	[7:0]	and_or_pipeline9c;
	reg	bias_addition_overf_dffe;
	reg	[23:0]	divider_pipe1a;
	reg	exp_a_and_dffe;
	reg	exp_a_b_dffe;
	reg	[7:0]	exp_a_dffe;
	reg	exp_a_or_dffe;
	reg	exp_b_and_dffe;
	reg	[7:0]	exp_b_dffe;
	reg	exp_b_or_dffe;
	reg	[8:0]	exp_dffe1a;
	reg	[8:0]	exp_dffe2a;
	reg	[8:0]	exp_pipeline0c;
	reg	[8:0]	exp_pipeline10c;
	reg	[8:0]	exp_pipeline11c;
	reg	[8:0]	exp_pipeline12c;
	reg	[8:0]	exp_pipeline13c;
	reg	[8:0]	exp_pipeline14c;
	reg	[8:0]	exp_pipeline15c;
	reg	[8:0]	exp_pipeline16c;
	reg	[8:0]	exp_pipeline17c;
	reg	[8:0]	exp_pipeline18c;
	reg	[8:0]	exp_pipeline19c;
	reg	[8:0]	exp_pipeline1c;
	reg	[8:0]	exp_pipeline20c;
	reg	[8:0]	exp_pipeline21c;
	reg	[8:0]	exp_pipeline22c;
	reg	[8:0]	exp_pipeline23c;
	reg	[8:0]	exp_pipeline24c;
	reg	[8:0]	exp_pipeline25c;
	reg	[8:0]	exp_pipeline26c;
	reg	[8:0]	exp_pipeline2c;
	reg	[8:0]	exp_pipeline3c;
	reg	[8:0]	exp_pipeline4c;
	reg	[8:0]	exp_pipeline5c;
	reg	[8:0]	exp_pipeline6c;
	reg	[8:0]	exp_pipeline7c;
	reg	[8:0]	exp_pipeline8c;
	reg	[8:0]	exp_pipeline9c;
	reg	[7:0]	exp_res_pipe3;
	reg	implied_bit;
	reg	implied_bit2a;
	reg	man_a_and_dffe;
	reg	[22:0]	man_a_dffe;
	reg	man_a_or_dffe;
	reg	man_b_and_dffe;
	reg	[22:0]	man_b_dffe;
	reg	man_b_or_dffe;
	reg	[23:0]	man_res_pipe3;
	reg	[27:0]	quotient_pipe1a;
	reg	[23:0]	remainder_pipe1a;
	reg	[31:0]	result_output_dffe;
	reg	rnd_overflow_dffe;
	reg	[23:0]	rnded_man_pipe2a;
	reg	sign_a_dffe;
	reg	sign_b_dffe;
	reg	sign_div_pipeline0c;
	reg	sign_div_pipeline10c;
	reg	sign_div_pipeline11c;
	reg	sign_div_pipeline12c;
	reg	sign_div_pipeline13c;
	reg	sign_div_pipeline14c;
	reg	sign_div_pipeline15c;
	reg	sign_div_pipeline16c;
	reg	sign_div_pipeline17c;
	reg	sign_div_pipeline18c;
	reg	sign_div_pipeline19c;
	reg	sign_div_pipeline1c;
	reg	sign_div_pipeline20c;
	reg	sign_div_pipeline21c;
	reg	sign_div_pipeline22c;
	reg	sign_div_pipeline23c;
	reg	sign_div_pipeline24c;
	reg	sign_div_pipeline25c;
	reg	sign_div_pipeline26c;
	reg	sign_div_pipeline27c;
	reg	sign_div_pipeline2c;
	reg	sign_div_pipeline3c;
	reg	sign_div_pipeline4c;
	reg	sign_div_pipeline5c;
	reg	sign_div_pipeline6c;
	reg	sign_div_pipeline7c;
	reg	sign_div_pipeline8c;
	reg	sign_div_pipeline9c;
	reg	sign_pipe1a;
	reg	sign_pipe2a;
	reg	sign_pipe3a;
	wire  wire_add_sub10_overflow;
	wire  [8:0]   wire_add_sub10_result;
	wire  [8:0]   wire_add_sub9_result;
	wire  wire_cmpr2_aeb;
	wire  wire_cmpr2_agb;
	wire  wire_cmpr3_aeb;
	wire  wire_cmpr3_agb;
	wire  wire_cmpr4_aeb;
	wire  wire_cmpr4_agb;
	wire  wire_cmpr5_ageb;
	wire  wire_cmpr6_aeb;
	wire  wire_cmpr6_agb;
	wire  wire_cmpr7_ageb;
	wire  [23:0]  add_1_dataa_w;
	wire  [23:0]  add_1_datab_w;
	wire  add_1_w;
	wire  [23:0]  add_one_process_w;
	wire  [7:0]  and_or_dffe1a_w;
	wire  [7:0]  and_or_dffe3a_w;
	wire  [7:0]  and_or_dffe_w;
	wire  [7:0]  and_or_int_w;
	wire  [7:0]  and_or_pipeline_w;
	wire  [8:0]  bias_add_w;
	wire  bias_addition_overf_w;
	wire  [7:0]  bias_addition_w;
	wire  [8:0]  bias_value_w;
	wire  [23:0]  checked_quotient_dffe1a_w;
	wire  [23:0]  checked_quotient_w;
	wire  [7:0]  dataa_exp_bus_w;
	wire  [31:0]  dataa_int;
	wire  [22:0]  dataa_man_bus_w;
	wire  dataa_S0;
	wire  [7:0]  datab_exp_bus_w;
	wire  [31:0]  datab_int;
	wire  [22:0]  datab_man_bus_w;
	wire  datab_S0;
	wire  [23:0]  divider_srt_w;
	wire  exp_a_and_msb2_w;
	wire  exp_a_and_msb_w;
	wire  exp_a_and_mux_w;
	wire  [7:0]  exp_a_and_w;
	wire  exp_a_b_w;
	wire  [7:0]  exp_a_bus_w;
	wire  exp_a_non_zero_w;
	wire  exp_a_one_w;
	wire  exp_a_or_msb2_w;
	wire  exp_a_or_msb_w;
	wire  exp_a_or_mux_w;
	wire  [7:0]  exp_a_or_w;
	wire  [7:0]  exp_a_w;
	wire  exp_a_zero_w;
	wire  exp_b_and_msb2_w;
	wire  exp_b_and_msb_w;
	wire  exp_b_and_mux_w;
	wire  [7:0]  exp_b_and_w;
	wire  [7:0]  exp_b_bus_w;
	wire  exp_b_non_zero_w;
	wire  exp_b_one_w;
	wire  exp_b_or_msb2_w;
	wire  exp_b_or_msb_w;
	wire  exp_b_or_mux_w;
	wire  [7:0]  exp_b_or_w;
	wire  [7:0]  exp_b_w;
	wire  exp_b_zero_w;
	wire  exp_bias_and_res_w;
	wire  [7:0]  exp_bias_and_w;
	wire  [7:0]  exp_bias_bus_w;
	wire  [8:0]  exp_dffe1a_w;
	wire  [8:0]  exp_dffe2a_w;
	wire  [7:0]  exp_exc_ones_w;
	wire  [7:0]  exp_exc_zeros_w;
	wire  [1:0]  exp_higher_bit;
	wire  [1:0]  exp_higher_or;
	wire  exp_infi_bus_w;
	wire  [7:0]  exp_man_and_or_w;
	wire  exp_or_result_w;
	wire  [8:0]  exp_pipeline_w;
	wire  [7:0]  exp_res_and_w;
	wire  [7:0]  exp_res_bus_w;
	wire  [7:0]  exp_res_int2_bus_w;
	wire  [7:0]  exp_res_int2_or_w;
	wire  [7:0]  exp_res_int2_w;
	wire  [7:0]  exp_res_int_w;
	wire  [7:0]  exp_res_w;
	wire  exp_sign_w;
	wire  [8:0]  exp_sub_a_w;
	wire  [8:0]  exp_sub_b_w;
	wire  [8:0]  exp_sub_w;
	wire  exp_zero_bus_w;
	wire  guard_bit_dffe1a_w;
	wire  guard_bit_quo_msb_m1;
	wire  guard_bit_quo_msb_m2;
	wire  guard_bit_w;
	wire  infi_combi_w;
	wire  infi_dataa_w;
	wire  infi_datab_w;
	wire  [31:0]  infi_res_w;
	wire  infinite_int_w;
	wire  infinite_w;
	wire  [23:0]  man_24_zeros_w;
	wire  man_a_and_msb2_w;
	wire  man_a_and_msb_w;
	wire  man_a_and_mux_w;
	wire  [22:0]  man_a_and_w;
	wire  [22:0]  man_a_bus_w;
	wire  [22:0]  man_a_int_w;
	wire  man_a_non_zero_w;
	wire  man_a_one_w;
	wire  man_a_or_msb2_w;
	wire  man_a_or_msb_w;
	wire  man_a_or_mux_w;
	wire  [22:0]  man_a_or_w;
	wire  [23:0]  man_a_w;
	wire  man_a_zero_w;
	wire  man_b_and_msb2_w;
	wire  man_b_and_msb_w;
	wire  man_b_and_mux_w;
	wire  [22:0]  man_b_and_w;
	wire  [22:0]  man_b_bus_w;
	wire  [22:0]  man_b_int_w;
	wire  man_b_non_zero_w;
	wire  man_b_one_w;
	wire  man_b_or_msb2_w;
	wire  man_b_or_msb_w;
	wire  man_b_or_mux_w;
	wire  [22:0]  man_b_or_w;
	wire  [23:0]  man_b_w;
	wire  man_b_zero_w;
	wire  [22:0]  man_exc_nan_w;
	wire  [22:0]  man_exc_zeros_w;
	wire  [22:0]  man_res_bus_w;
	wire  [23:0]  man_res_int2_w;
	wire  [23:0]  man_res_int_w;
	wire  [22:0]  man_res_or_w;
	wire  [23:0]  man_res_w;
	wire  mux1_exp_s0a;
	wire  mux1_exp_s1a;
	wire  [31:0]  mux_1_res_w;
	wire  [31:0]  mux_2_res_w;
	wire  [31:0]  mux_3_res_w;
	wire  mux_zero_non_zero_S0;
	wire  [23:0]  mux_zero_non_zero_w;
	wire  nan_dataa_w;
	wire  nan_datab_w;
	wire  [31:0]  nan_res_w;
	wire  nan_w;
	wire  norm_dataa_w;
	wire  norm_datab_w;
	wire  [7:0]  norm_infi_and_w;
	wire  [7:0]  norm_infi_bus_w;
	wire  [31:0]  norm_res_int_w;
	wire  [7:0]  norm_zero_bus_w;
	wire  [7:0]  norm_zero_or_w;
	wire  [7:0]  not_bias_addition_w;
	wire  not_exp_res_int2_or_res_w;
	wire  overflow_int_w;
	wire  [23:0]  overflow_man_w;
	wire  [7:0]  overflow_ones_w;
	wire  [52:0]  quo_msb_m1_compare_dataa;
	wire  [52:0]  quo_msb_m1_compare_datab;
	wire  quo_msb_m1_compare_w;
	wire  quo_msb_m1_w;
	wire  [53:0]  quo_msb_m2_compare_dataa;
	wire  [53:0]  quo_msb_m2_compare_datab;
	wire  quo_msb_m2_compare_w;
	wire  [23:0]  quotient_msb_m1_w;
	wire  [23:0]  quotient_msb_m2_w;
	wire  [27:0]  quotient_w;
	wire  [23:0]  remainder_srt_w;
	wire  [23:0]  res_rnded_man_w;
	wire  rnd_add_overf_w;
	wire  rnd_overflow;
	wire  [23:0]  rnded_man_w;
	wire  round_bit_dffe1a_w;
	wire  round_bit_quo_msb_m1;
	wire  round_bit_quo_msb_m2;
	wire  round_bit_w;
	wire  sign_a_w;
	wire  sign_b_w;
	wire  sign_div;
	wire  sign_div_pipeline_w;
	wire  sign_exc_bit_w;
	wire  signed_N_exp_h_or;
	wire  sticky_bit_dffe1a_w;
	wire  sticky_bit_quo_msb_m1;
	wire  [1:0]  sticky_bit_quo_msb_m1_bit;
	wire  [1:0]  sticky_bit_quo_msb_m1_or;
	wire  [1:0]  sticky_bit_quo_msb_m1_tmp;
	wire  sticky_bit_quo_msb_m2;
	wire  [0:0]  sticky_bit_quo_msb_m2_bit;
	wire  [0:0]  sticky_bit_quo_msb_m2_or;
	wire  [0:0]  sticky_bit_quo_msb_m2_tmp;
	wire  sticky_bit_w;
	wire  sticky_quo_msb_m1_comparator_lower_lower_ageb_w;
	wire  sticky_quo_msb_m1_comparator_lower_upper_aeb_w;
	wire  sticky_quo_msb_m1_comparator_lower_upper_agb_w;
	wire  sticky_quo_msb_m1_comparator_upper_lower_aeb_w;
	wire  sticky_quo_msb_m1_comparator_upper_lower_agb_w;
	wire  sticky_quo_msb_m1_comparator_upper_upper_aeb_w;
	wire  sticky_quo_msb_m1_comparator_upper_upper_agb_w;
	wire  sticky_quo_msb_m2_comparator_lower_ageb_w;
	wire  sticky_quo_msb_m2_comparator_upper_aeb_w;
	wire  sticky_quo_msb_m2_comparator_upper_agb_w;
	wire  [7:0]  underflow_zeros_w;
	wire  [8:0]  value_add_1_w;
	wire  [8:0]  value_minus_1_w;
	wire  [8:0]  value_normal_w;
	wire  [8:0]  value_zero_w;
	wire  [23:0]  zero_bit_23_w;
	wire  [30:0]  zero_bit_31_w;
	wire  [7:0]  zero_bit_8_w;
	wire  zero_bit_w;
	wire  zero_dataa_w;
	wire  zero_datab_w;
	wire  [31:0]  zero_res_w;
	wire  zero_w;

	fpoint_hw_qsys_div_single_altfp_div_csa_vhf   altfp_div_csa8
	( 
	.cin(add_1_w),
	.cout(wire_altfp_div_csa8_cout),
	.dataa(add_1_dataa_w),
	.datab(add_1_datab_w),
	.result(wire_altfp_div_csa8_result));
	fpoint_hw_qsys_div_single_altfp_div_srt_ext_5mh   altfp_div_srt_ext1
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.denom(man_b_w),
	.divider(wire_altfp_div_srt_ext1_divider),
	.numer(man_a_w),
	.quotient(wire_altfp_div_srt_ext1_quotient),
	.remain(wire_altfp_div_srt_ext1_remain));
	// synopsys translate_off
	initial
		and_or_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_dffe <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_dffe <= exp_man_and_or_w;
	// synopsys translate_off
	initial
		and_or_dffe1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_dffe1a <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_dffe1a <= and_or_pipeline_w;
	// synopsys translate_off
	initial
		and_or_dffe3a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_dffe3a <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_dffe3a <= and_or_int_w;
	// synopsys translate_off
	initial
		and_or_pipeline0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline0c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline0c <= and_or_dffe_w;
	// synopsys translate_off
	initial
		and_or_pipeline10c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline10c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline10c <= and_or_pipeline9c;
	// synopsys translate_off
	initial
		and_or_pipeline11c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline11c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline11c <= and_or_pipeline10c;
	// synopsys translate_off
	initial
		and_or_pipeline12c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline12c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline12c <= and_or_pipeline11c;
	// synopsys translate_off
	initial
		and_or_pipeline13c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline13c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline13c <= and_or_pipeline12c;
	// synopsys translate_off
	initial
		and_or_pipeline14c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline14c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline14c <= and_or_pipeline13c;
	// synopsys translate_off
	initial
		and_or_pipeline15c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline15c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline15c <= and_or_pipeline14c;
	// synopsys translate_off
	initial
		and_or_pipeline16c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline16c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline16c <= and_or_pipeline15c;
	// synopsys translate_off
	initial
		and_or_pipeline17c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline17c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline17c <= and_or_pipeline16c;
	// synopsys translate_off
	initial
		and_or_pipeline18c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline18c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline18c <= and_or_pipeline17c;
	// synopsys translate_off
	initial
		and_or_pipeline19c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline19c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline19c <= and_or_pipeline18c;
	// synopsys translate_off
	initial
		and_or_pipeline1c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline1c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline1c <= and_or_pipeline0c;
	// synopsys translate_off
	initial
		and_or_pipeline20c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline20c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline20c <= and_or_pipeline19c;
	// synopsys translate_off
	initial
		and_or_pipeline21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline21c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline21c <= and_or_pipeline20c;
	// synopsys translate_off
	initial
		and_or_pipeline22c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline22c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline22c <= and_or_pipeline21c;
	// synopsys translate_off
	initial
		and_or_pipeline23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline23c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline23c <= and_or_pipeline22c;
	// synopsys translate_off
	initial
		and_or_pipeline24c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline24c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline24c <= and_or_pipeline23c;
	// synopsys translate_off
	initial
		and_or_pipeline25c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline25c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline25c <= and_or_pipeline24c;
	// synopsys translate_off
	initial
		and_or_pipeline26c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline26c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline26c <= and_or_pipeline25c;
	// synopsys translate_off
	initial
		and_or_pipeline27c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline27c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline27c <= and_or_pipeline26c;
	// synopsys translate_off
	initial
		and_or_pipeline2c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline2c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline2c <= and_or_pipeline1c;
	// synopsys translate_off
	initial
		and_or_pipeline3c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline3c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline3c <= and_or_pipeline2c;
	// synopsys translate_off
	initial
		and_or_pipeline4c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline4c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline4c <= and_or_pipeline3c;
	// synopsys translate_off
	initial
		and_or_pipeline5c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline5c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline5c <= and_or_pipeline4c;
	// synopsys translate_off
	initial
		and_or_pipeline6c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline6c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline6c <= and_or_pipeline5c;
	// synopsys translate_off
	initial
		and_or_pipeline7c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline7c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline7c <= and_or_pipeline6c;
	// synopsys translate_off
	initial
		and_or_pipeline8c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline8c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline8c <= and_or_pipeline7c;
	// synopsys translate_off
	initial
		and_or_pipeline9c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) and_or_pipeline9c <= 8'b0;
		else if  (clk_en == 1'b1)   and_or_pipeline9c <= and_or_pipeline8c;
	// synopsys translate_off
	initial
		bias_addition_overf_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) bias_addition_overf_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   bias_addition_overf_dffe <= bias_addition_overf_w;
	// synopsys translate_off
	initial
		divider_pipe1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) divider_pipe1a <= 24'b0;
		else if  (clk_en == 1'b1)   divider_pipe1a <= wire_altfp_div_srt_ext1_divider;
	// synopsys translate_off
	initial
		exp_a_and_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_a_and_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   exp_a_and_dffe <= exp_a_and_msb2_w;
	// synopsys translate_off
	initial
		exp_a_b_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_a_b_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   exp_a_b_dffe <= exp_or_result_w;
	// synopsys translate_off
	initial
		exp_a_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_a_dffe <= 8'b0;
		else if  (clk_en == 1'b1)   exp_a_dffe <= dataa_int[30:23];
	// synopsys translate_off
	initial
		exp_a_or_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_a_or_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   exp_a_or_dffe <= exp_a_or_msb2_w;
	// synopsys translate_off
	initial
		exp_b_and_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_b_and_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   exp_b_and_dffe <= exp_b_and_msb2_w;
	// synopsys translate_off
	initial
		exp_b_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_b_dffe <= 8'b0;
		else if  (clk_en == 1'b1)   exp_b_dffe <= datab_int[30:23];
	// synopsys translate_off
	initial
		exp_b_or_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_b_or_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   exp_b_or_dffe <= exp_b_or_msb2_w;
	// synopsys translate_off
	initial
		exp_dffe1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_dffe1a <= 9'b0;
		else if  (clk_en == 1'b1)   exp_dffe1a <= exp_pipeline_w;
	// synopsys translate_off
	initial
		exp_dffe2a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_dffe2a <= 9'b0;
		else if  (clk_en == 1'b1)   exp_dffe2a <= exp_dffe1a_w;
	// synopsys translate_off
	initial
		exp_pipeline0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline0c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline0c <= exp_sub_w;
	// synopsys translate_off
	initial
		exp_pipeline10c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline10c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline10c <= exp_pipeline9c;
	// synopsys translate_off
	initial
		exp_pipeline11c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline11c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline11c <= exp_pipeline10c;
	// synopsys translate_off
	initial
		exp_pipeline12c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline12c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline12c <= exp_pipeline11c;
	// synopsys translate_off
	initial
		exp_pipeline13c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline13c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline13c <= exp_pipeline12c;
	// synopsys translate_off
	initial
		exp_pipeline14c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline14c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline14c <= exp_pipeline13c;
	// synopsys translate_off
	initial
		exp_pipeline15c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline15c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline15c <= exp_pipeline14c;
	// synopsys translate_off
	initial
		exp_pipeline16c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline16c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline16c <= exp_pipeline15c;
	// synopsys translate_off
	initial
		exp_pipeline17c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline17c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline17c <= exp_pipeline16c;
	// synopsys translate_off
	initial
		exp_pipeline18c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline18c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline18c <= exp_pipeline17c;
	// synopsys translate_off
	initial
		exp_pipeline19c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline19c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline19c <= exp_pipeline18c;
	// synopsys translate_off
	initial
		exp_pipeline1c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline1c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline1c <= exp_pipeline0c;
	// synopsys translate_off
	initial
		exp_pipeline20c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline20c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline20c <= exp_pipeline19c;
	// synopsys translate_off
	initial
		exp_pipeline21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline21c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline21c <= exp_pipeline20c;
	// synopsys translate_off
	initial
		exp_pipeline22c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline22c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline22c <= exp_pipeline21c;
	// synopsys translate_off
	initial
		exp_pipeline23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline23c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline23c <= exp_pipeline22c;
	// synopsys translate_off
	initial
		exp_pipeline24c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline24c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline24c <= exp_pipeline23c;
	// synopsys translate_off
	initial
		exp_pipeline25c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline25c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline25c <= exp_pipeline24c;
	// synopsys translate_off
	initial
		exp_pipeline26c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline26c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline26c <= exp_pipeline25c;
	// synopsys translate_off
	initial
		exp_pipeline2c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline2c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline2c <= exp_pipeline1c;
	// synopsys translate_off
	initial
		exp_pipeline3c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline3c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline3c <= exp_pipeline2c;
	// synopsys translate_off
	initial
		exp_pipeline4c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline4c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline4c <= exp_pipeline3c;
	// synopsys translate_off
	initial
		exp_pipeline5c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline5c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline5c <= exp_pipeline4c;
	// synopsys translate_off
	initial
		exp_pipeline6c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline6c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline6c <= exp_pipeline5c;
	// synopsys translate_off
	initial
		exp_pipeline7c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline7c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline7c <= exp_pipeline6c;
	// synopsys translate_off
	initial
		exp_pipeline8c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline8c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline8c <= exp_pipeline7c;
	// synopsys translate_off
	initial
		exp_pipeline9c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_pipeline9c <= 9'b0;
		else if  (clk_en == 1'b1)   exp_pipeline9c <= exp_pipeline8c;
	// synopsys translate_off
	initial
		exp_res_pipe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_pipe3 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_res_pipe3 <= exp_res_int_w;
	// synopsys translate_off
	initial
		implied_bit = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) implied_bit <= 1'b0;
		else if  (clk_en == 1'b1)   implied_bit <= wire_altfp_div_srt_ext1_quotient[26];
	// synopsys translate_off
	initial
		implied_bit2a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) implied_bit2a <= 1'b0;
		else if  (clk_en == 1'b1)   implied_bit2a <= implied_bit;
	// synopsys translate_off
	initial
		man_a_and_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_a_and_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   man_a_and_dffe <= man_a_and_msb2_w;
	// synopsys translate_off
	initial
		man_a_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_a_dffe <= 23'b0;
		else if  (clk_en == 1'b1)   man_a_dffe <= dataa_int[22:0];
	// synopsys translate_off
	initial
		man_a_or_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_a_or_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   man_a_or_dffe <= man_a_or_msb2_w;
	// synopsys translate_off
	initial
		man_b_and_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_b_and_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   man_b_and_dffe <= man_b_and_msb2_w;
	// synopsys translate_off
	initial
		man_b_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_b_dffe <= 23'b0;
		else if  (clk_en == 1'b1)   man_b_dffe <= datab_int[22:0];
	// synopsys translate_off
	initial
		man_b_or_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_b_or_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   man_b_or_dffe <= man_b_or_msb2_w;
	// synopsys translate_off
	initial
		man_res_pipe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_pipe3 <= 24'b0;
		else if  (clk_en == 1'b1)   man_res_pipe3 <= man_res_int_w;
	// synopsys translate_off
	initial
		quotient_pipe1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quotient_pipe1a <= 28'b0;
		else if  (clk_en == 1'b1)   quotient_pipe1a <= wire_altfp_div_srt_ext1_quotient;
	// synopsys translate_off
	initial
		remainder_pipe1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) remainder_pipe1a <= 24'b0;
		else if  (clk_en == 1'b1)   remainder_pipe1a <= wire_altfp_div_srt_ext1_remain;
	// synopsys translate_off
	initial
		result_output_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) result_output_dffe <= 32'b0;
		else if  (clk_en == 1'b1)   result_output_dffe <= mux_3_res_w;
	// synopsys translate_off
	initial
		rnd_overflow_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rnd_overflow_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   rnd_overflow_dffe <= rnd_overflow;
	// synopsys translate_off
	initial
		rnded_man_pipe2a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rnded_man_pipe2a <= 24'b0;
		else if  (clk_en == 1'b1)   rnded_man_pipe2a <= rnded_man_w;
	// synopsys translate_off
	initial
		sign_a_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_a_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   sign_a_dffe <= dataa_int[31];
	// synopsys translate_off
	initial
		sign_b_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_b_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   sign_b_dffe <= datab_int[31];
	// synopsys translate_off
	initial
		sign_div_pipeline0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline0c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline0c <= sign_div;
	// synopsys translate_off
	initial
		sign_div_pipeline10c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline10c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline10c <= sign_div_pipeline9c;
	// synopsys translate_off
	initial
		sign_div_pipeline11c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline11c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline11c <= sign_div_pipeline10c;
	// synopsys translate_off
	initial
		sign_div_pipeline12c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline12c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline12c <= sign_div_pipeline11c;
	// synopsys translate_off
	initial
		sign_div_pipeline13c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline13c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline13c <= sign_div_pipeline12c;
	// synopsys translate_off
	initial
		sign_div_pipeline14c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline14c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline14c <= sign_div_pipeline13c;
	// synopsys translate_off
	initial
		sign_div_pipeline15c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline15c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline15c <= sign_div_pipeline14c;
	// synopsys translate_off
	initial
		sign_div_pipeline16c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline16c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline16c <= sign_div_pipeline15c;
	// synopsys translate_off
	initial
		sign_div_pipeline17c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline17c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline17c <= sign_div_pipeline16c;
	// synopsys translate_off
	initial
		sign_div_pipeline18c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline18c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline18c <= sign_div_pipeline17c;
	// synopsys translate_off
	initial
		sign_div_pipeline19c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline19c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline19c <= sign_div_pipeline18c;
	// synopsys translate_off
	initial
		sign_div_pipeline1c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline1c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline1c <= sign_div_pipeline0c;
	// synopsys translate_off
	initial
		sign_div_pipeline20c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline20c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline20c <= sign_div_pipeline19c;
	// synopsys translate_off
	initial
		sign_div_pipeline21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline21c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline21c <= sign_div_pipeline20c;
	// synopsys translate_off
	initial
		sign_div_pipeline22c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline22c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline22c <= sign_div_pipeline21c;
	// synopsys translate_off
	initial
		sign_div_pipeline23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline23c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline23c <= sign_div_pipeline22c;
	// synopsys translate_off
	initial
		sign_div_pipeline24c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline24c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline24c <= sign_div_pipeline23c;
	// synopsys translate_off
	initial
		sign_div_pipeline25c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline25c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline25c <= sign_div_pipeline24c;
	// synopsys translate_off
	initial
		sign_div_pipeline26c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline26c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline26c <= sign_div_pipeline25c;
	// synopsys translate_off
	initial
		sign_div_pipeline27c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline27c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline27c <= sign_div_pipeline26c;
	// synopsys translate_off
	initial
		sign_div_pipeline2c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline2c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline2c <= sign_div_pipeline1c;
	// synopsys translate_off
	initial
		sign_div_pipeline3c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline3c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline3c <= sign_div_pipeline2c;
	// synopsys translate_off
	initial
		sign_div_pipeline4c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline4c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline4c <= sign_div_pipeline3c;
	// synopsys translate_off
	initial
		sign_div_pipeline5c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline5c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline5c <= sign_div_pipeline4c;
	// synopsys translate_off
	initial
		sign_div_pipeline6c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline6c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline6c <= sign_div_pipeline5c;
	// synopsys translate_off
	initial
		sign_div_pipeline7c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline7c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline7c <= sign_div_pipeline6c;
	// synopsys translate_off
	initial
		sign_div_pipeline8c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline8c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline8c <= sign_div_pipeline7c;
	// synopsys translate_off
	initial
		sign_div_pipeline9c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_div_pipeline9c <= 1'b0;
		else if  (clk_en == 1'b1)   sign_div_pipeline9c <= sign_div_pipeline8c;
	// synopsys translate_off
	initial
		sign_pipe1a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe1a <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe1a <= sign_div_pipeline_w;
	// synopsys translate_off
	initial
		sign_pipe2a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe2a <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe2a <= sign_pipe1a;
	// synopsys translate_off
	initial
		sign_pipe3a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_pipe3a <= 1'b0;
		else if  (clk_en == 1'b1)   sign_pipe3a <= sign_pipe2a;
	lpm_add_sub   add_sub10
	( 
	.cout(),
	.dataa(exp_dffe2a_w),
	.datab(bias_add_w),
	.overflow(wire_add_sub10_overflow),
	.result(wire_add_sub10_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub10.lpm_direction = "ADD",
		add_sub10.lpm_representation = "SIGNED",
		add_sub10.lpm_width = 9,
		add_sub10.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub9
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(exp_sub_a_w),
	.datab(exp_sub_b_w),
	.overflow(),
	.result(wire_add_sub9_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub9.lpm_direction = "SUB",
		add_sub9.lpm_pipeline = 1,
		add_sub9.lpm_representation = "SIGNED",
		add_sub9.lpm_width = 9,
		add_sub9.lpm_type = "lpm_add_sub";
	lpm_compare   cmpr2
	( 
	.aeb(wire_cmpr2_aeb),
	.agb(wire_cmpr2_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(quo_msb_m1_compare_dataa[52:39]),
	.datab(quo_msb_m1_compare_datab[52:39])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr2.lpm_representation = "UNSIGNED",
		cmpr2.lpm_width = 14,
		cmpr2.lpm_type = "lpm_compare";
	lpm_compare   cmpr3
	( 
	.aeb(wire_cmpr3_aeb),
	.agb(wire_cmpr3_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(quo_msb_m1_compare_dataa[38:26]),
	.datab(quo_msb_m1_compare_datab[38:26])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr3.lpm_representation = "UNSIGNED",
		cmpr3.lpm_width = 13,
		cmpr3.lpm_type = "lpm_compare";
	lpm_compare   cmpr4
	( 
	.aeb(wire_cmpr4_aeb),
	.agb(wire_cmpr4_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(quo_msb_m1_compare_dataa[25:13]),
	.datab(quo_msb_m1_compare_datab[25:13])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr4.lpm_representation = "UNSIGNED",
		cmpr4.lpm_width = 13,
		cmpr4.lpm_type = "lpm_compare";
	lpm_compare   cmpr5
	( 
	.aeb(),
	.agb(),
	.ageb(wire_cmpr5_ageb),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(quo_msb_m1_compare_dataa[12:0]),
	.datab(quo_msb_m1_compare_datab[12:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr5.lpm_representation = "UNSIGNED",
		cmpr5.lpm_width = 13,
		cmpr5.lpm_type = "lpm_compare";
	lpm_compare   cmpr6
	( 
	.aeb(wire_cmpr6_aeb),
	.agb(wire_cmpr6_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(quo_msb_m2_compare_dataa[53:27]),
	.datab(quo_msb_m2_compare_datab[53:27])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr6.lpm_representation = "UNSIGNED",
		cmpr6.lpm_width = 27,
		cmpr6.lpm_type = "lpm_compare";
	lpm_compare   cmpr7
	( 
	.aeb(),
	.agb(),
	.ageb(wire_cmpr7_ageb),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(quo_msb_m2_compare_dataa[26:0]),
	.datab(quo_msb_m2_compare_datab[26:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr7.lpm_representation = "UNSIGNED",
		cmpr7.lpm_width = 27,
		cmpr7.lpm_type = "lpm_compare";
	assign
		add_1_dataa_w = {checked_quotient_dffe1a_w},
		add_1_datab_w = {24{1'b0}},
		add_1_w = ((((~ guard_bit_dffe1a_w) & round_bit_dffe1a_w) & sticky_bit_dffe1a_w) | (guard_bit_dffe1a_w & round_bit_dffe1a_w)),
		add_one_process_w = wire_altfp_div_csa8_result,
		and_or_dffe1a_w = and_or_dffe1a,
		and_or_dffe3a_w = and_or_dffe3a,
		and_or_dffe_w = and_or_dffe,
		and_or_int_w = and_or_dffe1a,
		and_or_pipeline_w = and_or_pipeline27c,
		bias_add_w = (({9{(~ exp_a_b_w)}} & value_zero_w) | ({9{exp_a_b_w}} & bias_value_w)),
		bias_addition_overf_w = (wire_add_sub10_overflow | ((~ exp_sign_w) & exp_bias_and_res_w)),
		bias_addition_w = wire_add_sub10_result[7:0],
		bias_value_w = (((({9{((~ mux1_exp_s1a) & (~ mux1_exp_s0a))}} & value_minus_1_w) | ({9{((~ mux1_exp_s1a) & mux1_exp_s0a)}} & value_normal_w)) | ({9{(mux1_exp_s1a & (~ mux1_exp_s0a))}} & value_normal_w)) | ({9{(mux1_exp_s1a & mux1_exp_s0a)}} & value_add_1_w)),
		checked_quotient_dffe1a_w = checked_quotient_w,
		checked_quotient_w = (({24{quo_msb_m1_w}} & quotient_msb_m1_w) | ({24{(~ quo_msb_m1_w)}} & quotient_msb_m2_w)),
		dataa_exp_bus_w = dataa[30:23],
		dataa_int = {dataa[31], (({31{dataa_S0}} & zero_bit_31_w) | ({31{(~ dataa_S0)}} & dataa[30:0]))},
		dataa_man_bus_w = dataa[22:0],
		dataa_S0 = ((~ exp_a_or_msb_w) & man_a_or_msb_w),
		datab_exp_bus_w = datab[30:23],
		datab_int = {datab[31], (({31{datab_S0}} & zero_bit_31_w) | ({31{(~ datab_S0)}} & datab[30:0]))},
		datab_man_bus_w = datab[22:0],
		datab_S0 = ((~ exp_b_or_msb_w) & man_b_or_msb_w),
		divider_srt_w = divider_pipe1a,
		exp_a_and_msb2_w = and_or_dffe3a_w[6],
		exp_a_and_msb_w = exp_a_and_w[7],
		exp_a_and_mux_w = ((dataa_S0 & zero_bit_w) | ((~ dataa_S0) & exp_a_and_msb_w)),
		exp_a_and_w = {(exp_a_and_w[6] & exp_a_bus_w[7]), (exp_a_and_w[5] & exp_a_bus_w[6]), (exp_a_and_w[4] & exp_a_bus_w[5]), (exp_a_and_w[3] & exp_a_bus_w[4]), (exp_a_and_w[2] & exp_a_bus_w[3]), (exp_a_and_w[1] & exp_a_bus_w[2]), (exp_a_and_w[0] & exp_a_bus_w[1]), exp_a_bus_w[0]},
		exp_a_b_w = exp_a_b_dffe,
		exp_a_bus_w = dataa_exp_bus_w,
		exp_a_non_zero_w = exp_a_or_dffe,
		exp_a_one_w = exp_a_and_dffe,
		exp_a_or_msb2_w = and_or_dffe3a_w[7],
		exp_a_or_msb_w = exp_a_or_w[7],
		exp_a_or_mux_w = ((dataa_S0 & zero_bit_w) | ((~ dataa_S0) & exp_a_or_msb_w)),
		exp_a_or_w = {(exp_a_or_w[6] | exp_a_bus_w[7]), (exp_a_or_w[5] | exp_a_bus_w[6]), (exp_a_or_w[4] | exp_a_bus_w[5]), (exp_a_or_w[3] | exp_a_bus_w[4]), (exp_a_or_w[2] | exp_a_bus_w[3]), (exp_a_or_w[1] | exp_a_bus_w[2]), (exp_a_or_w[0] | exp_a_bus_w[1]), exp_a_bus_w[0]},
		exp_a_w = exp_a_dffe,
		exp_a_zero_w = (~ exp_a_or_dffe),
		exp_b_and_msb2_w = and_or_dffe3a_w[2],
		exp_b_and_msb_w = exp_b_and_w[7],
		exp_b_and_mux_w = ((datab_S0 & zero_bit_w) | ((~ datab_S0) & exp_b_and_msb_w)),
		exp_b_and_w = {(exp_b_and_w[6] & exp_b_bus_w[7]), (exp_b_and_w[5] & exp_b_bus_w[6]), (exp_b_and_w[4] & exp_b_bus_w[5]), (exp_b_and_w[3] & exp_b_bus_w[4]), (exp_b_and_w[2] & exp_b_bus_w[3]), (exp_b_and_w[1] & exp_b_bus_w[2]), (exp_b_and_w[0] & exp_b_bus_w[1]), exp_b_bus_w[0]},
		exp_b_bus_w = datab_exp_bus_w,
		exp_b_non_zero_w = exp_b_or_dffe,
		exp_b_one_w = exp_b_and_dffe,
		exp_b_or_msb2_w = and_or_dffe3a_w[3],
		exp_b_or_msb_w = exp_b_or_w[7],
		exp_b_or_mux_w = ((datab_S0 & zero_bit_w) | ((~ datab_S0) & exp_b_or_msb_w)),
		exp_b_or_w = {(exp_b_or_w[6] | exp_b_bus_w[7]), (exp_b_or_w[5] | exp_b_bus_w[6]), (exp_b_or_w[4] | exp_b_bus_w[5]), (exp_b_or_w[3] | exp_b_bus_w[4]), (exp_b_or_w[2] | exp_b_bus_w[3]), (exp_b_or_w[1] | exp_b_bus_w[2]), (exp_b_or_w[0] | exp_b_bus_w[1]), exp_b_bus_w[0]},
		exp_b_w = exp_b_dffe,
		exp_b_zero_w = (~ exp_b_or_dffe),
		exp_bias_and_res_w = exp_bias_and_w[7],
		exp_bias_and_w = {(exp_bias_and_w[6] & exp_bias_bus_w[7]), (exp_bias_and_w[5] & exp_bias_bus_w[6]), (exp_bias_and_w[4] & exp_bias_bus_w[5]), (exp_bias_and_w[3] & exp_bias_bus_w[4]), (exp_bias_and_w[2] & exp_bias_bus_w[3]), (exp_bias_and_w[1] & exp_bias_bus_w[2]), (exp_bias_and_w[0] & exp_bias_bus_w[1]), exp_bias_bus_w[0]},
		exp_bias_bus_w = wire_add_sub10_result[7:0],
		exp_dffe1a_w = exp_dffe1a,
		exp_dffe2a_w = exp_dffe2a,
		exp_exc_ones_w = {8{1'b1}},
		exp_exc_zeros_w = {8{1'b0}},
		exp_higher_bit = not_bias_addition_w[7:6],
		exp_higher_or = {(exp_higher_or[0] | exp_higher_bit[1]), exp_higher_bit[0]},
		exp_infi_bus_w = norm_infi_and_w[7],
		exp_man_and_or_w = {exp_a_or_mux_w, exp_a_and_mux_w, man_a_or_mux_w, man_a_and_mux_w, exp_b_or_mux_w, exp_b_and_mux_w, man_b_or_mux_w, man_b_and_mux_w},
		exp_or_result_w = (and_or_dffe1a_w[7] | and_or_dffe1a_w[3]),
		exp_pipeline_w = exp_pipeline26c,
		exp_res_and_w = {(exp_res_and_w[6] & exp_res_bus_w[7]), (exp_res_and_w[5] & exp_res_bus_w[6]), (exp_res_and_w[4] & exp_res_bus_w[5]), (exp_res_and_w[3] & exp_res_bus_w[4]), (exp_res_and_w[2] & exp_res_bus_w[3]), (exp_res_and_w[1] & exp_res_bus_w[2]), (exp_res_and_w[0] & exp_res_bus_w[1]), exp_res_bus_w[0]},
		exp_res_bus_w = exp_res_w,
		exp_res_int2_bus_w = exp_res_int2_w,
		exp_res_int2_or_w = {(exp_res_int2_or_w[6] | exp_res_int2_bus_w[7]), (exp_res_int2_or_w[5] | exp_res_int2_bus_w[6]), (exp_res_int2_or_w[4] | exp_res_int2_bus_w[5]), (exp_res_int2_or_w[3] | exp_res_int2_bus_w[4]), (exp_res_int2_or_w[2] | exp_res_int2_bus_w[3]), (exp_res_int2_or_w[1] | exp_res_int2_bus_w[2]), (exp_res_int2_or_w[0] | exp_res_int2_bus_w[1]), exp_res_int2_bus_w[0]},
		exp_res_int2_w = exp_res_pipe3,
		exp_res_int_w = ((({8{((~ bias_addition_overf_w) & (~ exp_sign_w))}} & bias_addition_w) | ({8{((~ bias_addition_overf_w) & exp_sign_w)}} & underflow_zeros_w)) | ({8{(bias_addition_overf_w & (~ exp_sign_w))}} & overflow_ones_w)),
		exp_res_w = (({8{not_exp_res_int2_or_res_w}} & zero_bit_8_w) | ({8{(~ not_exp_res_int2_or_res_w)}} & exp_res_int2_w)),
		exp_sign_w = wire_add_sub10_result[8],
		exp_sub_a_w = {1'b0, exp_a_w},
		exp_sub_b_w = {1'b0, exp_b_w},
		exp_sub_w = wire_add_sub9_result,
		exp_zero_bus_w = (~ norm_zero_or_w[7]),
		guard_bit_dffe1a_w = guard_bit_w,
		guard_bit_quo_msb_m1 = quotient_w[3],
		guard_bit_quo_msb_m2 = quotient_w[2],
		guard_bit_w = ((quo_msb_m1_w & guard_bit_quo_msb_m1) | ((~ quo_msb_m1_w) & guard_bit_quo_msb_m2)),
		infi_combi_w = (((infi_dataa_w & norm_datab_w) | (norm_dataa_w & zero_datab_w)) | (infi_dataa_w & zero_datab_w)),
		infi_dataa_w = (exp_a_one_w & man_a_zero_w),
		infi_datab_w = (exp_b_one_w & man_b_zero_w),
		infi_res_w = {sign_exc_bit_w, exp_exc_ones_w, man_exc_zeros_w},
		infinite_int_w = (infi_combi_w | overflow_int_w),
		infinite_w = infinite_int_w,
		man_24_zeros_w = {24{1'b0}},
		man_a_and_msb2_w = and_or_dffe3a_w[4],
		man_a_and_msb_w = man_a_and_w[22],
		man_a_and_mux_w = ((dataa_S0 & zero_bit_w) | ((~ dataa_S0) & man_a_and_msb_w)),
		man_a_and_w = {(man_a_and_w[21] & man_a_bus_w[22]), (man_a_and_w[20] & man_a_bus_w[21]), (man_a_and_w[19] & man_a_bus_w[20]), (man_a_and_w[18] & man_a_bus_w[19]), (man_a_and_w[17] & man_a_bus_w[18]), (man_a_and_w[16] & man_a_bus_w[17]), (man_a_and_w[15] & man_a_bus_w[16]), (man_a_and_w[14] & man_a_bus_w[15]), (man_a_and_w[13] & man_a_bus_w[14]), (man_a_and_w[12] & man_a_bus_w[13]), (man_a_and_w[11] & man_a_bus_w[12]), (man_a_and_w[10] & man_a_bus_w[11]), (man_a_and_w[9] & man_a_bus_w[10]), (man_a_and_w[8] & man_a_bus_w[9]), (man_a_and_w[7] & man_a_bus_w[8]), (man_a_and_w[6] & man_a_bus_w[7]), (man_a_and_w[5] & man_a_bus_w[6]), (man_a_and_w[4] & man_a_bus_w[5]), (man_a_and_w[3] & man_a_bus_w[4]), (man_a_and_w[2] & man_a_bus_w[3]), (man_a_and_w[1] & man_a_bus_w[2]), (man_a_and_w[0] & man_a_bus_w[1]), man_a_bus_w[0]},
		man_a_bus_w = dataa_man_bus_w,
		man_a_int_w = man_a_dffe,
		man_a_non_zero_w = man_a_or_dffe,
		man_a_one_w = man_a_and_dffe,
		man_a_or_msb2_w = and_or_dffe3a_w[5],
		man_a_or_msb_w = man_a_or_w[22],
		man_a_or_mux_w = ((dataa_S0 & zero_bit_w) | ((~ dataa_S0) & man_a_or_msb_w)),
		man_a_or_w = {(man_a_or_w[21] | man_a_bus_w[22]), (man_a_or_w[20] | man_a_bus_w[21]), (man_a_or_w[19] | man_a_bus_w[20]), (man_a_or_w[18] | man_a_bus_w[19]), (man_a_or_w[17] | man_a_bus_w[18]), (man_a_or_w[16] | man_a_bus_w[17]), (man_a_or_w[15] | man_a_bus_w[16]), (man_a_or_w[14] | man_a_bus_w[15]), (man_a_or_w[13] | man_a_bus_w[14]), (man_a_or_w[12] | man_a_bus_w[13]), (man_a_or_w[11] | man_a_bus_w[12]), (man_a_or_w[10] | man_a_bus_w[11]), (man_a_or_w[9] | man_a_bus_w[10]), (man_a_or_w[8] | man_a_bus_w[9]), (man_a_or_w[7] | man_a_bus_w[8]), (man_a_or_w[6] | man_a_bus_w[7]), (man_a_or_w[5] | man_a_bus_w[6]), (man_a_or_w[4] | man_a_bus_w[5]), (man_a_or_w[3] | man_a_bus_w[4]), (man_a_or_w[2] | man_a_bus_w[3]), (man_a_or_w[1] | man_a_bus_w[2]), (man_a_or_w[0] | man_a_bus_w[1]), man_a_bus_w[0]},
		man_a_w = {1'b1, man_a_int_w},
		man_a_zero_w = (~ man_a_or_dffe),
		man_b_and_msb2_w = and_or_dffe3a_w[0],
		man_b_and_msb_w = man_b_and_w[22],
		man_b_and_mux_w = ((datab_S0 & zero_bit_w) | ((~ datab_S0) & man_b_and_msb_w)),
		man_b_and_w = {(man_b_and_w[21] & man_b_bus_w[22]), (man_b_and_w[20] & man_b_bus_w[21]), (man_b_and_w[19] & man_b_bus_w[20]), (man_b_and_w[18] & man_b_bus_w[19]), (man_b_and_w[17] & man_b_bus_w[18]), (man_b_and_w[16] & man_b_bus_w[17]), (man_b_and_w[15] & man_b_bus_w[16]), (man_b_and_w[14] & man_b_bus_w[15]), (man_b_and_w[13] & man_b_bus_w[14]), (man_b_and_w[12] & man_b_bus_w[13]), (man_b_and_w[11] & man_b_bus_w[12]), (man_b_and_w[10] & man_b_bus_w[11]), (man_b_and_w[9] & man_b_bus_w[10]), (man_b_and_w[8] & man_b_bus_w[9]), (man_b_and_w[7] & man_b_bus_w[8]), (man_b_and_w[6] & man_b_bus_w[7]), (man_b_and_w[5] & man_b_bus_w[6]), (man_b_and_w[4] & man_b_bus_w[5]), (man_b_and_w[3] & man_b_bus_w[4]), (man_b_and_w[2] & man_b_bus_w[3]), (man_b_and_w[1] & man_b_bus_w[2]), (man_b_and_w[0] & man_b_bus_w[1]), man_b_bus_w[0]},
		man_b_bus_w = datab_man_bus_w,
		man_b_int_w = man_b_dffe,
		man_b_non_zero_w = man_b_or_dffe,
		man_b_one_w = man_b_and_dffe,
		man_b_or_msb2_w = and_or_dffe3a_w[1],
		man_b_or_msb_w = man_b_or_w[22],
		man_b_or_mux_w = ((datab_S0 & zero_bit_w) | ((~ datab_S0) & man_b_or_msb_w)),
		man_b_or_w = {(man_b_or_w[21] | man_b_bus_w[22]), (man_b_or_w[20] | man_b_bus_w[21]), (man_b_or_w[19] | man_b_bus_w[20]), (man_b_or_w[18] | man_b_bus_w[19]), (man_b_or_w[17] | man_b_bus_w[18]), (man_b_or_w[16] | man_b_bus_w[17]), (man_b_or_w[15] | man_b_bus_w[16]), (man_b_or_w[14] | man_b_bus_w[15]), (man_b_or_w[13] | man_b_bus_w[14]), (man_b_or_w[12] | man_b_bus_w[13]), (man_b_or_w[11] | man_b_bus_w[12]), (man_b_or_w[10] | man_b_bus_w[11]), (man_b_or_w[9] | man_b_bus_w[10]), (man_b_or_w[8] | man_b_bus_w[9]), (man_b_or_w[7] | man_b_bus_w[8]), (man_b_or_w[6] | man_b_bus_w[7]), (man_b_or_w[5] | man_b_bus_w[6]), (man_b_or_w[4] | man_b_bus_w[5]), (man_b_or_w[3] | man_b_bus_w[4]), (man_b_or_w[2] | man_b_bus_w[3]), (man_b_or_w[1] | man_b_bus_w[2]), (man_b_or_w[0] | man_b_bus_w[1]), man_b_bus_w[0]},
		man_b_w = {1'b1, man_b_int_w},
		man_b_zero_w = (~ man_b_or_dffe),
		man_exc_nan_w = {1'b1, man_exc_zeros_w[21:0]},
		man_exc_zeros_w = {23{1'b0}},
		man_res_bus_w = man_res_w[22:0],
		man_res_int2_w = man_res_pipe3,
		man_res_int_w = mux_zero_non_zero_w,
		man_res_or_w = {(man_res_or_w[21] | man_res_bus_w[22]), (man_res_or_w[20] | man_res_bus_w[21]), (man_res_or_w[19] | man_res_bus_w[20]), (man_res_or_w[18] | man_res_bus_w[19]), (man_res_or_w[17] | man_res_bus_w[18]), (man_res_or_w[16] | man_res_bus_w[17]), (man_res_or_w[15] | man_res_bus_w[16]), (man_res_or_w[14] | man_res_bus_w[15]), (man_res_or_w[13] | man_res_bus_w[14]), (man_res_or_w[12] | man_res_bus_w[13]), (man_res_or_w[11] | man_res_bus_w[12]), (man_res_or_w[10] | man_res_bus_w[11]), (man_res_or_w[9] | man_res_bus_w[10]), (man_res_or_w[8] | man_res_bus_w[9]), (man_res_or_w[7] | man_res_bus_w[8]), (man_res_or_w[6] | man_res_bus_w[7]), (man_res_or_w[5] | man_res_bus_w[6]), (man_res_or_w[4] | man_res_bus_w[5]), (man_res_or_w[3] | man_res_bus_w[4]), (man_res_or_w[2] | man_res_bus_w[3]), (man_res_or_w[1] | man_res_bus_w[2]), (man_res_or_w[0] | man_res_bus_w[1]), man_res_bus_w[0]},
		man_res_w = (({24{not_exp_res_int2_or_res_w}} & zero_bit_23_w) | ({24{(~ not_exp_res_int2_or_res_w)}} & man_res_int2_w)),
		mux1_exp_s0a = rnd_add_overf_w,
		mux1_exp_s1a = implied_bit2a,
		mux_1_res_w = (({32{infinite_w}} & infi_res_w) | ({32{(~ infinite_w)}} & norm_res_int_w)),
		mux_2_res_w = (({32{zero_w}} & zero_res_w) | ({32{(~ zero_w)}} & mux_1_res_w)),
		mux_3_res_w = (({32{nan_w}} & nan_res_w) | ({32{(~ nan_w)}} & mux_2_res_w)),
		mux_zero_non_zero_S0 = (((exp_zero_bus_w | signed_N_exp_h_or) | bias_addition_overf_w) | (exp_infi_bus_w & (~ exp_sign_w))),
		mux_zero_non_zero_w = (({24{mux_zero_non_zero_S0}} & man_24_zeros_w) | ({24{(~ mux_zero_non_zero_S0)}} & res_rnded_man_w)),
		nan_dataa_w = (exp_a_one_w & (man_a_non_zero_w | man_a_one_w)),
		nan_datab_w = (exp_b_one_w & (man_b_non_zero_w | man_b_one_w)),
		nan_res_w = {sign_exc_bit_w, exp_exc_ones_w, man_exc_nan_w},
		nan_w = (((nan_dataa_w | nan_datab_w) | (zero_dataa_w & zero_datab_w)) | (infi_dataa_w & infi_datab_w)),
		norm_dataa_w = ((exp_a_non_zero_w & ((man_a_zero_w | man_a_non_zero_w) | man_a_one_w)) & (~ exp_a_one_w)),
		norm_datab_w = ((exp_b_non_zero_w & ((man_b_zero_w | man_b_non_zero_w) | man_b_one_w)) & (~ exp_b_one_w)),
		norm_infi_and_w = {(norm_infi_and_w[6] & norm_infi_bus_w[7]), (norm_infi_and_w[5] & norm_infi_bus_w[6]), (norm_infi_and_w[4] & norm_infi_bus_w[5]), (norm_infi_and_w[3] & norm_infi_bus_w[4]), (norm_infi_and_w[2] & norm_infi_bus_w[3]), (norm_infi_and_w[1] & norm_infi_bus_w[2]), (norm_infi_and_w[0] & norm_infi_bus_w[1]), norm_infi_bus_w[0]},
		norm_infi_bus_w = bias_addition_w,
		norm_res_int_w = {sign_pipe3a, exp_res_w[7:0], man_res_w[22:0]},
		norm_zero_bus_w = bias_addition_w,
		norm_zero_or_w = {(norm_zero_or_w[6] | norm_zero_bus_w[7]), (norm_zero_or_w[5] | norm_zero_bus_w[6]), (norm_zero_or_w[4] | norm_zero_bus_w[5]), (norm_zero_or_w[3] | norm_zero_bus_w[4]), (norm_zero_or_w[2] | norm_zero_bus_w[3]), (norm_zero_or_w[1] | norm_zero_bus_w[2]), (norm_zero_or_w[0] | norm_zero_bus_w[1]), norm_zero_bus_w[0]},
		not_bias_addition_w = (~ bias_addition_w),
		not_exp_res_int2_or_res_w = (~ exp_res_int2_or_w[7]),
		overflow_int_w = (((bias_addition_overf_dffe & (~ nan_w)) & (~ infi_combi_w)) & (~ ((norm_dataa_w & (~ zero_dataa_w)) & zero_datab_w))),
		overflow_man_w = {1'b1, {23{1'b0}}},
		overflow_ones_w = {8{1'b1}},
		quo_msb_m1_compare_dataa = {remainder_srt_w, {29{1'b0}}},
		quo_msb_m1_compare_datab = {{29{1'b0}}, divider_srt_w},
		quo_msb_m1_compare_w = (((sticky_quo_msb_m1_comparator_upper_upper_agb_w | (sticky_quo_msb_m1_comparator_upper_upper_aeb_w & sticky_quo_msb_m1_comparator_upper_lower_agb_w)) | (sticky_quo_msb_m1_comparator_upper_lower_aeb_w & sticky_quo_msb_m1_comparator_lower_upper_agb_w)) | (sticky_quo_msb_m1_comparator_lower_upper_aeb_w & sticky_quo_msb_m1_comparator_lower_lower_ageb_w)),
		quo_msb_m1_w = quotient_w[26],
		quo_msb_m2_compare_dataa = {remainder_srt_w, {30{1'b0}}},
		quo_msb_m2_compare_datab = {{30{1'b0}}, divider_srt_w},
		quo_msb_m2_compare_w = (sticky_quo_msb_m2_comparator_upper_agb_w | (sticky_quo_msb_m2_comparator_upper_aeb_w & sticky_quo_msb_m2_comparator_lower_ageb_w)),
		quotient_msb_m1_w = quotient_w[26:3],
		quotient_msb_m2_w = quotient_w[25:2],
		quotient_w = quotient_pipe1a,
		remainder_srt_w = remainder_pipe1a,
		res_rnded_man_w = rnded_man_pipe2a,
		result = result_output_dffe,
		rnd_add_overf_w = rnd_overflow_dffe,
		rnd_overflow = wire_altfp_div_csa8_cout,
		rnded_man_w = (({24{rnd_overflow}} & overflow_man_w) | ({24{(~ rnd_overflow)}} & add_one_process_w)),
		round_bit_dffe1a_w = round_bit_w,
		round_bit_quo_msb_m1 = quotient_w[2],
		round_bit_quo_msb_m2 = quotient_w[1],
		round_bit_w = ((quo_msb_m1_w & round_bit_quo_msb_m1) | ((~ quo_msb_m1_w) & round_bit_quo_msb_m2)),
		sign_a_w = sign_a_dffe,
		sign_b_w = sign_b_dffe,
		sign_div = (sign_a_w ^ sign_b_w),
		sign_div_pipeline_w = sign_div_pipeline27c,
		sign_exc_bit_w = sign_pipe3a,
		signed_N_exp_h_or = (exp_sign_w & exp_higher_or[1]),
		sticky_bit_dffe1a_w = sticky_bit_w,
		sticky_bit_quo_msb_m1 = (quo_msb_m1_compare_w | sticky_bit_quo_msb_m1_or[1]),
		sticky_bit_quo_msb_m1_bit = sticky_bit_quo_msb_m1_tmp,
		sticky_bit_quo_msb_m1_or = {(sticky_bit_quo_msb_m1_or[0] | sticky_bit_quo_msb_m1_bit[1]), sticky_bit_quo_msb_m1_bit[0]},
		sticky_bit_quo_msb_m1_tmp = quotient_w[1:0],
		sticky_bit_quo_msb_m2 = (quo_msb_m2_compare_w | sticky_bit_quo_msb_m2_or[0]),
		sticky_bit_quo_msb_m2_bit = sticky_bit_quo_msb_m2_tmp,
		sticky_bit_quo_msb_m2_or = {sticky_bit_quo_msb_m2_bit[0]},
		sticky_bit_quo_msb_m2_tmp = quotient_w[0],
		sticky_bit_w = ((quo_msb_m1_w & sticky_bit_quo_msb_m1) | ((~ quo_msb_m1_w) & sticky_bit_quo_msb_m2)),
		sticky_quo_msb_m1_comparator_lower_lower_ageb_w = wire_cmpr5_ageb,
		sticky_quo_msb_m1_comparator_lower_upper_aeb_w = wire_cmpr4_aeb,
		sticky_quo_msb_m1_comparator_lower_upper_agb_w = wire_cmpr4_agb,
		sticky_quo_msb_m1_comparator_upper_lower_aeb_w = wire_cmpr3_aeb,
		sticky_quo_msb_m1_comparator_upper_lower_agb_w = wire_cmpr3_agb,
		sticky_quo_msb_m1_comparator_upper_upper_aeb_w = wire_cmpr2_aeb,
		sticky_quo_msb_m1_comparator_upper_upper_agb_w = wire_cmpr2_agb,
		sticky_quo_msb_m2_comparator_lower_ageb_w = wire_cmpr7_ageb,
		sticky_quo_msb_m2_comparator_upper_aeb_w = wire_cmpr6_aeb,
		sticky_quo_msb_m2_comparator_upper_agb_w = wire_cmpr6_agb,
		underflow_zeros_w = {8{1'b0}},
		value_add_1_w = 9'b010000000,
		value_minus_1_w = 9'b001111110,
		value_normal_w = 9'b001111111,
		value_zero_w = {9{1'b0}},
		zero_bit_23_w = {24{1'b0}},
		zero_bit_31_w = {31{1'b0}},
		zero_bit_8_w = {8{1'b0}},
		zero_bit_w = 1'b0,
		zero_dataa_w = (exp_a_zero_w & man_a_zero_w),
		zero_datab_w = (exp_b_zero_w & man_b_zero_w),
		zero_res_w = {sign_exc_bit_w, exp_exc_zeros_w, man_exc_zeros_w},
		zero_w = (((zero_dataa_w & norm_datab_w) | (norm_dataa_w & infi_datab_w)) | (zero_dataa_w & infi_datab_w));
endmodule //fpoint_hw_qsys_div_single
//VALID FILE

//Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module fpoint_hw_qsys (
                        // inputs:
                         clk,
                         clk_en,
                         dataa,
                         datab,
                         n,
                         reset,
                         start,

                        // outputs:
                         done,
                         result
                      )
;

  output           done;
  output  [ 31: 0] result;
  input            clk;
  input            clk_en;
  input   [ 31: 0] dataa;
  input   [ 31: 0] datab;
  input   [  1: 0] n;
  input            reset;
  input            start;

  wire             add_sub;
  wire    [  5: 0] counter_in;
  reg     [  5: 0] counter_out;
  reg     [ 31: 0] dataa_regout;
  reg     [ 31: 0] datab_regout;
  wire             done;
  wire    [  5: 0] load_data;
  wire             local_reset_n;
  wire    [ 31: 0] result;
  wire    [ 31: 0] result_addsub;
  wire    [ 31: 0] result_div;
  wire    [ 31: 0] result_mult;
  //register the input for dataa
  always @(posedge clk or negedge local_reset_n)
    begin
      if (local_reset_n == 0)
          dataa_regout <= 0;
      else if (clk_en)
          dataa_regout <= dataa;
    end


  //register the input for datab
  always @(posedge clk or negedge local_reset_n)
    begin
      if (local_reset_n == 0)
          datab_regout <= 0;
      else if (clk_en)
          datab_regout <= datab;
    end


  fpoint_hw_qsys_mult_single the_fp_mult
    (
      .aclr (reset),
      .clk_en (clk_en),
      .clock (clk),
      .dataa (dataa_regout),
      .datab (datab_regout),
      .result (result_mult)
    );


  fpoint_hw_qsys_addsub_single the_fp_addsub
    (
      .aclr (reset),
      .add_sub (add_sub),
      .clk_en (clk_en),
      .clock (clk),
      .dataa (dataa_regout),
      .datab (datab_regout),
      .result (result_addsub)
    );


  fpoint_hw_qsys_div_single the_fp_div
    (
      .aclr (reset),
      .clk_en (clk_en),
      .clock (clk),
      .dataa (dataa_regout),
      .datab (datab_regout),
      .result (result_div)
    );


  //s1, which is an e_custom_instruction_slave
  //down_counter to signal done
  always @(posedge clk or negedge local_reset_n)
    begin
      if (local_reset_n == 0)
          counter_out <= 6'd33;
      else if (clk_en)
          counter_out <= counter_in;
    end


  //decrement or load the counter based on start
  assign counter_in = (start == 0)? counter_out - 1'b1 :
    load_data;

  assign add_sub = n[0];
  assign local_reset_n = ~reset;
  assign done = clk_en & ~|counter_out & ~start;
  //select load value of counter based on n
  assign load_data = (n == 0)? 10 :
    (n == 1)? 8 :
    (n == 2)? 8 :
    33;

  //multiplex output based on n
  assign result = (n == 0)? result_mult :
    (n == 1)? result_addsub :
    (n == 2)? result_addsub :
    result_div;


endmodule

