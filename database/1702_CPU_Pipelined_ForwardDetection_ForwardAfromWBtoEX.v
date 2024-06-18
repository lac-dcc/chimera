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
// CREATED		"Wed May 01 13:45:42 2024"

module ForwardAfromWBtoEX(
	EXrm,
	WBop,
	WBrn,
	WBrp,
	Y
);


input wire	[4:0] EXrm;
input wire	[5:0] WBop;
input wire	[4:0] WBrn;
input wire	[4:0] WBrp;
output wire	Y;

wire	WBopisADDI;
wire	WBopisLW;
wire	WBopisLWorADDI_and_WBrnisEXrm;
wire	WBopisRTYPE;
wire	WBopisRTYPE_and_WBrpisEXrm;
wire	WBrnisEXrm;
wire	WBrpisEXrm;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_0 = 0;




SLTI	b2v_inst(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_1));


ADDI	b2v_inst1(
	.Op(WBop),
	.Y(WBopisADDI));



LUI	b2v_inst3(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_2));

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_0 | WBopisLW | WBopisADDI | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


ORI	b2v_inst5(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_3));

assign	WBopisRTYPE_and_WBrpisEXrm = WBopisRTYPE & WBrpisEXrm;

assign	WBopisLWorADDI_and_WBrnisEXrm = SYNTHESIZED_WIRE_4 & WBrnisEXrm;

assign	Y = WBopisLWorADDI_and_WBrnisEXrm | WBopisRTYPE_and_WBrpisEXrm;


LW	b2v_WBopLW(
	.Op(WBop),
	.Y(WBopisLW));


RTYPE	b2v_WBopRTYPE(
	.Op(WBop),
	.Y(WBopisRTYPE));


REGCheck	b2v_WBrnEXrm(
	.reg1(EXrm),
	.reg2(WBrn),
	.Y(WBrnisEXrm));


REGCheck	b2v_WBrpEXrm(
	.reg1(EXrm),
	.reg2(WBrp),
	.Y(WBrpisEXrm));


endmodule
