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
// CREATED		"Wed May 01 13:39:58 2024"

module ForwardBfromWBtoEX(
	EXrn,
	WBop,
	WBrn,
	WBrp,
	Y
);


input wire	[4:0] EXrn;
input wire	[5:0] WBop;
input wire	[4:0] WBrn;
input wire	[4:0] WBrp;
output wire	Y;

wire	WBopisADDI;
wire	WBopisADDIorLW_and_WBrnisEXrn;
wire	WBopisLW;
wire	WBopisRTYPE;
wire	WBopisRTYPE_and_WBrpisEXrn;
wire	WBrnisEXrn;
wire	WBrpisEXrn;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_0 = 0;




ADDI	b2v_inst(
	.Op(WBop),
	.Y(WBopisADDI));


LUI	b2v_inst10(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_2));


assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_0 | WBopisLW | WBopisADDI | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


ORI	b2v_inst4(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_3));

assign	WBopisADDIorLW_and_WBrnisEXrn = SYNTHESIZED_WIRE_4 & WBrnisEXrn;

assign	WBopisRTYPE_and_WBrpisEXrn = WBopisRTYPE & WBrpisEXrn;

assign	Y = WBopisADDIorLW_and_WBrnisEXrn | WBopisRTYPE_and_WBrpisEXrn;


SLTI	b2v_inst9(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_1));


LW	b2v_WBopLW(
	.Op(WBop),
	.Y(WBopisLW));


RTYPE	b2v_WBopRTYPE(
	.Op(WBop),
	.Y(WBopisRTYPE));


REGCheck	b2v_WBrnEXrn(
	.reg1(EXrn),
	.reg2(WBrn),
	.Y(WBrnisEXrn));


REGCheck	b2v_WBrpEXrn(
	.reg1(EXrn),
	.reg2(WBrp),
	.Y(WBrpisEXrn));


endmodule
