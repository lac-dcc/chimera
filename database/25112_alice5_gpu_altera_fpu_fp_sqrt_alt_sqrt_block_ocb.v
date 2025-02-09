// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from fp_sqrt.v
// Created by altera_lib_lpm.pl from fp_sqrt.v
// megafunction wizard: %ALTFP_SQRT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altfp_sqrt

// ============================================================
// File Name: fp_sqrt.v
// Megafunction Name(s):
// 			altfp_sqrt
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 18.1.0 Build 625 09/12/2018 SJ Lite Edition
// ************************************************************


//Copyright (C) 2018  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions
//and other software and tools, and its AMPP partner logic
//functions, and any output files from any of the foregoing
//(including device programming or simulation files), and any
//associated documentation or information are expressly subject
//to the terms and conditions of the Intel Program License
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details.


//altfp_sqrt CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone V" PIPELINE=16 ROUNDING="TO_NEAREST" WIDTH_EXP=8 WIDTH_MAN=23 clk_en clock data result
//VERSION_BEGIN 18.1 cbx_altfp_sqrt 2018:09:12:13:04:09:SJ cbx_cycloneii 2018:09:12:13:04:09:SJ cbx_lpm_add_sub 2018:09:12:13:04:09:SJ cbx_mgl 2018:09:12:14:15:07:SJ cbx_nadder 2018:09:12:13:04:09:SJ cbx_stratix 2018:09:12:13:04:09:SJ cbx_stratixii 2018:09:12:13:04:09:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



//alt_sqrt_block CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone V" PIPELINE=16 WIDTH_SQRT=25 aclr clken clock rad root_result
//VERSION_BEGIN 18.1 cbx_altfp_sqrt 2018:09:12:13:04:09:SJ cbx_cycloneii 2018:09:12:13:04:09:SJ cbx_lpm_add_sub 2018:09:12:13:04:09:SJ cbx_mgl 2018:09:12:14:15:07:SJ cbx_nadder 2018:09:12:13:04:09:SJ cbx_stratix 2018:09:12:13:04:09:SJ cbx_stratixii 2018:09:12:13:04:09:SJ  VERSION_END

