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
// CREATED		"Thu Jan 04 08:48:37 2024"

module CPU_MultiCycle(
	clk,
	reset,
	Overflow,
	_PC,
	FUNCTCODE,
	OPCODE,
	state
);


input wire	clk;
input wire	reset;
output wire	Overflow;
output wire	[31:0] _PC;
output wire	[31:26] FUNCTCODE;
output wire	[31:26] OPCODE;
output wire	[4:0] state;

wire	[31:0] A;
wire	[31:0] Adr;
wire	[2:0] ALUOp;
wire	[31:0] ALUOut;
wire	[31:0] ALUResult;
wire	ALUSrcA;
wire	[1:0] ALUSrcB;
wire	ANDoutput;
wire	[31:0] B;
wire	[31:0] Data;
wire	[31:0] ImmExt;
wire	[31:0] ImmExt_times_4;
wire	[31:0] Instr;
wire	IorD;
wire	IRWrite;
wire	isBNE;
wire	isZero;
wire	[31:0] LOval;
wire	LOwrite;
wire	[1:0] MemToReg;
wire	MemWrite;
wire	[4:0] myState;
wire	notEqual;
wire	OV;
wire	[31:0] PC;
wire	PCEn;
wire	[31:0] PCJump;
wire	[31:0] PCPrime;
wire	[1:0] PCSrc;
wire	PCWrite;
wire	PCWriteCond;
wire	[31:0] RD;
wire	[31:0] ReadData1;
wire	[31:0] ReadData2;
wire	RegDst;
wire	RegWrite;
wire	Shift16;
wire	[31:0] SrcA;
wire	[31:0] SrcB;
wire	[31:0] WriteData;
wire	[4:0] WriteRegister;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[6:0] SYNTHESIZED_WIRE_2;
wire	[4:0] SYNTHESIZED_WIRE_3;
wire	[4:0] SYNTHESIZED_WIRE_4;





Flopr_32	b2v_ALURESREG(
	.reset(reset),
	.clk(clk),
	.D(ALUResult),
	.Q(ALUOut));


MUX2_32	b2v_AMUX(
	.S(ALUSrcA),
	.A(PC),
	.B(A),
	.Y(SrcA));


MUX2	b2v_ANDMUX(
	.S(isBNE),
	.A(isZero),
	.B(notEqual),
	.Y(SYNTHESIZED_WIRE_1));


MUX4_32	b2v_BMUX(
	.A(B),
	.B(SYNTHESIZED_WIRE_0),
	.C(ImmExt),
	.D(ImmExt_times_4),
	.S(ALUSrcB),
	.Y(SrcB));


CTRL	b2v_ctrlUnit(
	.clk(clk),
	.reset(reset),
	.Funct(Instr[5:0]),
	.Op(Instr[31:26]),
	.PCWrite(PCWrite),
	.PCWriteCond(PCWriteCond),
	.IorD(IorD),
	.MemWrite(MemWrite),
	.IRWrite(IRWrite),
	.ALUSrcA(ALUSrcA),
	.RegWrite(RegWrite),
	.RegDst(RegDst),
	.isBNE(isBNE),
	.LOWrite(LOwrite),
	.Shift16(Shift16),
	.ALUOp(ALUOp),
	.ALUSrcB(ALUSrcB),
	.MemToReg(MemToReg),
	.PCSrc(PCSrc),
	.state(myState));


Flopr_32	b2v_DR(
	.reset(reset),
	.clk(clk),
	.D(RD),
	.Q(Data));


DM_asynch	b2v_IDM(
	.we(MemWrite),
	.a(Adr),
	.wd(SrcB),
	.rd(RD));


ALUCtl	b2v_inst(
	.ALUOp(ALUOp),
	.F(Instr[5:0]),
	.ALUControl(SYNTHESIZED_WIRE_2));

assign	PCEn = ANDoutput | PCWrite;


Sixteen	b2v_inst2(
	.Y(SYNTHESIZED_WIRE_4));


SL2_32	b2v_inst3(
	.A(ImmExt),
	.Y(ImmExt_times_4));

assign	notEqual =  ~isZero;


MUX3_32	b2v_inst8(
	.A(ALUResult),
	.B(ALUOut),
	.C(PCJump),
	.S(PCSrc),
	.Y(PCPrime));

assign	ANDoutput = PCWriteCond & SYNTHESIZED_WIRE_1;


Flopenr_32	b2v_IR(
	.reset(reset),
	.clk(clk),
	.E(IRWrite),
	.D(RD),
	.Q(Instr));


Flopenr_32	b2v_LO(
	.reset(reset),
	.clk(clk),
	.E(LOwrite),
	.D(ALUOut),
	.Q(LOval));


ALU_32	b2v_MYALU(
	.A(SrcA),
	.alu_op(SYNTHESIZED_WIRE_2),
	.B(SrcB),
	.H(SYNTHESIZED_WIRE_3),
	.Overflow(OV),
	.Zero(isZero),
	.Result(ALUResult));


RF	b2v_myRF(
	.reset(reset),
	.clk(clk),
	.we(RegWrite),
	.r1a(Instr[25:21]),
	.r2a(Instr[20:16]),
	.wa(WriteRegister),
	.wd(WriteData),
	.r1d(ReadData1),
	.r2d(ReadData2));


Four	b2v_number4(
	.Y(SYNTHESIZED_WIRE_0));


MUX2_32	b2v_PCMUX(
	.S(IorD),
	.A(PC),
	.B(ALUOut),
	.Y(Adr));


Flopenr_32	b2v_PCREG(
	.reset(reset),
	.clk(clk),
	.E(PCEn),
	.D(PCPrime),
	.Q(PC));


Flopr_32	b2v_R1DR(
	.reset(reset),
	.clk(clk),
	.D(ReadData1),
	.Q(A));


Flopr_32	b2v_R2DR(
	.reset(reset),
	.clk(clk),
	.D(ReadData2),
	.Q(B));


SE16_32	b2v_SECONSTANT(
	.A(Instr[15:0]),
	.Y(ImmExt));


SPLICE_PCJ	b2v_spliceUnit(
	.ir25_0(Instr[25:0]),
	.pc31_28(PC[31:28]),
	.Y(PCJump));


MUX2_5	b2v_WAMUX(
	.S(RegDst),
	.A(Instr[20:16]),
	.B(Instr[15:11]),
	.Y(WriteRegister));


MUX2_5	b2v_WAMUX2(
	.S(Shift16),
	.A(Instr[10:6]),
	.B(SYNTHESIZED_WIRE_4),
	.Y(SYNTHESIZED_WIRE_3));


MUX3_32	b2v_WDMUX(
	.A(ALUOut),
	.B(Data),
	.C(LOval),
	.S(MemToReg),
	.Y(WriteData));

assign	Overflow = OV;
assign	_PC = PC;
assign	FUNCTCODE[31:26] = Instr[5:0];
assign	OPCODE[31:26] = Instr[31:26];
assign	state = myState;

endmodule
