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
// CREATED		"Thu May 02 08:46:59 2024"

module ALUCtl(
	Functcode,
	Opcode,
	ALUOp
);


input wire	[5:0] Functcode;
input wire	[5:0] Opcode;
output wire	[6:0] ALUOp;

wire	ADDIinstruction;
wire	ADDinstruction;
wire	[6:0] ALUOp_ALTERA_SYNTHESIZED;
wire	LWinstruction;
wire	ORinstruction;
wire	SLTinstruction;
wire	SUBinstruction;
wire	SWinstruction;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;





assign	SYNTHESIZED_WIRE_4 = LWinstruction | ADDinstruction | SWinstruction | SUBinstruction | SLTinstruction | ADDIinstruction;

assign	ALUOp_ALTERA_SYNTHESIZED[0] = SLTinstruction | ORinstruction | SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_7;


ADDI	b2v_inst12(
	.Op(Opcode),
	.Y(ADDIinstruction));


ORI	b2v_inst13(
	.Op(Opcode),
	.Y(SYNTHESIZED_WIRE_0));

assign	ALUOp_ALTERA_SYNTHESIZED[4] = SLTinstruction | SYNTHESIZED_WIRE_7 | SUBinstruction;

assign	ALUOp_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_4;


LUI	b2v_inst5(
	.Op(Opcode),
	.Y(SYNTHESIZED_WIRE_6));


SLL	b2v_inst6(
	.Functcode(Functcode),
	.Opcode(Opcode),
	.Y(SYNTHESIZED_WIRE_5));


MULT	b2v_inst7(
	.Funct(Functcode),
	.Op(Opcode),
	.Y(ALUOp_ALTERA_SYNTHESIZED[2]));


SLTI	b2v_inst8(
	.Op(Opcode),
	.Y(SYNTHESIZED_WIRE_7));

assign	ALUOp_ALTERA_SYNTHESIZED[6] = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;


ADD	b2v_isADD(
	.Funct(Functcode),
	.Op(Opcode),
	.Y(ADDinstruction));


LW	b2v_isLW(
	.Op(Opcode),
	.Y(LWinstruction));


ORR	b2v_isOR(
	.Funct(Functcode),
	.Op(Opcode),
	.Y(ORinstruction));


SLT	b2v_isSLT(
	.Funct(Functcode),
	.Op(Opcode),
	.Y(SLTinstruction));


SUB	b2v_isSUB(
	.Funct(Functcode),
	.Op(Opcode),
	.Y(SUBinstruction));


SW	b2v_isSW(
	.Op(Opcode),
	.Y(SWinstruction));


SameBit	b2v_sameBitBlock(
	.Ain(ALUOp_ALTERA_SYNTHESIZED[4]),
	.Aout(ALUOp_ALTERA_SYNTHESIZED[3]));

assign	ALUOp = ALUOp_ALTERA_SYNTHESIZED;
assign	ALUOp_ALTERA_SYNTHESIZED[5] = 0;

endmodule
