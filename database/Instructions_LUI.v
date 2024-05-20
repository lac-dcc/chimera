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
// CREATED		"Thu Jan 04 08:49:51 2024"

module LUI(
	Op,
	Y
);


input wire	[31:26] Op;
output wire	Y;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;




assign	Y = Op[29] & SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1 & Op[28] & Op[27] & Op[26];

assign	SYNTHESIZED_WIRE_1 =  ~Op[30];

assign	SYNTHESIZED_WIRE_0 =  ~Op[31];


endmodule
