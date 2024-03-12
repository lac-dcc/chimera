`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:07 12/15/2018 
// Design Name: 
// Module Name:    ExcCode 
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
module ExcCode(
    input clk,
    input reset,
	 input en,
    input [4:0] ExcCodeIn,
    output reg[4:0] ExcCodeOut
    );

	initial begin
		ExcCodeOut<=0;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			ExcCodeOut<=0;
		end
		else if(en) begin
			ExcCodeOut<=ExcCodeIn;
		end
	end
endmodule
