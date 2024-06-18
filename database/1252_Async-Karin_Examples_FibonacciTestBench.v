// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 11/27/2019 08:34:09 PM
// Module Name: FibonacciTestBench
// Top Level: fibonacci
// Description: 
// 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module FibonacciTestBench();
reg req=1'b0;
wire fin;
wire [31:0] result;
reg [31:0] N=32'd44;  // fibonacci[]={1,1,2,3,5,8...}, starts numbering from 0

initial begin
#100 req=1'b1;
end

fibonacci #(32) fibonacci (req,fin,N,result);

endmodule
