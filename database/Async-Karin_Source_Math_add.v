// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/02/2019 09:13:54 PM
// Module Name: add
// Description: When req rises, x+y -> so, 
//					      Carry Out -> couto. Then fin rises.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Revision 0.02 - Faster
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module add #(parameter Width=32) (req,fin,x,y,so,couto);
input req;
input [Width-1:0] x,y;
output reg fin=1'b0;
output reg [Width-1:0] so=0;
output reg couto=1'b0;

wire [Width-1:0]s;
wire cout;
assign {cout,s} = x+y;

wire req2;

delayOne delay1 (req,req2);

always@(posedge req2 or posedge fin) begin
	if(fin) begin
		fin<=1'b0;
		so<=so;
		couto<=couto;
	end
	else begin
		fin<=1'b1;
		so<=s;
		couto<=cout;
	end
end	

endmodule

