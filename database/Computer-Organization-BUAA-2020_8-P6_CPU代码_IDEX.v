`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:20 11/25/2020 
// Design Name: 
// Module Name:    IDEX 
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
module IDEX(  
	input clk,
	input en,
    input flush,
    input reset,
	
    input [31:0] PCD,
    input [31:0] InstrD,
    
    input [31:0] RD1D,
    input [31:0] RD2D,
    input [31:0] imm32D,
	
    input [4:0] A3D,
    input [31:0] WDD,
	
    output reg [31:0] PCE,
	output reg [31:0] InstrE,
    
    output reg [31:0] RD1E,
    output reg [31:0] RD2E,
    output reg [31:0] imm32E,
	
    output reg [4:0] A3E,
    output reg [31:0] WDE,
	
	output [32*8-1:0] DeInstrE
    );
	
	initial begin
		PCE <= 0;
		InstrE <= 0;
		RD1E <= 0;
		RD2E <= 0;
		imm32E <= 0;
		A3E <= 0;
		WDE <= 0;
	end
	
	always@(posedge clk) begin
		if(reset || flush) begin
			PCE <= 0;
			InstrE <= 0;
			RD1E <= 0;
			RD2E <= 0;
			imm32E <= 0;
			A3E <= 0;
			WDE <= 0;
		end
		else if (en) begin
			PCE <= PCD;
			InstrE <= InstrD;
			RD1E <= RD1D;
			RD2E <= RD2D;
			imm32E <= imm32D;
			A3E <= A3D;
			WDE <= WDD;
		end
	end
	
	DASM DeInstr (	// decode the instrution 
		.pc(PCE), 
		.instr(InstrE), 
		.reg_name(0),
		.asm(DeInstrE)
	);
endmodule
