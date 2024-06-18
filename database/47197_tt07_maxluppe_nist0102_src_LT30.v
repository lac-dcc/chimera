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
// CREATED		"Wed Mar 29 15:13:42 2023"

module LT30(
	mSnQ,
	LT30
);

input wire	[7:0] mSnQ;
output wire	LT30;

//assign	LT30 = ~(mSnQ[6] | mSnQ[5] | (mSnQ[4] & mSnQ[3] & mSnQ[2] & mSnQ[1]));
assign LT30 = (mSnQ < 30) ? 1'b1 : 1'b0;

endmodule
