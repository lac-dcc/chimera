// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Standard Edition"
// CREATED		"Mon Apr  1 15:13:16 2024"

module lab8step2(
	X3,
	X2,
	X1,
	X0,
	XC1,
	XC2,
	XC3,
	s,
	F
);


input wire	X3;
input wire	X2;
input wire	X1;
input wire	X0;
input wire	XC1;
input wire	XC2;
input wire	XC3;
input wire	[1:0] s;
output wire	[3:0] F;

wire	[3:0] F_ALTERA_SYNTHESIZED;





mux4to1	b2v_inst(
	.wo(X2),
	.w1(X1),
	.w2(X0),
	.w3(XC1),
	.s(s),
	.f(F_ALTERA_SYNTHESIZED[2]));


mux4to1	b2v_inst1(
	.wo(X3),
	.w1(X2),
	.w2(X1),
	.w3(X0),
	.s(s),
	.f(F_ALTERA_SYNTHESIZED[3]));


mux4to1	b2v_inst2(
	.wo(X1),
	.w1(X0),
	.w2(XC1),
	.w3(XC2),
	.s(s),
	.f(F_ALTERA_SYNTHESIZED[1]));


mux4to1	b2v_inst3(
	.wo(X0),
	.w1(XC1),
	.w2(XC2),
	.w3(XC3),
	.s(s),
	.f(F_ALTERA_SYNTHESIZED[0]));

assign	F = F_ALTERA_SYNTHESIZED;

endmodule
