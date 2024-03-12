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
    input [31:0] NPC,
	
	
    output [31:0] InstrF,
    output [31:0] PCF,
	output [32*8-1:0] DeInstrF
    );
	
	wire[31:0] PC;
	
	PC pc (
    .clk(clk), 
    .reset(reset), 
    .en(EnPC), 
    .NPC(NPC), 
    .PC(PC)
    );
	
	IM im(
    .PC(PC), 
    .instr(InstrF)
    );
	
	assign PCF = PC;
	
	DASM DeInstr (	// decode the instrution 
	.pc(PC), 
	.instr(InstrF), 
	.reg_name(0),
	.asm(DeInstrF)
	);
endmodule
