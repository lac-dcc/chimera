`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:44 11/25/2020 
// Design Name: 
// Module Name:    MemWB 
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
module MEMWB(
    input clk,
    input reset,
	input flush,
	
    input [31:0] PCM,
	input [31:0] InstrM,
    input [4:0] A3M,
    input [31:0] WDM,
	
    output reg [31:0] PCW,
	output reg [31:0] InstrW,
    output reg [4:0] A3W,
    output reg [31:0] WDW,
	
	output [32*8-1:0] DeInstrW
    );
	initial begin
		PCW = 0;
		InstrW = 0;
		A3W = 0;
		WDW = 0;
	end
	
	always@(posedge clk) begin
		if(reset || flush) begin
			PCW = 0;
			InstrW = 0;
			A3W = 0;
			WDW = 0;
		end
		else begin
			PCW = PCM;
			InstrW = InstrM;
			A3W = A3M;
			WDW = WDM;
		end
	end
	
	
	DASM DeInstr (	// decode the instrution 
	.pc(PCW), 
	.instr(InstrW), 
	.reg_name(0),
	.asm(DeInstrW)
	);
endmodule
