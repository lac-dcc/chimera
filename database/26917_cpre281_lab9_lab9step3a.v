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
// CREATED		"Fri Apr  5 13:13:22 2024"

module lab9step3a(
	Clk,
	D,
	Q,
	QN
);


input wire	Clk;
input wire	D;
output wire	Q;
output wire	QN;

wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;

assign	Q = SYNTHESIZED_WIRE_4;
assign	QN = SYNTHESIZED_WIRE_5;



assign	SYNTHESIZED_WIRE_6 = ~(SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14);

assign	SYNTHESIZED_WIRE_11 = ~(SYNTHESIZED_WIRE_2 & Clk);

assign	SYNTHESIZED_WIRE_2 =  ~D;

assign	SYNTHESIZED_WIRE_5 = ~(SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4);

assign	SYNTHESIZED_WIRE_4 = ~(SYNTHESIZED_WIRE_5 & SYNTHESIZED_WIRE_6);

assign	SYNTHESIZED_WIRE_3 = ~(SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_13);

assign	SYNTHESIZED_WIRE_13 =  ~Clk;

assign	SYNTHESIZED_WIRE_14 = ~(SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_10);

assign	SYNTHESIZED_WIRE_15 = ~(SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_14);

assign	SYNTHESIZED_WIRE_10 = ~(Clk & D);


endmodule
