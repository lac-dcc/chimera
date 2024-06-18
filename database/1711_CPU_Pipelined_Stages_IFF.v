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
// CREATED		"Wed Aug 16 14:47:31 2023"

module IFF(
	stall,
	reset,
	clk,
	Taken,
	Fix,
	beq_offset,
	Pick,
	_PC,
	IFIR,
	IFop
);


input wire	stall;
input wire	reset;
input wire	clk;
input wire	Taken;
input wire	Fix;
input wire	[15:0] beq_offset;
input wire	[1:0] Pick;
output wire	[31:0] _PC;
output wire	[31:0] IFIR;
output wire	[5:0] IFop;

wire	[31:0] FixedBranchPC;
wire	[31:0] FixforPredictNotTaken;
wire	[31:0] FixforPredictTaken;
wire	[31:0] IDbeqtargettimes4;
wire	[31:0] IFbeqtarget_SE;
wire	[31:0] IFbeqtargettimes4;
wire	[31:0] IFbeqtargettimes4plus4;
wire	[31:0] IFIR_ALTERA_SYNTHESIZED;
wire	[31:0] Instruction;
wire	[31:0] newPC;
wire	[31:0] NewPCforBEQ;
wire	[31:0] newValueForPC;
wire	[6:0] Op;
wire	[31:0] PC;
wire	[31:0] PCJump;
wire	[31:0] PredictNotTakenNewPC;
wire	[31:0] PredictTakenNewPC;
wire	wire_to_ground2;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





INC4_32	b2v_add4(
	.A(PC),
	.S(PredictNotTakenNewPC));


INC4_32	b2v_add4_2(
	.A(IFbeqtargettimes4),
	.S(IFbeqtargettimes4plus4));




SL2_32	b2v_inst1(
	.A(SYNTHESIZED_WIRE_0),
	.Y(IDbeqtargettimes4));


SL2_32	b2v_inst2(
	.A(IFbeqtarget_SE),
	.Y(IFbeqtargettimes4));


ALU_32	b2v_inst3(
	.A(PC),
	.alu_op(Op),
	.B(IDbeqtargettimes4),
	
	.Overflow(wire_to_ground2),
	.Zero(SYNTHESIZED_WIRE_2),
	.Result(FixforPredictTaken));


MUX2_32	b2v_MUXFixPC(
	.S(Taken),
	.A(FixforPredictNotTaken),
	.B(FixforPredictTaken),
	.Y(FixedBranchPC));


MUX2_32	b2v_MUXIFIR(
	.S(Fix),
	.A(Instruction),
	.B(SYNTHESIZED_WIRE_1),
	.Y(IFIR_ALTERA_SYNTHESIZED));


MUX2_32	b2v_MUXPCREG(
	.S(stall),
	.A(newPC),
	.B(PC),
	.Y(newValueForPC));


MUX2_32	b2v_MUXPredictPC(
	.S(Taken),
	.A(PredictNotTakenNewPC),
	.B(PredictTakenNewPC),
	.Y(NewPCforBEQ));


Adder_32	b2v_MYAdder(
	.A(IDbeqtargettimes4),
	.B(PC),
	.S(FixforPredictNotTaken));


Adder_32	b2v_MYAdder2(
	.A(PC),
	.B(IFbeqtargettimes4plus4),
	.S(PredictTakenNewPC));


Grounder	b2v_myGround(
	.Input_To_Ground(SYNTHESIZED_WIRE_2));


Grounder	b2v_myGround2(
	.Input_To_Ground(wire_to_ground2));


IM	b2v_MYIM(
	.a(PC),
	.d(Instruction));


MUX4_32	b2v_PCBranch(
	.A(PredictNotTakenNewPC),
	.B(FixedBranchPC),
	.C(PCJump),
	.D(NewPCforBEQ),
	.S(Pick),
	.Y(newPC));


SPLICE_PCJ	b2v_PCJCompute(
	.ir25_0(Instruction[25:0]),
	.pc31_28(PC[31:28]),
	.Y(PCJump));


Flopr_32	b2v_PCREG(
	.reset(reset),
	.clk(clk),
	.D(newValueForPC),
	.Q(PC));


SE16_32	b2v_SignExtend(
	.A(beq_offset),
	.Y(SYNTHESIZED_WIRE_0));


SE16_32	b2v_SignExtend2(
	.A(IFIR_ALTERA_SYNTHESIZED[15:0]),
	.Y(IFbeqtarget_SE));


Zero	b2v_Value0(
	.Zero(SYNTHESIZED_WIRE_1));

assign	_PC = PC;
assign	IFIR = IFIR_ALTERA_SYNTHESIZED;
assign	IFop[5:0] = IFIR_ALTERA_SYNTHESIZED[31:26];
assign	Op[0] = 0;
assign	Op[1] = 1;
assign	Op[2] = 0;
assign	Op[3] = 1;
assign	Op[4] = 1;
assign	Op[5] = 0;
assign	Op[6] = 0;

endmodule
