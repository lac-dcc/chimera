// This program was cloned from: https://github.com/maxluppe/tt06_maxluppe_alfsr
// License: Apache License 2.0

// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Thu Apr 18 15:51:22 2024"

module alfsr(
	clk,		//Digitalization clock
	rst_n,		//LFSR Configurator reset
	lfsr_clk,	//LFSR Configurator clock
	alfsr_rst_n,//ALFSR reset
	lfsr_out,	//LFSR Configuratior output
	rng_out_d,	//ALFSR 'digitalized' output
	rng_out		//ALFSR 'analog' outputs
);

input wire	clk;
input wire	rst_n;
input wire	lfsr_clk;
input wire	alfsr_rst_n;
output wire	lfsr_out;
output wire	rng_out_d;
output wire	[3:0] rng_out;

wire	nx1;
wire	nx10;
wire	nx100;
wire	nx114;
wire	nx128;
wire	nx142;
wire	nx156;
wire	nx157;
wire	nx161;
wire	nx163;
wire	nx164;
wire	nx165;
wire	nx20;
wire	nx22;
wire	nx23;
wire	nx24;
wire	nx25;
wire	nx27;
wire	nx28;
wire	nx29;
wire	nx31;
wire	nx32;
wire	nx33;
wire	nx34;
wire	nx6;
wire	nx_clk;
wire	nx_clk_dff;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_3;


buf02	b2v_insta4(
	.A(nx156),
	.Y(nx165));
buf04	b2v_insta5(
	.A(nx165),
	.Y(rng_out[0]));

buf02	b2v_insta2(
	.A(nx142),
	.Y(nx164));
buf04	b2v_insta3(
	.A(nx164),
	.Y(rng_out[1]));

buf02	b2v_insta0(
	.A(nx128),
	.Y(nx163));
buf04	b2v_insta1(
	.A(nx163),
	.Y(rng_out[2]));

buf02	b2v_inst12(
	.A(nx114),
	.Y(nx161));
buf04	b2v_inst5(
	.A(nx161),
	.Y(rng_out[3]));

//buf02	b2v_inst13(
//	.A(SYNTHESIZED_WIRE_4),
//	.Y(nx162));
//buf04	b2v_inst6(
//	.A(nx162),
//	.Y(rng_out[4]));

buf02	b2v_ix203(
	.A(clk),
	.Y(nx_clk_dff));
dff1	b2v_reg_rng_ff(
	.CLK(nx_clk_dff),
	.D(nx161),
	.Q(nx157)
	);
buf02	b2v_ix204(
	.A(nx157),
	.Y(SYNTHESIZED_WIRE_3));
buf04	b2v_ix200(
	.A(SYNTHESIZED_WIRE_3),
	.Y(rng_out_d));

xnor2	b2v_ix0(
	.A0(nx142),
	.A1(nx156),
	.Y(nx100));

assign	SYNTHESIZED_WIRE_4 = nx100 & alfsr_rst_n;

delay_line delay_line_3 (
	.line_in(SYNTHESIZED_WIRE_4),	//Delay Line input
	.s0(nx20),			//Delay Line selection input s0
	.s1(nx22),			//Delay Line selection input s1
	.s2(nx23),			//Delay Line selection input s2
	.line_out(nx114));	//Delay Line output

delay_line delay_line_2 (
	.line_in(nx114),	//Delay Line input
	.s0(nx24),			//Delay Line selection input s0
	.s1(nx25),			//Delay Line selection input s1
	.s2(nx27),			//Delay Line selection input s2
	.line_out(nx128));	//Delay Line output

delay_line delay_line_1 (
	.line_in(nx128),	//Delay Line input
	.s0(nx28),			//Delay Line selection input s0
	.s1(nx29),			//Delay Line selection input s1
	.s2(nx31),			//Delay Line selection input s2
	.line_out(nx142));	//Delay Line output

delay_line delay_line_0 (
	.line_in(nx142),	//Delay Line input
	.s0(nx32),			//Delay Line selection input s0
	.s1(nx33),			//Delay Line selection input s1
	.s2(nx34),			//Delay Line selection input s2
	.line_out(nx156));	//Delay Line output

xor2	b2v_ix5(
	.A0(nx29),
	.A1(nx33),
	.Y(nx6));
xor2	b2v_ix1(
	.A0(nx22),
	.A1(nx20),
	.Y(nx1));
xnor2	b2v_ix2(
	.A0(nx6),
	.A1(nx1),
	.Y(nx10));

buf02	b2v_ix205(
	.A(lfsr_clk),
	.Y(nx_clk));
dffs_ni	b2v_reg_lfsr_0(
	.CLK(nx_clk),
	.D(nx10),
	.S(rst_n),
	.Q(nx20)
	);
dffr	b2v_reg_lfsr_1(
	.CLK(nx_clk),
	.D(nx20),
	.R(rst_n),
	.Q(nx24)
	);
dffr	b2v_reg_lfsr_2(
	.CLK(nx_clk),
	.D(nx24),
	.R(rst_n),
	.Q(nx28)
	);
dffr	b2v_reg_lfsr_3(
	.CLK(nx_clk),
	.D(nx28),
	.R(rst_n),
	.Q(nx32)
	);
dffr	b2v_reg_lfsr_4(
	.CLK(nx_clk),
	.D(nx32),
	.R(rst_n),
	.Q(nx33)
	);
dffr	b2v_reg_lfsr_5(
	.CLK(nx_clk),
	.D(nx33),
	.R(rst_n),
	.Q(nx34)
	);
dffr	b2v_reg_lfsr_6(
	.CLK(nx_clk),
	.D(nx34),
	.R(rst_n),
	.Q(nx31)
	);
dffr	b2v_reg_lfsr_7(
	.CLK(nx_clk),
	.D(nx31),
	.R(rst_n),
	.Q(nx29)
	);
dffr	b2v_reg_lfsr_8(
	.CLK(nx_clk),
	.D(nx29),
	.R(rst_n),
	.Q(nx25)
	);
dffr	b2v_reg_lfsr_9(
	.CLK(nx_clk),
	.D(nx25),
	.R(rst_n),
	.Q(nx27)
	);
dffr	b2v_reg_lfsr_10(
	.CLK(nx_clk),
	.D(nx27),
	.R(rst_n),
	.Q(nx23)
	);

dffr	b2v_reg_lfsr_11(
	.CLK(nx_clk),
	.D(nx23),
	.R(rst_n),
	.Q(nx22)
	);
assign	lfsr_out = nx22;

endmodule
