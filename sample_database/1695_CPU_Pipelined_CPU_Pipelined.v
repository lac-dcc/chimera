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
// CREATED		"Thu May 02 08:30:08 2024"

module CPU_Pipelined(
	reset,
	clk,
	Strategy,
	EXIR,
	IDIR,
	IFIR,
	MEMIR,
	PC,
	WBIR
);


input wire	reset;
input wire	clk;
input wire	[1:0] Strategy;
output wire	[31:0] EXIR;
output wire	[31:0] IDIR;
output wire	[31:0] IFIR;
output wire	[31:0] MEMIR;
output wire	[31:0] PC;
output wire	[31:0] WBIR;

wire	[31:0] EXALUOut;
wire	[31:0] EXB;
wire	[31:0] EXIR_ALTERA_SYNTHESIZED;
wire	[31:0] EXMEMTower_ALUOut;
wire	[31:0] EXMEMTower_B;
wire	[31:0] EXMEMTower_IR;
wire	[4:0] EXrm;
wire	[4:0] EXrn;
wire	[4:0] EXrp;
wire	EXstall;
wire	EXstall_or_IDstall;
wire	Fix;
wire	[1:0] ForwardA_EX;
wire	[1:0] ForwardA_ID;
wire	[1:0] ForwardB_EX;
wire	[1:0] ForwardB_ID;
wire	[31:0] ForwardedValuefromMEM;
wire	[31:0] ForwardedValuefromWB;
wire	[15:0] ID_beq_offset;
wire	[31:0] IDA;
wire	[31:0] IDB;
wire	[31:0] IDEXTower_A;
wire	[31:0] IDEXTower_B;
wire	[31:0] IDEXTower_IR;
wire	[31:0] IDIRwire;
wire	[5:0] IDop;
wire	[4:0] IDrm;
wire	[4:0] IDrn;
wire	IDstall;
wire	[31:0] IFIDTower_IR;
wire	[31:0] IFIRwire;
wire	[5:0] IFop;
wire	[31:0] MEMIRwire;
wire	[5:0] MEMop;
wire	[4:0] MEMrn;
wire	[4:0] MEMrp;
wire	[31:0] MEMValue;
wire	[31:0] MEMWBTower_IR;
wire	[31:0] MEMWBTower_Value;
wire	[31:0] OLDA;
wire	[31:0] OLDB;
wire	[1:0] Pick;
wire	[4:0] REGtoWrite;
wire	RF_we;
wire	[31:0] ValuetoWriteREG;
wire	[5:0] WBop;
wire	[4:0] WBrn;
wire	[4:0] WBrp;
wire	[5:0] SYNTHESIZED_WIRE_0;





Branch_Prediction	b2v_BranchPredictionHW(
	.Taken(Strategy[0]),
	.DelaySlot(Strategy[1]),
	.IDA(IDA),
	.IDB(IDB),
	.IDop(IDop),
	.IFop(IFop),
	.Fix(Fix),
	.Pick(Pick));


EXMEMTower	b2v_EX_MEM_Tower(
	.reset(reset),
	.clk(clk),
	.EXALUOut(EXALUOut),
	.EXB(EXB),
	.EXIR(EXIR_ALTERA_SYNTHESIZED),
	.MEMALUOut(EXMEMTower_ALUOut),
	.MEMB(EXMEMTower_B),
	.MEMIR(EXMEMTower_IR));


EX	b2v_EXStage(
	.EXStall(EXstall),
	.EXA(IDEXTower_A),
	.EXB(IDEXTower_B),
	.Forward_MEM(ForwardedValuefromMEM),
	.Forward_WB(ForwardedValuefromWB),
	.ForwardA_EX(ForwardA_EX),
	.ForwardB_EX(ForwardB_EX),
	.Instruction(IDEXTower_IR),
	.EXALUB(EXB),
	.EXALUOut(EXALUOut),
	.EXIR(EXIR_ALTERA_SYNTHESIZED),
	.Exop(SYNTHESIZED_WIRE_0),
	.EXrm(EXrm),
	.EXrn(EXrn),
	.EXrp(EXrp),
	.OLDA(OLDA),
	.OLDB(OLDB));


