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
// CREATED		"Thu May 02 08:34:20 2024"

module WB(
	Instruction,
	WBValue,
	WBwe,
	WBData,
	WBForward,
	WBop,
	WBReg,
	WBrn,
	WBrp
);


input wire	[31:0] Instruction;
input wire	[31:0] WBValue;
output wire	WBwe;
output wire	[31:0] WBData;
output wire	[31:0] WBForward;
output wire	[5:0] WBop;
output wire	[4:0] WBReg;
output wire	[4:0] WBrn;
output wire	[4:0] WBrp;

wire	[31:0] WBIR;
wire	WBopisADDI;
wire	WBopisLW;
wire	WBopisLWADDIorSLTI;
wire	WBopRTYPE;
wire	WBrdisNOT0;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	WBData = WBValue;
assign	WBForward = WBValue;
assign	SYNTHESIZED_WIRE_1 = 0;



assign	WBwe = SYNTHESIZED_WIRE_0 | WBopisLWADDIorSLTI;

assign	SYNTHESIZED_WIRE_0 = WBopRTYPE & WBrdisNOT0;



ADDI	b2v_inst3(
	.Op(WBIR[31:26]),
	.Y(WBopisADDI));


SLTI	b2v_inst4(
	.Op(WBIR[31:26]),
	.Y(SYNTHESIZED_WIRE_3));


LUI	b2v_inst5(
	.Op(WBIR[31:26]),
	.Y(SYNTHESIZED_WIRE_4));


ORI	b2v_inst6(
	.Op(WBIR[31:26]),
	.Y(SYNTHESIZED_WIRE_2));

assign	WBopisLWADDIorSLTI = SYNTHESIZED_WIRE_1 | WBopisADDI | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3 | WBopisLW | SYNTHESIZED_WIRE_4;


LW	b2v_isLW(
	.Op(WBIR[31:26]),
	.Y(WBopisLW));


RTYPE	b2v_isRTYPE(
	.Op(WBIR[31:26]),
	.Y(WBopRTYPE));


MUX2_5	b2v_MUXWBReg(
	.S(WBopisLWADDIorSLTI),
	.A(WBIR[15:11]),
	.B(WBIR[20:16]),
	.Y(WBReg));


NONZERO	b2v_nonZeroReg(
	.Register(WBIR[15:11]),
	.Y(WBrdisNOT0));

assign	WBIR = Instruction;
assign	WBop[5:0] = WBIR[31:26];
assign	WBrn[4:0] = WBIR[20:16];
assign	WBrp[4:0] = WBIR[15:11];

endmodule
