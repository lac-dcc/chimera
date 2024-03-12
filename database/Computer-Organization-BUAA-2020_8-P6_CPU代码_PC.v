`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hello Verilog
// 
// Create Date:    16:21:08 11/17/2020 
// Module Name:    PC 
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////
`define PC_DEFAULT	32'h0000_3000

module PC(
    input clk,
    input reset,
	input en,
    input [31:0] NPC,
    output reg [31:0] PC
    );
	initial begin
		PC = `PC_DEFAULT;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			PC <= `PC_DEFAULT;
		end
		else if (en) begin
			PC <= NPC;
		end
	end
endmodule
