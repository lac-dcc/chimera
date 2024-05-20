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
// CREATED		"Tue Apr 23 14:36:32 2024"

module Shiftdevideby10(
	X,
	Out
);


input wire	[12:0] X;
output wire	[12:0] Out;

wire	SYNTHESIZED_WIRE_0;
wire	[12:0] SYNTHESIZED_WIRE_1;
wire	[12:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[12:0] SYNTHESIZED_WIRE_4;
wire	[12:0] SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_0 = 1;
assign	SYNTHESIZED_WIRE_3 = 0;




full_add_subtract13bit	b2v_inst(
	.AddSub(SYNTHESIZED_WIRE_0),
	.X(SYNTHESIZED_WIRE_1),
	.Y(SYNTHESIZED_WIRE_2),
	
	.S(SYNTHESIZED_WIRE_4));



Rightshift4	b2v_inst3(
	.in(X),
	.out(SYNTHESIZED_WIRE_2));


Rightshift3	b2v_inst4(
	.in(X),
	.out(SYNTHESIZED_WIRE_1));


Rightshift5	b2v_inst5(
	.in(X),
	.out(SYNTHESIZED_WIRE_5));


full_add_subtract13bit	b2v_inst50(
	.AddSub(SYNTHESIZED_WIRE_3),
	.X(SYNTHESIZED_WIRE_4),
	.Y(SYNTHESIZED_WIRE_5),
	
	.S(Out));



endmodule
