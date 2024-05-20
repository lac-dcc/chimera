// This program was cloned from: https://github.com/regales/cpre281
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
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"
// CREATED		"Mon May 18 15:19:58 2020"

module lab1step3(
	A,
	B,
	C,
	F
);


input wire	A;
input wire	B;
input wire	C;
output wire	F;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;




assign	SYNTHESIZED_WIRE_7 = A & B & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_6 = A & SYNTHESIZED_WIRE_9 & C;

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_10 & B & C;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_10 & SYNTHESIZED_WIRE_9 & C;

assign	F = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_0 =  ~C;

assign	SYNTHESIZED_WIRE_9 =  ~B;

assign	SYNTHESIZED_WIRE_10 =  ~A;


endmodule
