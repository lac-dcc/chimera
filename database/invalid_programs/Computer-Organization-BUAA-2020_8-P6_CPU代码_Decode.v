`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:19:08 11/25/2020 
// Design Name: 
// Module Name:    Decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "macros.v"
module Decode(
    input clk,
    input reset,
	
	input [31:0] PCF,
    input [31:0] PCD,
    input [31:0] InstrD,
	
    input [31:0] FwdD1,
    input [31:0] FwdD2,
	
	// Write GRF
	input [31:0] WDW,
    input [4:0] A3W,
    input [31:0] PCW,	// from the WB-Stage
	
	
	
    output [31:0] RD1DE,
    output [31:0] RD2DE,
	
    output [31:0] imm32DE,
	
    output [4:0] A3DE,
    output [31:0] WDDE,
	
    output [31:0] NPC,
	
	// stall signals
	output MD, // instr here gonna use MDU
	output D1Use,
	output D2Use
    );
	
	wire [31:0] PCD8 = PCD +8;
	
	// Decode the InstrD
	// built in Decoder(Control)
	
	wire [4:0] op, funct;
	assign op = InstrD[`op];
	assign funct = InstrD[`funct];
	
	wire eq,eqz,ltz;
	wire branch, JType, JReg;
	wire sign;
	
	wire WDSelD;		// WriteData Select
	
	Control CtrlD (
    .instr(InstrD), 
	
    .eq(eq), 
    .eqz(eqz), 
    .ltz(ltz), 

    .sign(sign), 
	
    .branch(branch), 
    .JType(JType), 
    .JReg(JReg), 
	
    .WDSelD(WDSelD), // if link-instr, set 1
    .A3DE(A3DE),	// output A3DE
	
	// stall signals
	.D1Use(D1Use),
	.D2Use(D2Use),
	.MD(MD)
    );
	
	// RegWrite Unit
	// WriteData DtoE
	assign WDDE = (WDSelD == 1)? PCD8 : 32'bz;
			
	// Ext Unit
	EXT ext (
    .imm16(InstrD[`imm16]), 
    .sign(sign), 
    .imm32(imm32DE)	// output imm32DE
    );
	
	// CMP Unit
	CMP cmp (
    .A(FwdD1), 
    .B(FwdD2), 
    .eq(eq), 
    .eqz(eqz), 
    .ltz(ltz)
    );
	
	// NPC Unit
	NPC npc(
    .branch(branch), 
    .JType(JType),
    .JReg(JReg),
	
    .PCF(PCF), 
    .PCD(PCD), 
    .imm26D(InstrD[`imm26]), 
    .RegJump(FwdD1), 
    .NPC(NPC)
    );
	// GRF Unit
	GRF grf (
    .clk(clk), 
    .reset(reset), 
	
    .A1(InstrD[`rs]), 
    .A2(InstrD[`rt]), 
    .A3(A3W), 
	
    .WD(WDW), 
    .RD1(RD1DE), 
    .RD2(RD2DE), 
	
    .PC(PCW)	// the pre-test requires
    );
	
endmodule
