// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_Pipelined
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
// CREATED		"Wed Aug 16 14:46:42 2023"

module MEMWBTower(
	reset,
	clk,
	MEMIR,
	MEMValue,
	WBIR,
	WBValue
);


input wire	reset;
input wire	clk;
input wire	[31:0] MEMIR;
input wire	[31:0] MEMValue;
output wire	[31:0] WBIR;
output wire	[31:0] WBValue;






Flopr_32	b2v_IR_REG(
	.reset(reset),
	.clk(clk),
	.D(MEMIR),
	.Q(WBIR));


Flopr_32	b2v_Value_REG(
	.reset(reset),
	.clk(clk),
	.D(MEMValue),
	.Q(WBValue));


endmodule
