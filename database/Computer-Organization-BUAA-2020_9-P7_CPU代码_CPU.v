`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:34:13 11/25/2020 
// Design Name: 
// Module Name:    mips --> CPU
//////////////////////////////////////////////////////////////////////////////////
`include "macros.v"
module CPU(
    input clk,
    input reset,
	input [31:0] PrRD, 
	input [7:2] HWInt,
	
	output PrWE,
	output [31:2] PrAddr,
	output [31:0] PrWD,
	output [31:0] addr	// macro pc
    );
////// Exc and Int signals //////////////
	wire [31:0] EPC;
	wire [6:2] ExcCodeFD, ExcCodeD, ExcCodeDE, ExcCodeE, ExcCodeEM, ExcCodeM;
	wire eret;

////// Stall and Forward Signals //////////
	wire [31:0] FwdD1, FwdD2, FwdE1, FwdE2, FwdM2;
	wire start, busy, MD;
	wire EnIDEX, EnIFID, EnPC;

////// PC and Instr Signals //////
	wire [31:0] NPC;
	wire[31:0] PCF, PCD, PCE, PCW, PCM, InstrF, InstrD, InstrE, InstrM, InstrW;
	wire [31:0]  imm32DE, imm32E;

////// WriteData and Addr Signals //////
	wire [31:0] RD1DE, RD2DE, RD1E, RD2E, RD2EM, RD2M;
	wire [4:0] A3D, A3E, A3EM, A3M, A3MW, A3W; 
	wire [31:0] ResEM, ResM;
	wire [31:0] WDDE, WDE, WDEM, WDM, WDMW, WDW;
////// DEV ////////////
	assign PrAddr = ResM;
	assign PrWD = FwdM2;


////// Fetch Stage //////////////

	Fetch fetch (
    .clk(clk), 
    .reset(reset), 
    .EnPC(EnPC || eret || IntReq), 	// if stall and Exc or Int occur at the same time, jump to handle
    
	.IntReq(IntReq),	// from CP0
	.eret(eret),
	
	.NPC(NPC), 
	.EPC(EPC),
	
    .InstrF(InstrF), 
    .PCF(PCF),
	
	
	.ExcCodeFD(ExcCodeFD)
    );
	

////// IFID ///////////////////

	IFID ifid (
    .clk(clk), 
    .en(EnIFID), 
    .reset(reset), 
	.flush(eret || IntReq),	// signals after Exc and **eret** shoudnt be executed
	
	// receive from Fetch-Stage
    .PCF(PCF), 
    .InstrF(InstrF), 
	
	.BDF(BD),
	.ExcCodeF(ExcCodeFD),
	
	// to Decode-Stage
    .PCD(PCD), 
    .InstrD(InstrD),
	
	.BDD(BDD),
	.ExcCodeD(ExcCodeD)
	
    );
	
	
////// Decode-Stage //////////

	Decode decode (
    .clk(clk), 
    .reset(reset), 
	
    .PCF(PCF), 
    .PCD(PCD), 
	
	
    .InstrD(InstrD), 
    .FwdD1(FwdD1), 
    .FwdD2(FwdD2), 
	
	// write into GRF
    .WDW(WDW), 
    .A3W(A3W), 
    .PCW(PCW), 
	
	.ExcCodeD(ExcCodeD),
	
	
	// output
    .RD1DE(RD1DE), 
    .RD2DE(RD2DE), 
    .imm32DE(imm32DE), 
    .A3DE(A3D), 
    .WDDE(WDDE), 
	
    .NPC(NPC), 
	// rs and rt is being used on D-Stage
    .D1Use(D1Use), 
    .D2Use(D2Use),
	.MD(MD),	// gonna use MD at E-Stage
	
	.BD(BD),
	.ExcCodeDE(ExcCodeDE)
    );

/////// IDEX //////////////////

	IDEX idex(
    .clk(clk), 
    .en(EnIDEX), 
    .reset(reset), 
    .flush(FlushIDEX || eret || IntReq),	// instrs after exc and eret shouldnt be... 
	
	// input
    .PCD(PCD), 
    .InstrD(InstrD), 
	
    .RD1D(RD1DE), 
    .RD2D(RD2DE), 
    .imm32D(imm32DE), 
    .A3D(A3D), 
    .WDD(WDDE), 
	
	.BDD(BDD),
	.ExcCodeD(ExcCodeDE),
	
	// output
    .PCE(PCE), 
    .InstrE(InstrE), 
    .RD1E(RD1E), 
    .RD2E(RD2E), 
    .imm32E(imm32E), 
    .A3E(A3E), 	// hzd
    .WDE(WDE),
	
	.BDE(BDE),
	.ExcCodeE(ExcCodeE)
    );
	
