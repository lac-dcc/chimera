`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    21:38:29 11/25/2020 
// Module Name:    Memory 
//////////////////////////////////////////////////////////////////////////////////
`define WORD	2'b00
`define HALF	2'b01
`define BYTE	2'b10

// pingying/chingish coming
// shouhai zhilin --> exception victim, 
// maybe we should call it victim instruction :)


module Memory(
    input clk,
    input reset,
	
    input [31:0] PCM,
    input [31:0] InstrM,
	
	input [4:0] A3M,
    input [31:0] WDM,
	input [31:0] ResM,	// DM addr
    input [31:0] FwdM2,

	
/// determine victim exception and its pc-addr
	input BDD,
	input BDE,
	input BDM,
	
	input [31:0] PCF,
	input [31:0] PCD,
	input [31:0] PCE,
		// input PCM already exists
	
	input [6:2] ExcCodeD,
	input [6:2] ExcCodeE,
	input [6:2] ExcCodeM,
/// victim exception end ///

/// Outer Input
	input [7:2] HWInt,
	input [31:0] PrRD,	// processor read from the DEV
	
	
/// outputs
	output [4:0] A3MW,
    output [31:0] WDMW,
	
	output PrWE,	// DEV
	output eret,
	output IntReq,
	output [31:0] EPC,
	output [31:0] addr	// macro PC
	
	
    );
	
	
	wire WEMem;
	wire [1:0] width;
	wire LoadSign;
	wire [31:0] MRD; // Mem Read Data
	wire HitDM, HitDEV;	//DEV or DM??
	wire Ld, St;
	wire [1:0] WDSelM;
	
	
	// exc and int
	wire [6:2] ExcCode;
	// wire eret already exits
	wire [31:0] DOut;
	wire CP0WE;
	
	
	
	
	
	// write DEV
	assign	HitDM = (ResM < 32'h3000),
			HitDEV = (32'h7F00 <= ResM && ResM <= 32'h7F0B) ||
					 (32'h7F10 <= ResM && ResM <= 32'h7F1B),
			PrWE = WEMem & HitDEV & !IntReq;
	
	// how to analysis this, think hard or translate the table given
	assign ExcCode =	(Ld && !(HitDEV || HitDM) && (ExcCodeM == 0)) ? 5'd4 :	// Memory Address Error
						(St && !(HitDEV || HitDM) && (ExcCodeM == 0)) ? 5'd5 :
						
						(Ld && (((width == `WORD) && (ResM[1:0] != 0)) || 
								((width == `HALF) && (ResM[0] != 0))) && (ExcCodeM == 0)) ? 5'd4 :	// load alignment
					
						(St && (((width == `WORD) && (ResM[1:0] != 0)) || 
								((width == `HALF) && (ResM[0] != 0))) && (ExcCodeM == 0)) ? 5'd5 :	// store alignment

						(Ld && (width != `WORD) && HitDEV && (ExcCodeM == 0)) ? 5'd4 :	// DEV can only read/write by word
						(St && (width != `WORD) && HitDEV && (ExcCodeM == 0)) ? 5'd5 :
						
						(St && HitDEV && (ResM[3:2] == 2'b10) && (ExcCodeM == 0)) ? 5'd5 : // store to the counter of TC
						ExcCodeM;
	
	// 1. after reset, there are several nops (which PC equals 0) in pipe-regs, 
	// 2. flush @M, stalled instr @E
	assign addr =	((PCM != 0) || (ExcCodeM == 4)) ? {PCM[31:2], 2'b0} :
					((PCE != 0) || (ExcCodeE == 4)) ? {PCE[31:2], 2'b0} :
					((PCD != 0) || (ExcCodeD == 4)) ? {PCD[31:2], 2'b0} :
					{PCF[31:2], 2'b0};
	
	assign BD =	((PCM != 0) || (ExcCodeM == 4)) ? BDM :
				((PCE != 0) || (ExcCodeE == 4)) ? BDE :
				((PCD != 0) || (ExcCodeD == 4)) ? BDD :
				1'b0;	// nop in D-stage gives the BD equals 0
	
	
	Control CtrlM(
    .instr(InstrM), 
    .WEMem(WEMem), 
    .width(width), 
    .LoadSign(LoadSign), 
    .WDSelM(WDSelM),
	
	.eret(eret), 
	.CP0WE(CP0WE), 
	.Ld(Ld),
	.St(St)
    );
	
	DM dm (
    .clk(clk), 
    .reset(reset),
	
    .WE(WEMem && HitDM && !IntReq), 
    .width(width), 
    .LoadSign(LoadSign), 

    .addr(ResM), 
    .WD(FwdM2), 
	
    .RD(MRD), 
    .WPC(PCM)
    );
	
	
	CP0 CP0 (
    .clk(clk), 
    .reset(reset), 
    .WE(CP0WE), 
    .addr(InstrM[15:11]),	// rd, gonna read/write
    .DIn(FwdM2), 
    .BD(BD), 
    .PC(addr[31:2]),	// macro PC
    
	.ExcCode(ExcCode), 
    .HWInt(HWInt), 
    .eret(eret), 
	
    .IntReq(IntReq), 
    .EPC(EPC), 
    .DOut(DOut)
    );

	


	
	assign A3MW = A3M;	// u may add a mux here for A3M === 5'bz
	// this bad logic
	assign WDMW = 	(WDSelM == 0)? WDM : 
					(WDSelM == 1 && HitDM)? MRD :
					(WDSelM == 1 && HitDEV)? PrRD :
					(WDSelM == 2'b10)? DOut :
					WDM;


endmodule
