`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:54 11/16/2018 
// Design Name: 
// Module Name:    pc 
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
module pc(
    input [31:0] next_pc,
    input clk,
    input reset,
    output reg[31:0] pc
    );

	always@(posedge clk) begin
		if(reset) begin
			pc <= 32'h00003000;
		end
		else begin
			pc <= next_pc;
		end
	end
endmodule
