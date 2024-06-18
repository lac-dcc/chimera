// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_SingleCycle
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
// CREATED		"Mon Apr 29 14:47:02 2024"

module CTRL(
	eq,
	ir31_26,
	ir5_0,
	rf_wa_s,
	rf_we,
	dm_we,
	lo_we,
	shamt_s,
	add2_s,
	alu_op,
	pc_s,
	rf_wd_s
);


input wire	eq;
input wire	[31:26] ir31_26;
input wire	[5:0] ir5_0;
output wire	rf_wa_s;
output wire	rf_we;
output wire	dm_we;
output wire	lo_we;
output wire	shamt_s;
output wire	[1:0] add2_s;
output wire	[6:0] alu_op;
output wire	[1:0] pc_s;
output wire	[1:0] rf_wd_s;

wire	[1:0] add2_s_ALTERA_SYNTHESIZED;
wire	[6:0] alu_op_ALTERA_SYNTHESIZED;
wire	[1:0] pc_s_ALTERA_SYNTHESIZED;
wire	[1:0] rf_wd_s_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;

assign	rf_wa_s = SYNTHESIZED_WIRE_32;
assign	shamt_s = SYNTHESIZED_WIRE_3;
assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_20 = 0;
assign	SYNTHESIZED_WIRE_26 = 0;




RTYPE	b2v_inst(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_7));


LW	b2v_inst1(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_27));


ADDI	b2v_inst100(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_4));


ORI	b2v_inst101(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_5));

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;


LW	b2v_inst105(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_2));




MULT	b2v_inst108(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_6));

assign	SYNTHESIZED_WIRE_8 =  ~SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8;


RTYPE	b2v_inst111(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_11));


BEQ	b2v_inst112(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_9));


BNE	b2v_inst113(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_10));

assign	add2_s_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;


LW	b2v_inst115(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_12));


MFLO	b2v_inst116(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(rf_wd_s_ALTERA_SYNTHESIZED[1]));

assign	rf_wd_s_ALTERA_SYNTHESIZED[0] = ~(rf_wd_s_ALTERA_SYNTHESIZED[1] | SYNTHESIZED_WIRE_12);


SW	b2v_inst118(
	.Op(ir31_26),
	.Y(dm_we));


BEQ	b2v_inst119(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_13));


BNE	b2v_inst120(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_14));

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_13 & eq;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_15 =  ~eq;

assign	pc_s_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_17;


J	b2v_inst125(
	.Op(ir31_26),
	.Y(pc_s_ALTERA_SYNTHESIZED[0]));


LUI	b2v_inst126(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_19));


SLL	b2v_inst127(
	.Functcode(ir5_0),
	.Opcode(ir31_26),
	.Y(SYNTHESIZED_WIRE_18));

assign	alu_op_ALTERA_SYNTHESIZED[6] = SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;


SUB	b2v_inst129(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_22));


SLT	b2v_inst130(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_21));


SLTI	b2v_inst131(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_23));



MULT	b2v_inst133(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(alu_op_ALTERA_SYNTHESIZED[2]));


ORR	b2v_inst134(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_34));


ORI	b2v_inst135(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_35));


SLT	b2v_inst136(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_33));


BEQ	b2v_inst137(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_24));


BNE	b2v_inst138(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_25));


SLTI	b2v_inst139(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_36));

assign	alu_op_ALTERA_SYNTHESIZED[4] = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;

assign	alu_op_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_26 | SYNTHESIZED_WIRE_27 | alu_op_ALTERA_SYNTHESIZED[4] | SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30;


MULT	b2v_inst142(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(lo_we));

assign	rf_we = SYNTHESIZED_WIRE_31 | SYNTHESIZED_WIRE_32;


SW	b2v_inst2(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_28));



ADD	b2v_inst3(
	.Funct(ir5_0),
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_29));


ADDI	b2v_inst4(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_30));

assign	alu_op_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34 | SYNTHESIZED_WIRE_35 | SYNTHESIZED_WIRE_36;


ORI	b2v_inst6(
	.Op(ir31_26),
	.Y(add2_s_ALTERA_SYNTHESIZED[1]));


SameBit	b2v_inst7(
	.Ain(alu_op_ALTERA_SYNTHESIZED[4]),
	.Aout(alu_op_ALTERA_SYNTHESIZED[3]));


LUI	b2v_inst92(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_3));


SLTI	b2v_inst99(
	.Op(ir31_26),
	.Y(SYNTHESIZED_WIRE_1));

assign	add2_s = add2_s_ALTERA_SYNTHESIZED;
assign	alu_op = alu_op_ALTERA_SYNTHESIZED;
assign	pc_s = pc_s_ALTERA_SYNTHESIZED;
assign	rf_wd_s = rf_wd_s_ALTERA_SYNTHESIZED;
assign	alu_op_ALTERA_SYNTHESIZED[5] = 0;

endmodule
