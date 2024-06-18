// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 11/30/2019 04:51:46 PM
// Module Name: equalOrNot
// Description: When req rises, if x==y then equal rises 
//                              else notEqual rises.
//				Then fin rises.
// 
// Dependencies: oneEqual
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module equalOrNot #(parameter Width=32) (req,fin,equal,notEqual,x,y);
input req;
input [Width-1:0] x,y;
output wire equal,notEqual,fin;

reg [1:0] result=2'b00;

assign equal = result[1];
assign notEqual = result[0];
assign fin = (result==2'b01)|(result==2'b10);
wire start = ~fin;

always@(posedge req or posedge start) begin
	if(start) begin
		if(x==y) result<=2'b10;
		else result<=2'b01;
	end
	else result<=2'b00;
end

endmodule





