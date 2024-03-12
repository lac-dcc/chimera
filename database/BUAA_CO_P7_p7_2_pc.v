`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:00 11/23/2018 
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
    input clk,
    input reset,
	 input en,
	 input[31:0] next_pc,
    output reg[31:0] pc,
	 output [4:0] excode_F
    );

	initial begin
		pc<=32'h00003000;
	end
	
	assign excode_F = ((pc[1:0]!=2'b00)||(pc < 32'h00003000)||(pc > 32'h00004ffc)) ? 4 : 0;
	
	always@(posedge clk) begin
		if(reset) begin
			pc <= 32'h00003000;
		end
		else if(en) begin
			pc <= next_pc;
		end
		else begin
			pc <= pc;
		end
	end
endmodule
