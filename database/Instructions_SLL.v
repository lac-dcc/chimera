// This program was cloned from: https://github.com/FIUSCIS-CDA/Instructions
// License: MIT License

// Copyright (C) 2020  Intel Corporation. All rights reserved.
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
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Tue Dec 20 13:29:50 2022"

module SLL(
	Functcode,
	Opcode,
	Y
);


input wire	[5:0] Functcode;
input wire	[5:0] Opcode;
output wire	Y;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;




assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_6 & SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_9 & SYNTHESIZED_WIRE_10 & SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_8 =  ~Functcode[4];

assign	SYNTHESIZED_WIRE_6 =  ~Functcode[3];

assign	SYNTHESIZED_WIRE_9 =  ~Functcode[2];

assign	SYNTHESIZED_WIRE_10 =  ~Functcode[1];

assign	SYNTHESIZED_WIRE_11 =  ~Functcode[0];

assign	Y = SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_1 =  ~Opcode[0];

assign	SYNTHESIZED_WIRE_2 =  ~Opcode[1];

assign	SYNTHESIZED_WIRE_5 =  ~Opcode[5];

assign	SYNTHESIZED_WIRE_0 =  ~Opcode[2];

assign	SYNTHESIZED_WIRE_3 =  ~Opcode[3];

assign	SYNTHESIZED_WIRE_4 =  ~Opcode[4];

assign	SYNTHESIZED_WIRE_7 =  ~Functcode[5];


endmodule
