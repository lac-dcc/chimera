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
// CREATED		"Tue Apr 23 01:56:42 2024"

`ifndef dffCustom
	`define dffCustom

module dffCustom(
	Clk,
	D,
	CLRN,
	Q,
	QN
);


input wire	Clk;
input wire	D;
input wire	CLRN;
output wire	Q;
output wire	QN;

wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_6;

assign	Q = SYNTHESIZED_WIRE_4;
assign	QN = SYNTHESIZED_WIRE_2;



assign	SYNTHESIZED_WIRE_6 = ~(SYNTHESIZED_WIRE_10 & SYNTHESIZED_WIRE_11);

assign	SYNTHESIZED_WIRE_4 = ~(SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_10);

assign	SYNTHESIZED_WIRE_2 = ~(CLRN & SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_12);

assign	SYNTHESIZED_WIRE_10 = ~(SYNTHESIZED_WIRE_6 & Clk & CLRN);

assign	SYNTHESIZED_WIRE_11 = ~(D & SYNTHESIZED_WIRE_12);

assign	SYNTHESIZED_WIRE_12 = ~(SYNTHESIZED_WIRE_10 & Clk & SYNTHESIZED_WIRE_11);


endmodule

`endif