ForwardDetection	b2v_ForwardDetectionUnit(
	.EXrm(EXrm),
	.EXrn(EXrn),
	.IDrm(IDrm),
	.IDrn(IDrn),
	.MEMop(MEMop),
	.MEMrn(MEMrn),
	.MEMrp(MEMrp),
	.WBop(WBop),
	.WBrn(WBrn),
	.WBrp(WBrp),
	.ForwardA_EX(ForwardA_EX),
	.ForwardA_ID(ForwardA_ID),
	.ForwardB_EX(ForwardB_EX),
	.ForwardB_ID(ForwardB_ID));


IDEXTower	b2v_ID_EX_Tower(
	.EXstall(EXstall),
	.reset(reset),
	.clk(clk),
	.IDA(IDA),
	.IDB(IDB),
	.IDIR(IDIRwire),
	.OLDA(OLDA),
	.OLDB(OLDB),
	.EXA(IDEXTower_A),
	.EXB(IDEXTower_B),
	.EXIR(IDEXTower_IR));


ID	b2v_IDStage(
	.IDStall(IDstall),
	.reset(reset),
	.clk(clk),
	.WBwe(RF_we),
	.Forward_MEM(ForwardedValuefromMEM),
	.Forward_WB(ForwardedValuefromWB),
	.ForwardA_ID(ForwardA_ID),
	.ForwardB_ID(ForwardB_ID),
	.Instruction(IFIDTower_IR),
	.WBreg(REGtoWrite),
	.WBvalue(ValuetoWriteREG),
	.IDA(IDA),
	.IDB(IDB),
	.IDIR(IDIRwire),
	.IDof(ID_beq_offset),
	.IDop(IDop),
	.IDrm(IDrm),
	.IDrn(IDrn));


IFIDTower	b2v_IF_ID_Tower(
	.reset(reset),
	.clk(clk),
	.stall(EXstall_or_IDstall),
	.IFIR(IFIRwire),
	.IDIR(IFIDTower_IR));


IFF	b2v_IFStage(
	.reset(reset),
	.clk(clk),
	.Taken(Strategy[0]),
	.Fix(Fix),
	.stall(EXstall_or_IDstall),
	.beq_offset(ID_beq_offset),
	.Pick(Pick),
	._PC(PC),
	.IFIR(IFIRwire),
	.IFop(IFop));

assign	EXstall_or_IDstall = EXstall | IDstall;


MEMWBTower	b2v_MEM_WB_Tower(
	.reset(reset),
	.clk(clk),
	.MEMIR(MEMIRwire),
	.MEMValue(MEMValue),
	.WBIR(MEMWBTower_IR),
	.WBValue(MEMWBTower_Value));


MEMM	b2v_MEMStage(
	.clk(clk),
	.Instruction(EXMEMTower_IR),
	.MEMALUOut(EXMEMTower_ALUOut),
	.MEMB(EXMEMTower_B),
	.MEMForward(ForwardedValuefromMEM),
	.MEMIR(MEMIRwire),
	.MEMop(MEMop),
	.MEMrn(MEMrn),
	.MEMrp(MEMrp),
	.MEMValue(MEMValue));


StallDetection	b2v_StallDetectionUnit(
	.EXop(SYNTHESIZED_WIRE_0),
	.EXrm(EXrm),
	.EXrn(EXrn),
	.EXrp(EXrp),
	.IDop(IDop),
	.IDrm(IDrm),
	.IDrn(IDrn),
	.MEMop(MEMop),
	.MEMrn(MEMrn),
	.IDStall(IDstall),
	.EXStall(EXstall));


WB	b2v_WBStage(
	.Instruction(MEMWBTower_IR),
	.WBValue(MEMWBTower_Value),
	.WBwe(RF_we),
	.WBData(ValuetoWriteREG),
	.WBForward(ForwardedValuefromWB),
	.WBop(WBop),
	.WBReg(REGtoWrite),
	.WBrn(WBrn),
	.WBrp(WBrp));

assign	EXIR = EXIR_ALTERA_SYNTHESIZED;
assign	IDIR = IDIRwire;
assign	IFIR = IFIRwire;
assign	MEMIR = MEMIRwire;
assign	WBIR = MEMWBTower_IR;

endmodule
