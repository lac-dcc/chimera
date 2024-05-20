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
// CREATED		"Wed Aug 16 14:46:05 2023"

module ID(
	IDStall,
	reset,
	clk,
	WBwe,
	Forward_MEM,
	Forward_WB,
	ForwardA_ID,
	ForwardB_ID,
	Instruction,
	WBreg,
	WBvalue,
	IDA,
	IDB,
	IDIR,
	IDof,
	IDop,
	IDrm,
	IDrn
);


input wire	IDStall;
input wire	reset;
input wire	clk;
input wire	WBwe;
input wire	[31:0] Forward_MEM;
input wire	[31:0] Forward_WB;
input wire	[1:0] ForwardA_ID;
input wire	[1:0] ForwardB_ID;
input wire	[31:0] Instruction;
input wire	[4:0] WBreg;
input wire	[31:0] WBvalue;
output wire	[31:0] IDA;
output wire	[31:0] IDB;
output wire	[31:0] IDIR;
output wire	[15:0] IDof;
output wire	[5:0] IDop;
output wire	[4:0] IDrm;
output wire	[4:0] IDrn;

wire	[31:0] IDIRWire;
wire	[31:0] ReadData1;
wire	[31:0] ReadData2;
wire	[31:0] TheConstant0;

assign	IDop = Instruction[31:26];




MUX3_32	b2v_IDAMUX(
	.A(ReadData1),
	.B(Forward_MEM),
	.C(Forward_WB),
	.S(ForwardA_ID),
	.Y(IDA));


MUX3_32	b2v_IDBMUX(
	.A(ReadData2),
	.B(Forward_MEM),
	.C(Forward_WB),
	.S(ForwardB_ID),
	.Y(IDB));


MUX2_32	b2v_IDIRMUX(
	.S(IDStall),
	.A(Instruction),
	.B(TheConstant0),
	.Y(IDIRWire));


RF	b2v_MYRF(
	.reset(reset),
	.clk(clk),
	.we(WBwe),
	.r1a(Instruction[25:21]),
	.r2a(Instruction[20:16]),
	.wa(WBreg),
	.wd(WBvalue),
	.r1d(ReadData1),
	.r2d(ReadData2));


Zero	b2v_Value0(
	.Zero(TheConstant0));

assign	IDIR = IDIRWire;
assign	IDof[15:0] = IDIRWire[15:0];
assign	IDrm[4:0] = Instruction[25:21];
assign	IDrn[4:0] = Instruction[20:16];

endmodule
