// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

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
// CREATED		"Sun Apr 21 22:31:31 2024"

module Adder13(
	Cin,
	X,
	Y,
	Overflow,
	S
);


input wire	Cin;
input wire	[12:0] X;
input wire	[12:0] Y;
output wire	Overflow;
output wire	[12:0] S;

wire	[12:0] S_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;





FA	b2v_inst10(
	.Cin(SYNTHESIZED_WIRE_0),
	.X(X[5]),
	.Y(Y[5]),
	.S(S_ALTERA_SYNTHESIZED[5]),
	.Cout(SYNTHESIZED_WIRE_1));


FA	b2v_inst11(
	.Cin(SYNTHESIZED_WIRE_1),
	.X(X[4]),
	.Y(Y[4]),
	.S(S_ALTERA_SYNTHESIZED[4]),
	.Cout(SYNTHESIZED_WIRE_2));


FA	b2v_inst12(
	.Cin(SYNTHESIZED_WIRE_2),
	.X(X[3]),
	.Y(Y[3]),
	.S(S_ALTERA_SYNTHESIZED[3]),
	.Cout(SYNTHESIZED_WIRE_3));


FA	b2v_inst13(
	.Cin(SYNTHESIZED_WIRE_3),
	.X(X[2]),
	.Y(Y[2]),
	.S(S_ALTERA_SYNTHESIZED[2]),
	.Cout(SYNTHESIZED_WIRE_4));


FA	b2v_inst14(
	.Cin(SYNTHESIZED_WIRE_4),
	.X(X[1]),
	.Y(Y[1]),
	.S(S_ALTERA_SYNTHESIZED[1]),
	.Cout(SYNTHESIZED_WIRE_14));


FA	b2v_inst15(
	.Cin(SYNTHESIZED_WIRE_14),
	.X(X[0]),
	.Y(Y[0]),
	.S(S_ALTERA_SYNTHESIZED[0]),
	.Cout(SYNTHESIZED_WIRE_9));


FA	b2v_inst2(
	.Cin(Cin),
	.X(X[12]),
	.Y(Y[12]),
	.S(S_ALTERA_SYNTHESIZED[12]),
	.Cout(SYNTHESIZED_WIRE_6));


FA	b2v_inst3(
	.Cin(SYNTHESIZED_WIRE_6),
	.X(X[11]),
	.Y(Y[11]),
	.S(S_ALTERA_SYNTHESIZED[11]),
	.Cout(SYNTHESIZED_WIRE_7));


FA	b2v_inst4(
	.Cin(SYNTHESIZED_WIRE_7),
	.X(X[10]),
	.Y(Y[10]),
	.S(S_ALTERA_SYNTHESIZED[10]),
	.Cout(SYNTHESIZED_WIRE_8));


FA	b2v_inst5(
	.Cin(SYNTHESIZED_WIRE_8),
	.X(X[9]),
	.Y(Y[9]),
	.S(S_ALTERA_SYNTHESIZED[9]),
	.Cout(SYNTHESIZED_WIRE_11));

assign	Overflow = SYNTHESIZED_WIRE_9 ^ SYNTHESIZED_WIRE_14;


FA	b2v_inst7(
	.Cin(SYNTHESIZED_WIRE_11),
	.X(X[8]),
	.Y(Y[8]),
	.S(S_ALTERA_SYNTHESIZED[8]),
	.Cout(SYNTHESIZED_WIRE_12));


FA	b2v_inst8(
	.Cin(SYNTHESIZED_WIRE_12),
	.X(X[7]),
	.Y(Y[7]),
	.S(S_ALTERA_SYNTHESIZED[7]),
	.Cout(SYNTHESIZED_WIRE_13));


FA	b2v_inst9(
	.Cin(SYNTHESIZED_WIRE_13),
	.X(X[6]),
	.Y(Y[6]),
	.S(S_ALTERA_SYNTHESIZED[6]),
	.Cout(SYNTHESIZED_WIRE_0));

assign	S = S_ALTERA_SYNTHESIZED;

endmodule
