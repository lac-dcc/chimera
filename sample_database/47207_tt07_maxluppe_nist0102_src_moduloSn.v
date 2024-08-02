// This program was cloned from: https://github.com/maxluppe/tt07_maxluppe_nist0102
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
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Wed Mar 29 15:13:21 2023"

module moduloSn(
	SnQ,
	mSnQ
);


input wire	[8:0] SnQ;
output wire	[7:0] mSnQ;

assign	mSnQ[0] = SnQ[8] ^ SnQ[0];
assign	mSnQ[1] = SnQ[8] ^ SnQ[1];
assign	mSnQ[2] = SnQ[8] ^ SnQ[2];
assign	mSnQ[3] = SnQ[8] ^ SnQ[3];
assign	mSnQ[4] = SnQ[8] ^ SnQ[4];
assign	mSnQ[5] = SnQ[8] ^ SnQ[5];
assign	mSnQ[6] = SnQ[8] ^ SnQ[6];
assign	mSnQ[7] = SnQ[8] ^ SnQ[7];

endmodule
