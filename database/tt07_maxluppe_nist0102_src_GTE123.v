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
// CREATED		"Wed Mar 29 15:12:28 2023"

module GTE123(
	BlkQ,
	GTE123
);

input wire	[6:0] BlkQ;
output wire	GTE123;

//assign	GTE123 = BlkQ[6] & BlkQ[5] & BlkQ[4] & BlkQ[3] & (BlkQ[2] | (BlkQ[1] & BlkQ[0]));
assign GTE123 = (BlkQ >= 123) ? 1'b1 : 1'b0;

endmodule
