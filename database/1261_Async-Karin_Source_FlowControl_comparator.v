// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 11/30/2019 04:51:46 PM
// Module Name: comparator
// Description: When the req rises, this module compares x and y, 
//				output the result to bigger, equal and smaller. Then fin rises.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module comparator #(parameter Width=32) (req,fin,x,y,bigger,equal,smaller);
input req;
input [Width-1:0] x,y;
output wire fin;
output wire bigger,equal,smaller;

wire start;
reg [2:0] result=3'b000;
reg rec=1'b0;

assign fin = (result==3'b100)|(result==3'b010)|(result==3'b001);
assign start = rec&(~fin);
assign {bigger,equal,smaller} = result;

always@(posedge req or posedge start) begin
   if(start) begin
        rec<=1'b0;
		if(x>y) result<=3'b100;
		else if(x<y) result<=3'b001;
		else result<=3'b010;
	end
	else begin
	    rec<=1'b1;
		result<=3'b000;
	end
end

endmodule





