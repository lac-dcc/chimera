// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_MultiCycle
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
// CREATED		"Mon Apr 29 18:37:03 2024"

module ALUCtl(
	ALUOp,
	F,
	ALUControl
);


input wire	[2:0] ALUOp;
input wire	[5:0] F;
output wire	[6:0] ALUControl;

wire	[6:0] ALUControl_ALTERA_SYNTHESIZED;
wire	NOT_MULT;
wire	SLT_OR_OR;
wire	SLT_or_SUB;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;




assign	SYNTHESIZED_WIRE_1 = F[0] | F[3];

assign	NOT_MULT =  ~SYNTHESIZED_WIRE_19;

assign	SLT_OR_OR = SYNTHESIZED_WIRE_1 & NOT_MULT;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_2 & NOT_MULT;

assign	SYNTHESIZED_WIRE_5 = ALUOp[1] & SYNTHESIZED_WIRE_3;

assign	ALUControl_ALTERA_SYNTHESIZED[2] = ALUOp[1] & SYNTHESIZED_WIRE_19;

assign	ALUControl_ALTERA_SYNTHESIZED[6] = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_7 & ALUOp[2];

assign	SYNTHESIZED_WIRE_7 =  ~ALUOp[0];

assign	SYNTHESIZED_WIRE_18 = ALUOp[0] & SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_20 =  ~ALUOp[2];

assign	SYNTHESIZED_WIRE_11 = ALUOp[1] & SYNTHESIZED_WIRE_9;

assign	ALUControl_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_10 = ALUOp[0] & ALUOp[2];

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_12 & ALUOp[1];

assign	SYNTHESIZED_WIRE_15 = ALUOp[0] | SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_15;

assign	ALUControl_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_13 =  ~ALUOp[1];

assign	SLT_or_SUB = F[1] & ALUOp[1];

assign	ALUControl_ALTERA_SYNTHESIZED[3] = SLT_or_SUB | SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_2 =  ~F[2];

assign	SYNTHESIZED_WIRE_19 = F[3] & F[4];

assign	SYNTHESIZED_WIRE_9 = ALUOp[0] | SLT_OR_OR;

assign	SYNTHESIZED_WIRE_3 = ~(F[5] | F[3] | F[4] | F[2] | F[0] | F[1]);



SameBit	b2v_sameBitUnit(
	.Ain(ALUControl_ALTERA_SYNTHESIZED[3]),
	.Aout(ALUControl_ALTERA_SYNTHESIZED[4]));

assign	ALUControl = ALUControl_ALTERA_SYNTHESIZED;
assign	ALUControl_ALTERA_SYNTHESIZED[5] = 0;

endmodule
