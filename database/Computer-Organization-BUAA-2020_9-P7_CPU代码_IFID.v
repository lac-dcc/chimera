`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:32:43 11/25/2020 
// Design Name: 
// Module Name:    IFID 
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
module IFID(

    input clk,
    input en,
    input reset,
	input flush,
	
	// PC above instr
    input [31:0] PCF,
    input [31:0] InstrF,
	
	// to detect/process the Exc
	input BDF,	// the Instruction ahead gonna branch/jump
	input [6:2] ExcCodeF,
	
	// 1. Decode use it
	// 2. the Fwd in hzd use it
    output reg [31:0] PCD,
    output reg [31:0] InstrD,
	
	// Exc
	output reg BDD,
	output reg [6:2] ExcCodeD,
	
	output [32*8-1:0] DeInstrD
    );
	
	initial begin
		InstrD = 0;
	end
	always@(posedge clk) begin
		if (reset || flush) begin
			PCD = 0;
			InstrD = 0;
			
			BDD = 0;
			ExcCodeD = 0;
		end
		else if (en) begin
			PCD <= PCF;
			InstrD <= InstrF;
			
			BDD <= BDF;
			ExcCodeD <= ExcCodeF;
			
		end
	end
	
	DASM DeInstr (	// decode the instrution 
		.pc(PCD), 
		.instr(InstrD), 
		.reg_name(0),
		.asm(DeInstrD)
	);
endmodule
