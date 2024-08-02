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
// CREATED		"Wed Mar 29 15:08:01 2023"

module RND_counter_module(
	CLK_In,
	EN_in,
	CLRn_in,
	Q_out,
	EN_out
);

input wire	CLK_In;
input wire	EN_in;
input wire	CLRn_in;
output wire	Q_out;
output wire	EN_out;

reg	Q;
wire	D;

assign	Q_out = Q;

assign	EN_out = EN_in & Q;

always@(posedge CLK_In or negedge CLRn_in)
begin
if (!CLRn_in)
	begin
	Q <= 0;
	end
else
	begin
	Q <= D;
	end
end

assign	D = Q ^ EN_in;

endmodule
