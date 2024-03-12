`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:25:01 11/25/2020 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
    input clk,
    input reset,
    input EnPC,
	
	// guides PC
	input IntReq,	// interruption request
	input eret,		// back to pipeline
	
    input [31:0] NPC,	// pipe PC, normal PC
	input [31:0] EPC,
	
	
    output [31:0] InstrF,
    output [31:0] PCF,
	
	output [6:2] ExcCodeFD,	// may change in other stages, so called "F to D"(FD)
	
	output [32*8-1:0] DeInstrF
    );
	
	wire [31:0] PCIn, PCOut;
	wire [31:0] InstrIM;
	
	// select from NPC(@ Decode), IntPC, EretPC
	assign PCIn = 	eret? 	EPC :	// priority eret/IntReq > NPC(branch/J)
					IntReq?	32'h4180 :
					NPC;


	PC pc (
    .clk(clk), 
    .reset(reset), 
    .en(EnPC), 
    .In(PCIn), 
    .Out(PCOut)
    );
	
	IM im(
    .PC(PCOut), 
    .instr(InstrIM)
    );
	
	assign PCF = PCOut;
	assign InstrF = (ExcCodeFD == 5'b0) ? InstrIM : 0;	// set nop if exc
	
	assign ExcCodeFD = ((PCOut[1:0] != 2'b0) || (PCOut < 32'h3000) || (PCOut > 32'h4ffc))? 5'd4 : 5'b0;

	
	
	DASM DeInstr (	// decode the instrution 
		.pc(PCOut), 
		.instr(InstrF), 
		.reg_name(0),
		.asm(DeInstrF)
	);
endmodule