////// Execute-Stage ///////

	Execute execute (
	// input
	.clk(clk), 
	.reset(reset), 
	
	.IntReq(IntReq),	// stop MDU
	.eret(eret),
	
	.InstrE(InstrE), 
	.imm32E(imm32E), 
	.A3E(A3E),
	.WDE(WDE), 
	
	.FwdE1(FwdE1), 
	.FwdE2(FwdE2), 
	
	.ExcCodeE(ExcCodeE),
	
	// output
	.A3EM(A3EM),
	.WDEM(WDEM), 
	.ResEM(ResEM),
	.RD2EM(RD2EM), 
	.E1Use(E1Use), 
	.E2Use(E2Use),
	.start(start),
	.busy(busy),
	
	.ExcCodeEM(ExcCodeEM)
	
	);
	
////// EXMEM //////
	EXMEM exmem (
    .clk(clk), 
    .reset(reset), 
    .flush(FlushEXMEM || eret || IntReq), 
	
    .PCE(PCE), 
    .InstrE(InstrE), 
    .A3E(A3EM), 
    .WDE(WDEM), 
	.ResE(ResEM),
    .RD2E(RD2EM), 
	
	.BDE(BDE),
	.ExcCodeE(ExcCodeEM),
	
	// output
    .PCM(PCM), 
    .InstrM(InstrM), 
    .A3M(A3M), 
    .WDM(WDM), 
	.ResM(ResM),
    .RD2M(RD2M),
	
	.BDM(BDM),
	.ExcCodeM(ExcCodeM)
    );

////// Memory Stage //////
	Memory memory (
    .clk(clk), 
    .reset(reset), 
	
    .PCM(PCM), 
    .InstrM(InstrM), 
	.ResM(ResM),
	.A3M(A3M),	// write conditionally 
    .WDM(WDM), 
    .FwdM2(FwdM2), 
	
	.BDD(BDD),
	.BDE(BDE),
	.BDM(BDM),
	
	.PCF(PCF),
	.PCD(PCD),
	.PCE(PCE),
		// PCM already exists
	
	.ExcCodeD(ExcCodeD),
	.ExcCodeE(ExcCodeE),
	.ExcCodeM(ExcCodeM),
	
	
	// outer input
	.HWInt(HWInt),
	.PrRD(PrRD),
	
	.A3MW(A3MW),
    .WDMW(WDMW),
	
	.PrWE(PrWE),
	.IntReq(IntReq),
	
	.addr(addr),
	.EPC(EPC),
	.eret(eret)
    );



////// MEMWB /////////////
	MEMWB memwb (
    .clk(clk), 
    .reset(reset), 
	.flush(IntReq),	// prevent exc-victim go into the reg
	
    .PCM(PCM), 
	.InstrM(InstrM),
    .A3M(A3MW), 
    .WDM(WDMW), 
	
    .PCW(PCW), 
	.InstrW(InstrW),
    .A3W(A3W), 
    .WDW(WDW)
    );

////// Hazard //////
	hazard hzd (
    .clk(clk), 
    .reset(reset),
	
	// from IF/ID
    .A1D(InstrD[`rs]), 
    .A2D(InstrD[`rt]), 
	
	// from Decode-Stage
    .RD1D(RD1DE), 
    .RD2D(RD2DE), 
    .D1Use(D1Use), 
    .D2Use(D2Use), 
	.MD(MD),
	
	// from ID/EX
    .A1E(InstrE[`rs]), 
    .A2E(InstrE[`rt]), 
    .RD1E(RD1E), 
    .RD2E(RD2E), 
	
	.A3E(A3E), 
    .WDE(WDE), 
	
	// from Execute-Stage
    .E1Use(E1Use), 
    .E2Use(E2Use), 
	.start(start),
	.busy(busy),
	
	// from EX/MEM
    .A2M(InstrM[`rt]), 
    .RD2M(RD2M), 
	.A3M(A3M), 
	.WDM(WDM), 
	
	// from Memory-Stage
    .M2Use(M2Use), 
	
    
    // from MEM/WB
    .A3W(A3W), 
    .WDW(WDW), 

///// Forward Signals ////
    .FwdD1(FwdD1), 
    .FwdD2(FwdD2), 
    .FwdE1(FwdE1), 
    .FwdE2(FwdE2), 
    .FwdM2(FwdM2), 

///// Stall Signals ////
    .EnPC(EnPC), 
    .EnIFID(EnIFID), 
    .EnIDEX(EnIDEX), 
    .FlushIDEX(FlushIDEX), 
    .FlushEXMEM(FlushEXMEM)
    );

endmodule
