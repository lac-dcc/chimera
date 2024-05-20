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
// CREATED		"Fri Feb  2 13:28:41 2024"

module lab2step2(
	Cabbage,
	Goat,
	Wolf,
	F
);


input wire	Cabbage;
input wire	Goat;
input wire	Wolf;
output wire	F;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;




assign	SYNTHESIZED_WIRE_0 =  ~Cabbage;

assign	SYNTHESIZED_WIRE_1 =  ~Goat;

assign	SYNTHESIZED_WIRE_2 =  ~Wolf;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_3 = Goat & Wolf;

assign	SYNTHESIZED_WIRE_4 = Cabbage & SYNTHESIZED_WIRE_2;

assign	F = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;


endmodule