//synthesis_resources = lpm_add_sub 25 reg 506
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
/*verilator lint_off CASEX*/
/*verilator lint_off COMBDLY*/
/*verilator lint_off INITIALDLY*/
/*verilator lint_off LITENDIAN*/
/*verilator lint_off MULTIDRIVEN*/
/*verilator lint_off UNOPTFLAT*/
/*verilator lint_off BLKANDNBLK*/
module  fp_sqrt_alt_sqrt_block_ocb
	(
	aclr,
	clken,
	clock,
	rad,
	root_result) ;
	input   aclr;
	input   clken;
	input   clock;
	input   [25:0]  rad;
	output   [24:0]  root_result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	// input wire   aclr; // -- converted tristate to logic
	// input wire   clken; // -- converted tristate to logic
	// input wire   clock; // -- converted tristate to logic
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	q_ff0c;
	reg	[23:0]	q_ff11c;
	reg	[23:0]	q_ff13c;
	reg	[23:0]	q_ff15c;
	reg	[23:0]	q_ff17c;
	reg	[23:0]	q_ff19c;
	reg	[23:0]	q_ff1c;
	reg	[23:0]	q_ff21c;
	reg	[12:0]	q_ff23c;
	reg	[23:0]	q_ff3c;
	reg	[23:0]	q_ff5c;
	reg	[23:0]	q_ff7c;
	reg	[23:0]	q_ff9c;
	reg	[14:0]	rad_ff11c;
	reg	[12:0]	rad_ff13c;
	reg	[14:0]	rad_ff15c;
	reg	[16:0]	rad_ff17c;
	reg	[18:0]	rad_ff19c;
	reg	[24:0]	rad_ff1c;
	reg	[20:0]	rad_ff21c;
	reg	[22:0]	rad_ff23c;
	reg	[22:0]	rad_ff3c;
	reg	[20:0]	rad_ff5c;
	reg	[18:0]	rad_ff7c;
	reg	[16:0]	rad_ff9c;
	wire  [8:0]   wire_add_sub10_result;
	wire  [9:0]   wire_add_sub11_result;
	wire  [10:0]   wire_add_sub12_result;
	wire  [11:0]   wire_add_sub13_result;
	wire  [12:0]   wire_add_sub14_result;
	wire  [13:0]   wire_add_sub15_result;
	wire  [13:0]   wire_add_sub16_result;
	wire  [12:0]   wire_add_sub17_result;
	wire  [13:0]   wire_add_sub18_result;
	wire  [14:0]   wire_add_sub19_result;
	wire  [15:0]   wire_add_sub20_result;
	wire  [16:0]   wire_add_sub21_result;
	wire  [17:0]   wire_add_sub22_result;
	wire  [18:0]   wire_add_sub23_result;
	wire  [19:0]   wire_add_sub24_result;
	wire  [20:0]   wire_add_sub25_result;
	wire  [21:0]   wire_add_sub26_result;
	wire  [22:0]   wire_add_sub27_result;
	wire  [23:0]   wire_add_sub28_result;
	wire  [2:0]   wire_add_sub4_result;
	wire  [3:0]   wire_add_sub5_result;
	wire  [4:0]   wire_add_sub6_result;
	wire  [5:0]   wire_add_sub7_result;
	wire  [6:0]   wire_add_sub8_result;
	wire  [7:0]   wire_add_sub9_result;
	wire  [26:0]  addnode_w0c;
	wire  [26:0]  addnode_w10c;
	wire  [26:0]  addnode_w11c;
	wire  [26:0]  addnode_w12c;
	wire  [26:0]  addnode_w13c;
	wire  [26:0]  addnode_w14c;
	wire  [26:0]  addnode_w15c;
	wire  [26:0]  addnode_w16c;
	wire  [26:0]  addnode_w17c;
	wire  [26:0]  addnode_w18c;
	wire  [26:0]  addnode_w19c;
	wire  [26:0]  addnode_w1c;
	wire  [26:0]  addnode_w20c;
	wire  [26:0]  addnode_w21c;
	wire  [26:0]  addnode_w22c;
	wire  [26:0]  addnode_w23c;
	wire  [26:0]  addnode_w24c;
	wire  [26:0]  addnode_w2c;
	wire  [26:0]  addnode_w3c;
	wire  [26:0]  addnode_w4c;
	wire  [26:0]  addnode_w5c;
	wire  [26:0]  addnode_w6c;
	wire  [26:0]  addnode_w7c;
	wire  [26:0]  addnode_w8c;
	wire  [26:0]  addnode_w9c;
	wire  [2:0]  qlevel_w0c;
	wire  [12:0]  qlevel_w10c;
	wire  [13:0]  qlevel_w11c;
	wire  [14:0]  qlevel_w12c;
	wire  [15:0]  qlevel_w13c;
	wire  [16:0]  qlevel_w14c;
	wire  [17:0]  qlevel_w15c;
	wire  [18:0]  qlevel_w16c;
	wire  [19:0]  qlevel_w17c;
	wire  [20:0]  qlevel_w18c;
	wire  [21:0]  qlevel_w19c;
	wire  [3:0]  qlevel_w1c;
	wire  [22:0]  qlevel_w20c;
	wire  [23:0]  qlevel_w21c;
	wire  [24:0]  qlevel_w22c;
	wire  [25:0]  qlevel_w23c;
	wire  [26:0]  qlevel_w24c;
	wire  [4:0]  qlevel_w2c;
	wire  [5:0]  qlevel_w3c;
	wire  [6:0]  qlevel_w4c;
	wire  [7:0]  qlevel_w5c;
	wire  [8:0]  qlevel_w6c;
	wire  [9:0]  qlevel_w7c;
	wire  [10:0]  qlevel_w8c;
	wire  [11:0]  qlevel_w9c;
	wire  [26:0]  slevel_w0c;
	wire  [26:0]  slevel_w10c;
	wire  [26:0]  slevel_w11c;
	wire  [26:0]  slevel_w12c;
	wire  [26:0]  slevel_w13c;
	wire  [26:0]  slevel_w14c;
	wire  [26:0]  slevel_w15c;
	wire  [26:0]  slevel_w16c;
	wire  [26:0]  slevel_w17c;
	wire  [26:0]  slevel_w18c;
	wire  [26:0]  slevel_w19c;
	wire  [26:0]  slevel_w1c;
	wire  [26:0]  slevel_w20c;
	wire  [26:0]  slevel_w21c;
	wire  [26:0]  slevel_w22c;
	wire  [26:0]  slevel_w23c;
	wire  [26:0]  slevel_w24c;
	wire  [26:0]  slevel_w2c;
	wire  [26:0]  slevel_w3c;
	wire  [26:0]  slevel_w4c;
	wire  [26:0]  slevel_w5c;
	wire  [26:0]  slevel_w6c;
	wire  [26:0]  slevel_w7c;
	wire  [26:0]  slevel_w8c;
	wire  [26:0]  slevel_w9c;

	// synopsys translate_off
	initial
		q_ff0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff0c <= 1'b0;
		else if  (clken == 1'b1)   q_ff0c <= {(~ addnode_w24c[26])};
	// synopsys translate_off
	initial
		q_ff11c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff11c <= 24'b0;
		else if  (clken == 1'b1)   q_ff11c <= {q_ff11c[21:0], (~ addnode_w12c[26]), (~ addnode_w13c[26])};
	// synopsys translate_off
	initial
		q_ff13c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff13c <= 24'b0;
		else if  (clken == 1'b1)   q_ff13c <= {q_ff13c[21:0], (~ addnode_w10c[26]), (~ addnode_w11c[26])};
	// synopsys translate_off
	initial
		q_ff15c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff15c <= 24'b0;
		else if  (clken == 1'b1)   q_ff15c <= {q_ff15c[21:0], (~ addnode_w8c[26]), (~ addnode_w9c[26])};
	// synopsys translate_off
	initial
		q_ff17c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff17c <= 24'b0;
		else if  (clken == 1'b1)   q_ff17c <= {q_ff17c[21:0], (~ addnode_w6c[26]), (~ addnode_w7c[26])};
	// synopsys translate_off
	initial
		q_ff19c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff19c <= 24'b0;
		else if  (clken == 1'b1)   q_ff19c <= {q_ff19c[21:0], (~ addnode_w4c[26]), (~ addnode_w5c[26])};
	// synopsys translate_off
	initial
		q_ff1c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff1c <= 24'b0;
		else if  (clken == 1'b1)   q_ff1c <= {q_ff1c[21:0], (~ addnode_w22c[26]), (~ addnode_w23c[26])};
	// synopsys translate_off
	initial
		q_ff21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff21c <= 24'b0;
		else if  (clken == 1'b1)   q_ff21c <= {q_ff21c[21:0], (~ addnode_w2c[26]), (~ addnode_w3c[26])};
	// synopsys translate_off
	initial
		q_ff23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff23c <= 13'b0;
		else if  (clken == 1'b1)   q_ff23c <= {q_ff23c[11:0], (~ addnode_w1c[26])};
	// synopsys translate_off
	initial
		q_ff3c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff3c <= 24'b0;
		else if  (clken == 1'b1)   q_ff3c <= {q_ff3c[21:0], (~ addnode_w20c[26]), (~ addnode_w21c[26])};
	// synopsys translate_off
	initial
		q_ff5c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff5c <= 24'b0;
		else if  (clken == 1'b1)   q_ff5c <= {q_ff5c[21:0], (~ addnode_w18c[26]), (~ addnode_w19c[26])};
	// synopsys translate_off
	initial
		q_ff7c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff7c <= 24'b0;
		else if  (clken == 1'b1)   q_ff7c <= {q_ff7c[21:0], (~ addnode_w16c[26]), (~ addnode_w17c[26])};
	// synopsys translate_off
	initial
		q_ff9c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) q_ff9c <= 24'b0;
		else if  (clken == 1'b1)   q_ff9c <= {q_ff9c[21:0], (~ addnode_w14c[26]), (~ addnode_w15c[26])};
	// synopsys translate_off
	initial
		rad_ff11c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff11c <= 15'b0;
		else if  (clken == 1'b1)   rad_ff11c <= addnode_w11c[26:12];
	// synopsys translate_off
	initial
		rad_ff13c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff13c <= 13'b0;
		else if  (clken == 1'b1)   rad_ff13c <= addnode_w13c[26:14];
	// synopsys translate_off
	initial
		rad_ff15c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff15c <= 15'b0;
		else if  (clken == 1'b1)   rad_ff15c <= addnode_w15c[26:12];
	// synopsys translate_off
	initial
		rad_ff17c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff17c <= 17'b0;
		else if  (clken == 1'b1)   rad_ff17c <= addnode_w17c[26:10];
	// synopsys translate_off
	initial
		rad_ff19c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff19c <= 19'b0;
		else if  (clken == 1'b1)   rad_ff19c <= addnode_w19c[26:8];
	// synopsys translate_off
	initial
		rad_ff1c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff1c <= 25'b0;
		else if  (clken == 1'b1)   rad_ff1c <= addnode_w1c[26:2];
	// synopsys translate_off
	initial
		rad_ff21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff21c <= 21'b0;
		else if  (clken == 1'b1)   rad_ff21c <= addnode_w21c[26:6];
	// synopsys translate_off
	initial
		rad_ff23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff23c <= 23'b0;
		else if  (clken == 1'b1)   rad_ff23c <= addnode_w23c[26:4];
	// synopsys translate_off
	initial
		rad_ff3c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff3c <= 23'b0;
		else if  (clken == 1'b1)   rad_ff3c <= addnode_w3c[26:4];
	// synopsys translate_off
	initial
		rad_ff5c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff5c <= 21'b0;
		else if  (clken == 1'b1)   rad_ff5c <= addnode_w5c[26:6];
	// synopsys translate_off
	initial
		rad_ff7c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff7c <= 19'b0;
		else if  (clken == 1'b1)   rad_ff7c <= addnode_w7c[26:8];
	// synopsys translate_off
	initial
		rad_ff9c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rad_ff9c <= 17'b0;
		else if  (clken == 1'b1)   rad_ff9c <= addnode_w9c[26:10];
	lpm_add_sub   add_sub10
	(
	.cout(),
	.dataa({slevel_w6c[26:18]}),
	.datab({(({7{(~ rad_ff5c[20])}} & (~ qlevel_w6c[8:2])) | ({7{rad_ff5c[20]}} & qlevel_w6c[8:2])), qlevel_w6c[1:0]}),
	.overflow(),
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
		add_sub10.lpm_pipeline = 0,
		add_sub10.lpm_width = 9,
		add_sub10.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub11
	(
	.cout(),
	.dataa({slevel_w7c[26:17]}),
	.datab({(({8{(~ addnode_w6c[26])}} & (~ qlevel_w7c[9:2])) | ({8{addnode_w6c[26]}} & qlevel_w7c[9:2])), qlevel_w7c[1:0]}),
	.overflow(),
	.result(wire_add_sub11_result)
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
		add_sub11.lpm_direction = "ADD",
		add_sub11.lpm_pipeline = 0,
		add_sub11.lpm_width = 10,
		add_sub11.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub12
	(
	.cout(),
	.dataa({slevel_w8c[26:16]}),
	.datab({(({9{(~ rad_ff7c[18])}} & (~ qlevel_w8c[10:2])) | ({9{rad_ff7c[18]}} & qlevel_w8c[10:2])), qlevel_w8c[1:0]}),
	.overflow(),
	.result(wire_add_sub12_result)
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
		add_sub12.lpm_direction = "ADD",
		add_sub12.lpm_pipeline = 0,
		add_sub12.lpm_width = 11,
		add_sub12.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub13
	(
	.cout(),
	.dataa({slevel_w9c[26:15]}),
	.datab({(({10{(~ addnode_w8c[26])}} & (~ qlevel_w9c[11:2])) | ({10{addnode_w8c[26]}} & qlevel_w9c[11:2])), qlevel_w9c[1:0]}),
	.overflow(),
	.result(wire_add_sub13_result)
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
		add_sub13.lpm_direction = "ADD",
		add_sub13.lpm_pipeline = 0,
		add_sub13.lpm_width = 12,
		add_sub13.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub14
	(
	.cout(),
	.dataa({slevel_w10c[26:14]}),
	.datab({(({11{(~ rad_ff9c[16])}} & (~ qlevel_w10c[12:2])) | ({11{rad_ff9c[16]}} & qlevel_w10c[12:2])), qlevel_w10c[1:0]}),
	.overflow(),
	.result(wire_add_sub14_result)
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
		add_sub14.lpm_direction = "ADD",
		add_sub14.lpm_pipeline = 0,
		add_sub14.lpm_width = 13,
		add_sub14.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub15
	(
	.cout(),
	.dataa({slevel_w11c[26:13]}),
	.datab({(({12{(~ addnode_w10c[26])}} & (~ qlevel_w11c[13:2])) | ({12{addnode_w10c[26]}} & qlevel_w11c[13:2])), qlevel_w11c[1:0]}),
	.overflow(),
	.result(wire_add_sub15_result)
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
		add_sub15.lpm_direction = "ADD",
		add_sub15.lpm_pipeline = 0,
		add_sub15.lpm_width = 14,
		add_sub15.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub16
	(
	.cout(),
	.dataa({slevel_w12c[26:13]}),
	.datab({(({13{(~ rad_ff11c[14])}} & (~ qlevel_w12c[14:2])) | ({13{rad_ff11c[14]}} & qlevel_w12c[14:2])), qlevel_w12c[1]}),
	.overflow(),
	.result(wire_add_sub16_result)
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
		add_sub16.lpm_direction = "ADD",
		add_sub16.lpm_pipeline = 0,
		add_sub16.lpm_width = 14,
		add_sub16.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub17
	(
	.cout(),
	.dataa({slevel_w13c[26:14]}),
	.datab({(({13{(~ addnode_w12c[26])}} & (~ qlevel_w13c[15:3])) | ({13{addnode_w12c[26]}} & qlevel_w13c[15:3]))}),
	.overflow(),
	.result(wire_add_sub17_result)
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
		add_sub17.lpm_direction = "ADD",
		add_sub17.lpm_pipeline = 0,
		add_sub17.lpm_width = 13,
		add_sub17.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub18
	(
	.cout(),
	.dataa({slevel_w14c[26:13]}),
	.datab({(({14{(~ rad_ff13c[12])}} & (~ qlevel_w14c[16:3])) | ({14{rad_ff13c[12]}} & qlevel_w14c[16:3]))}),
	.overflow(),
	.result(wire_add_sub18_result)
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
		add_sub18.lpm_direction = "ADD",
		add_sub18.lpm_pipeline = 0,
		add_sub18.lpm_width = 14,
		add_sub18.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub19
	(
	.cout(),
	.dataa({slevel_w15c[26:12]}),
	.datab({(({15{(~ addnode_w14c[26])}} & (~ qlevel_w15c[17:3])) | ({15{addnode_w14c[26]}} & qlevel_w15c[17:3]))}),
	.overflow(),
	.result(wire_add_sub19_result)
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
		add_sub19.lpm_direction = "ADD",
		add_sub19.lpm_pipeline = 0,
		add_sub19.lpm_width = 15,
		add_sub19.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub20
	(
	.cout(),
	.dataa({slevel_w16c[26:11]}),
	.datab({(({16{(~ rad_ff15c[14])}} & (~ qlevel_w16c[18:3])) | ({16{rad_ff15c[14]}} & qlevel_w16c[18:3]))}),
	.overflow(),
	.result(wire_add_sub20_result)
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
		add_sub20.lpm_direction = "ADD",
		add_sub20.lpm_pipeline = 0,
		add_sub20.lpm_width = 16,
		add_sub20.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub21
	(
	.cout(),
	.dataa({slevel_w17c[26:10]}),
	.datab({(({17{(~ addnode_w16c[26])}} & (~ qlevel_w17c[19:3])) | ({17{addnode_w16c[26]}} & qlevel_w17c[19:3]))}),
	.overflow(),
	.result(wire_add_sub21_result)
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
		add_sub21.lpm_direction = "ADD",
		add_sub21.lpm_pipeline = 0,
		add_sub21.lpm_width = 17,
		add_sub21.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub22
	(
	.cout(),
	.dataa({slevel_w18c[26:9]}),
	.datab({(({18{(~ rad_ff17c[16])}} & (~ qlevel_w18c[20:3])) | ({18{rad_ff17c[16]}} & qlevel_w18c[20:3]))}),
	.overflow(),
	.result(wire_add_sub22_result)
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
		add_sub22.lpm_direction = "ADD",
		add_sub22.lpm_pipeline = 0,
		add_sub22.lpm_width = 18,
		add_sub22.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub23
	(
	.cout(),
	.dataa({slevel_w19c[26:8]}),
	.datab({(({19{(~ addnode_w18c[26])}} & (~ qlevel_w19c[21:3])) | ({19{addnode_w18c[26]}} & qlevel_w19c[21:3]))}),
	.overflow(),
	.result(wire_add_sub23_result)
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
		add_sub23.lpm_direction = "ADD",
		add_sub23.lpm_pipeline = 0,
		add_sub23.lpm_width = 19,
		add_sub23.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub24
	(
	.cout(),
	.dataa({slevel_w20c[26:7]}),
	.datab({(({20{(~ rad_ff19c[18])}} & (~ qlevel_w20c[22:3])) | ({20{rad_ff19c[18]}} & qlevel_w20c[22:3]))}),
	.overflow(),
	.result(wire_add_sub24_result)
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
		add_sub24.lpm_direction = "ADD",
		add_sub24.lpm_pipeline = 0,
		add_sub24.lpm_width = 20,
		add_sub24.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub25
	(
	.cout(),
	.dataa({slevel_w21c[26:6]}),
	.datab({(({21{(~ addnode_w20c[26])}} & (~ qlevel_w21c[23:3])) | ({21{addnode_w20c[26]}} & qlevel_w21c[23:3]))}),
	.overflow(),
	.result(wire_add_sub25_result)
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
		add_sub25.lpm_direction = "ADD",
		add_sub25.lpm_pipeline = 0,
		add_sub25.lpm_width = 21,
		add_sub25.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub26
	(
	.cout(),
	.dataa({slevel_w22c[26:5]}),
	.datab({(({22{(~ rad_ff21c[20])}} & (~ qlevel_w22c[24:3])) | ({22{rad_ff21c[20]}} & qlevel_w22c[24:3]))}),
	.overflow(),
	.result(wire_add_sub26_result)
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
		add_sub26.lpm_direction = "ADD",
		add_sub26.lpm_pipeline = 0,
		add_sub26.lpm_width = 22,
		add_sub26.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub27
	(
	.cout(),
	.dataa({slevel_w23c[26:4]}),
	.datab({(({23{(~ addnode_w22c[26])}} & (~ qlevel_w23c[25:3])) | ({23{addnode_w22c[26]}} & qlevel_w23c[25:3]))}),
	.overflow(),
	.result(wire_add_sub27_result)
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
		add_sub27.lpm_direction = "ADD",
		add_sub27.lpm_pipeline = 0,
		add_sub27.lpm_width = 23,
		add_sub27.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub28
	(
	.cout(),
	.dataa({slevel_w24c[26:3]}),
	.datab({qlevel_w24c[26:25], (({22{(~ rad_ff23c[22])}} & (~ qlevel_w24c[24:3])) | ({22{rad_ff23c[22]}} & qlevel_w24c[24:3]))}),
	.overflow(),
	.result(wire_add_sub28_result)
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
		add_sub28.lpm_direction = "ADD",
		add_sub28.lpm_pipeline = 0,
		add_sub28.lpm_width = 24,
		add_sub28.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub4
	(
	.cout(),
	.dataa({slevel_w0c[26:24]}),
	.datab({qlevel_w0c[2:0]}),
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
		add_sub4.lpm_pipeline = 0,
		add_sub4.lpm_width = 3,
		add_sub4.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub5
	(
	.cout(),
	.dataa({slevel_w1c[26:23]}),
	.datab({qlevel_w1c[3:0]}),
	.overflow(),
	.result(wire_add_sub5_result)
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
		add_sub5.lpm_direction = "ADD",
		add_sub5.lpm_pipeline = 0,
		add_sub5.lpm_width = 4,
		add_sub5.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub6
	(
	.cout(),
	.dataa({slevel_w2c[26:22]}),
	.datab({(({3{(~ rad_ff1c[24])}} & (~ qlevel_w2c[4:2])) | ({3{rad_ff1c[24]}} & qlevel_w2c[4:2])), qlevel_w2c[1:0]}),
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
		add_sub6.lpm_pipeline = 0,
		add_sub6.lpm_width = 5,
		add_sub6.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub7
	(
	.cout(),
	.dataa({slevel_w3c[26:21]}),
	.datab({(({4{(~ addnode_w2c[26])}} & (~ qlevel_w3c[5:2])) | ({4{addnode_w2c[26]}} & qlevel_w3c[5:2])), qlevel_w3c[1:0]}),
	.overflow(),
	.result(wire_add_sub7_result)
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
		add_sub7.lpm_direction = "ADD",
		add_sub7.lpm_pipeline = 0,
		add_sub7.lpm_width = 6,
		add_sub7.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub8
	(
	.cout(),
	.dataa({slevel_w4c[26:20]}),
	.datab({(({5{(~ rad_ff3c[22])}} & (~ qlevel_w4c[6:2])) | ({5{rad_ff3c[22]}} & qlevel_w4c[6:2])), qlevel_w4c[1:0]}),
	.overflow(),
	.result(wire_add_sub8_result)
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
		add_sub8.lpm_direction = "ADD",
		add_sub8.lpm_pipeline = 0,
		add_sub8.lpm_width = 7,
		add_sub8.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub9
	(
	.cout(),
	.dataa({slevel_w5c[26:19]}),
	.datab({(({6{(~ addnode_w4c[26])}} & (~ qlevel_w5c[7:2])) | ({6{addnode_w4c[26]}} & qlevel_w5c[7:2])), qlevel_w5c[1:0]}),
	.overflow(),
	.result(wire_add_sub9_result)
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
		add_sub9.lpm_direction = "ADD",
		add_sub9.lpm_pipeline = 0,
		add_sub9.lpm_width = 8,
		add_sub9.lpm_type = "lpm_add_sub";
	assign
		addnode_w0c = {wire_add_sub4_result[2:0], slevel_w0c[23:0]},
		addnode_w10c = {wire_add_sub14_result[12:0], slevel_w10c[13:0]},
		addnode_w11c = {wire_add_sub15_result[13:0], slevel_w11c[12:0]},
		addnode_w12c = {wire_add_sub16_result[13:0], qlevel_w12c[0], slevel_w12c[11:0]},
		addnode_w13c = {wire_add_sub17_result[12:0], 1'b1, qlevel_w13c[1:0], slevel_w13c[10:0]},
		addnode_w14c = {wire_add_sub18_result[13:0], 1'b1, qlevel_w14c[1:0], slevel_w14c[9:0]},
		addnode_w15c = {wire_add_sub19_result[14:0], 1'b1, qlevel_w15c[1:0], slevel_w15c[8:0]},
		addnode_w16c = {wire_add_sub20_result[15:0], 1'b1, qlevel_w16c[1:0], slevel_w16c[7:0]},
		addnode_w17c = {wire_add_sub21_result[16:0], 1'b1, qlevel_w17c[1:0], slevel_w17c[6:0]},
		addnode_w18c = {wire_add_sub22_result[17:0], 1'b1, qlevel_w18c[1:0], slevel_w18c[5:0]},
		addnode_w19c = {wire_add_sub23_result[18:0], 1'b1, qlevel_w19c[1:0], slevel_w19c[4:0]},
		addnode_w1c = {wire_add_sub5_result[3:0], slevel_w1c[22:0]},
		addnode_w20c = {wire_add_sub24_result[19:0], 1'b1, qlevel_w20c[1:0], slevel_w20c[3:0]},
		addnode_w21c = {wire_add_sub25_result[20:0], 1'b1, qlevel_w21c[1:0], slevel_w21c[2:0]},
		addnode_w22c = {wire_add_sub26_result[21:0], 1'b1, qlevel_w22c[1:0], slevel_w22c[1:0]},
		addnode_w23c = {wire_add_sub27_result[22:0], 1'b1, qlevel_w23c[1:0], slevel_w23c[0]},
		addnode_w24c = {wire_add_sub28_result[23:0], 1'b1, qlevel_w24c[1:0]},
		addnode_w2c = {wire_add_sub6_result[4:0], slevel_w2c[21:0]},
		addnode_w3c = {wire_add_sub7_result[5:0], slevel_w3c[20:0]},
		addnode_w4c = {wire_add_sub8_result[6:0], slevel_w4c[19:0]},
		addnode_w5c = {wire_add_sub9_result[7:0], slevel_w5c[18:0]},
		addnode_w6c = {wire_add_sub10_result[8:0], slevel_w6c[17:0]},
		addnode_w7c = {wire_add_sub11_result[9:0], slevel_w7c[16:0]},
		addnode_w8c = {wire_add_sub12_result[10:0], slevel_w8c[15:0]},
		addnode_w9c = {wire_add_sub13_result[11:0], slevel_w9c[14:0]},
		qlevel_w0c = {3{1'b1}},
		qlevel_w10c = {1'b0, 1'b1, q_ff23c[4], q_ff21c[7:6], q_ff19c[5:4], q_ff17c[3:2], q_ff15c[1:0], {2{1'b1}}},
		qlevel_w11c = {1'b0, 1'b1, q_ff23c[4], q_ff21c[7:6], q_ff19c[5:4], q_ff17c[3:2], q_ff15c[1:0], (~ addnode_w10c[26]), {2{1'b1}}},
		qlevel_w12c = {1'b0, 1'b1, q_ff23c[5], q_ff21c[9:8], q_ff19c[7:6], q_ff17c[5:4], q_ff15c[3:2], q_ff13c[1:0], {2{1'b1}}},
		qlevel_w13c = {1'b0, 1'b1, q_ff23c[5], q_ff21c[9:8], q_ff19c[7:6], q_ff17c[5:4], q_ff15c[3:2], q_ff13c[1:0], (~ addnode_w12c[26]), {2{1'b1}}},
		qlevel_w14c = {1'b0, 1'b1, q_ff23c[6], q_ff21c[11:10], q_ff19c[9:8], q_ff17c[7:6], q_ff15c[5:4], q_ff13c[3:2], q_ff11c[1:0], {2{1'b1}}},
		qlevel_w15c = {1'b0, 1'b1, q_ff23c[6], q_ff21c[11:10], q_ff19c[9:8], q_ff17c[7:6], q_ff15c[5:4], q_ff13c[3:2], q_ff11c[1:0], (~ addnode_w14c[26]), {2{1'b1}}},
		qlevel_w16c = {1'b0, 1'b1, q_ff23c[7], q_ff21c[13:12], q_ff19c[11:10], q_ff17c[9:8], q_ff15c[7:6], q_ff13c[5:4], q_ff11c[3:2], q_ff9c[1:0], {2{1'b1}}},
		qlevel_w17c = {1'b0, 1'b1, q_ff23c[7], q_ff21c[13:12], q_ff19c[11:10], q_ff17c[9:8], q_ff15c[7:6], q_ff13c[5:4], q_ff11c[3:2], q_ff9c[1:0], (~ addnode_w16c[26]), {2{1'b1}}},
		qlevel_w18c = {1'b0, 1'b1, q_ff23c[8], q_ff21c[15:14], q_ff19c[13:12], q_ff17c[11:10], q_ff15c[9:8], q_ff13c[7:6], q_ff11c[5:4], q_ff9c[3:2], q_ff7c[1:0], {2{1'b1}}},
		qlevel_w19c = {1'b0, 1'b1, q_ff23c[8], q_ff21c[15:14], q_ff19c[13:12], q_ff17c[11:10], q_ff15c[9:8], q_ff13c[7:6], q_ff11c[5:4], q_ff9c[3:2], q_ff7c[1:0], (~ addnode_w18c[26]), {2{1'b1}}},
		qlevel_w1c = {1'b1, 1'b0, {2{1'b1}}},
		qlevel_w20c = {1'b0, 1'b1, q_ff23c[9], q_ff21c[17:16], q_ff19c[15:14], q_ff17c[13:12], q_ff15c[11:10], q_ff13c[9:8], q_ff11c[7:6], q_ff9c[5:4], q_ff7c[3:2], q_ff5c[1:0], {2{1'b1}}},
		qlevel_w21c = {1'b0, 1'b1, q_ff23c[9], q_ff21c[17:16], q_ff19c[15:14], q_ff17c[13:12], q_ff15c[11:10], q_ff13c[9:8], q_ff11c[7:6], q_ff9c[5:4], q_ff7c[3:2], q_ff5c[1:0], (~ addnode_w20c[26]), {2{1'b1}}},
		qlevel_w22c = {1'b0, 1'b1, q_ff23c[10], q_ff21c[19:18], q_ff19c[17:16], q_ff17c[15:14], q_ff15c[13:12], q_ff13c[11:10], q_ff11c[9:8], q_ff9c[7:6], q_ff7c[5:4], q_ff5c[3:2], q_ff3c[1:0], {2{1'b1}}},
		qlevel_w23c = {1'b0, 1'b1, q_ff23c[10], q_ff21c[19:18], q_ff19c[17:16], q_ff17c[15:14], q_ff15c[13:12], q_ff13c[11:10], q_ff11c[9:8], q_ff9c[7:6], q_ff7c[5:4], q_ff5c[3:2], q_ff3c[1:0], (~ addnode_w22c[26]), {2{1'b1}}},
		qlevel_w24c = {(~ rad_ff23c[22]), rad_ff23c[22], q_ff23c[11], q_ff21c[21:20], q_ff19c[19:18], q_ff17c[17:16], q_ff15c[15:14], q_ff13c[13:12], q_ff11c[11:10], q_ff9c[9:8], q_ff7c[7:6], q_ff5c[5:4], q_ff3c[3:2], q_ff1c[1:0], {2{1'b1}}},
		qlevel_w2c = {1'b0, 1'b1, q_ff23c[0], {2{1'b1}}},
		qlevel_w3c = {1'b0, 1'b1, q_ff23c[0], (~ addnode_w2c[26]), {2{1'b1}}},
		qlevel_w4c = {1'b0, 1'b1, q_ff23c[1], q_ff21c[1:0], {2{1'b1}}},
		qlevel_w5c = {1'b0, 1'b1, q_ff23c[1], q_ff21c[1:0], (~ addnode_w4c[26]), {2{1'b1}}},
		qlevel_w6c = {1'b0, 1'b1, q_ff23c[2], q_ff21c[3:2], q_ff19c[1:0], {2{1'b1}}},
		qlevel_w7c = {1'b0, 1'b1, q_ff23c[2], q_ff21c[3:2], q_ff19c[1:0], (~ addnode_w6c[26]), {2{1'b1}}},
		qlevel_w8c = {1'b0, 1'b1, q_ff23c[3], q_ff21c[5:4], q_ff19c[3:2], q_ff17c[1:0], {2{1'b1}}},
		qlevel_w9c = {1'b0, 1'b1, q_ff23c[3], q_ff21c[5:4], q_ff19c[3:2], q_ff17c[1:0], (~ addnode_w8c[26]), {2{1'b1}}},
		root_result = {1'b1, q_ff23c[12], q_ff21c[23:22], q_ff19c[21:20], q_ff17c[19:18], q_ff15c[17:16], q_ff13c[15:14], q_ff11c[13:12], q_ff9c[11:10], q_ff7c[9:8], q_ff5c[7:6], q_ff3c[5:4], q_ff1c[3:2], q_ff0c[0]},
		slevel_w0c = {1'b0, rad},
		slevel_w10c = {rad_ff9c[15:0], {11{1'b0}}},
		slevel_w11c = {addnode_w10c[25:11], {12{1'b0}}},
		slevel_w12c = {rad_ff11c[13:0], {13{1'b0}}},
		slevel_w13c = {addnode_w12c[25:13], 1'b1, {13{1'b0}}},
		slevel_w14c = {rad_ff13c[11:0], {3{1'b1}}, {12{1'b0}}},
		slevel_w15c = {addnode_w14c[25:13], {3{1'b1}}, {11{1'b0}}},
		slevel_w16c = {rad_ff15c[13:0], {3{1'b1}}, {10{1'b0}}},
		slevel_w17c = {addnode_w16c[25:11], {3{1'b1}}, {9{1'b0}}},
		slevel_w18c = {rad_ff17c[15:0], {3{1'b1}}, {8{1'b0}}},
		slevel_w19c = {addnode_w18c[25:9], {3{1'b1}}, {7{1'b0}}},
		slevel_w1c = {addnode_w0c[25:1], {2{1'b0}}},
		slevel_w20c = {rad_ff19c[17:0], {3{1'b1}}, {6{1'b0}}},
		slevel_w21c = {addnode_w20c[25:7], {3{1'b1}}, {5{1'b0}}},
		slevel_w22c = {rad_ff21c[19:0], {3{1'b1}}, {4{1'b0}}},
		slevel_w23c = {addnode_w22c[25:5], {3{1'b1}}, {3{1'b0}}},
		slevel_w24c = {rad_ff23c[21:0], {3{1'b1}}, {2{1'b0}}},
		slevel_w2c = {rad_ff1c[23:0], {3{1'b0}}},
		slevel_w3c = {addnode_w2c[25:3], {4{1'b0}}},
		slevel_w4c = {rad_ff3c[21:0], {5{1'b0}}},
		slevel_w5c = {addnode_w4c[25:5], {6{1'b0}}},
		slevel_w6c = {rad_ff5c[19:0], {7{1'b0}}},
		slevel_w7c = {addnode_w6c[25:7], {8{1'b0}}},
		slevel_w8c = {rad_ff7c[17:0], {9{1'b0}}},
		slevel_w9c = {addnode_w8c[25:9], {10{1'b0}}};
endmodule //fp_sqrt_alt_sqrt_block_ocb

