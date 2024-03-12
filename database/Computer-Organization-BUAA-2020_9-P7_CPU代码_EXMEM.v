`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:25 11/25/2020 
// Design Name: 
// Module Name:    EXMEM 
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
module EXMEM(
    input clk,
	input reset,
    input flush,
	
    input [31:0] PCE,
    input [31:0] InstrE,
	
    input [4:0] A3E,
    input [31:0] WDE,
	input [31:0] ResE,
    input [31:0] RD2E,
	
	input BDE,
	input [6:2] ExcCodeE,
	
	/******** output ******/
    output reg [31:0] PCM,
    output reg [31:0] InstrM,
	
    output reg [4:0] A3M,
    output reg [31:0] WDM,
	output reg [31:0] ResM,
    output reg [31:0] RD2M,
	
	output reg BDM,
	output reg [6:2] ExcCodeM,
	
	output [32*8-1:0] DeInstrM
    );
	initial begin
		PCM = 0;
		InstrM = 0;
		A3M = 0;
		WDM = 0;
		RD2M = 0;
		ResM = 0;
		BDM = 0;
		ExcCodeM = 0;
	end
	
	always@(posedge clk) begin
		if(reset || flush) begin
			PCM = 0;
			InstrM = 0;
			A3M = 0;
			WDM = 0;
			ResM = 0;
			RD2M = 0;
			
			BDM = 0;
			ExcCodeM = 0;
		end
		else begin
			PCM = PCE;
			InstrM = InstrE;
			A3M = A3E;
			WDM = WDE;
			ResM = ResE;
			RD2M = RD2E;
			
			BDM = BDE;
			ExcCodeM = ExcCodeE;
		end
	end

	DASM DeInstr (	// decode the instrution 
	.pc(PCM), 
	.instr(InstrM), 
	.reg_name(0),
	.asm(DeInstrM)
	);
endmodule
