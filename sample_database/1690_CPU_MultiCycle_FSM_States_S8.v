// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_MultiCycle
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
// CREATED		"Thu May 18 12:00:33 2023"

module S8(
	S,
	Y
);


input wire	[4:0] S;
output wire	Y;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_0 = 1;



assign	Y = S[3] & SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;


assign	SYNTHESIZED_WIRE_1 =  ~S[4];

assign	SYNTHESIZED_WIRE_2 =  ~S[2];

assign	SYNTHESIZED_WIRE_3 =  ~S[1];

assign	SYNTHESIZED_WIRE_4 =  ~S[0];


endmodule
