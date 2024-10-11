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
// CREATED		"Wed May 01 13:43:02 2024"

module ForwardBfromWBtoID(
	IDrn,
	WBop,
	WBrn,
	WBrp,
	Y
);


input wire	[4:0] IDrn;
input wire	[5:0] WBop;
input wire	[4:0] WBrn;
input wire	[4:0] WBrp;
output wire	Y;

wire	WBopisADDI;
wire	WBopisLW;
wire	WBopisLWorADDI_and_WBrnisIDrn;
wire	WBopisRTYPE;
wire	WBopisRTYPE_and_WBrpisIDrn;
wire	WBrnisIDrn;
wire	WBrpisIDrn;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_0 = 0;




ADDI	b2v_inst(
	.Op(WBop),
	.Y(WBopisADDI));


assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_0 | WBopisADDI | WBopisLW | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


ORI	b2v_inst3(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_3));

assign	WBopisRTYPE_and_WBrpisIDrn = WBopisRTYPE & WBrpisIDrn;

assign	WBopisLWorADDI_and_WBrnisIDrn = SYNTHESIZED_WIRE_4 & WBrnisIDrn;

assign	Y = WBopisLWorADDI_and_WBrnisIDrn | WBopisRTYPE_and_WBrpisIDrn;


SLTI	b2v_inst8(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_1));


LUI	b2v_inst9(
	.Op(WBop),
	.Y(SYNTHESIZED_WIRE_2));


LW	b2v_WBopLW(
	.Op(WBop),
	.Y(WBopisLW));


RTYPE	b2v_WBopRTYPE(
	.Op(WBop),
	.Y(WBopisRTYPE));


REGCheck	b2v_WBrnIDrn(
	.reg1(IDrn),
	.reg2(WBrn),
	.Y(WBrnisIDrn));


REGCheck	b2v_WBrpIDrn(
	.reg1(IDrn),
	.reg2(WBrp),
	.Y(WBrpisIDrn));


endmodule
