`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:08 11/17/2020 
// Design Name: 
// Module Name:    PC 
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
`define PC_DEFAULT	32'h0000_3000

module PC(
    input clk,
    input reset,
    input [31:0] NPC,
    output reg [31:0] PC
    );
	initial begin
		PC = `PC_DEFAULT;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			PC = `PC_DEFAULT;
		end
		else begin
			PC = NPC;
		end
	end


endmodule
