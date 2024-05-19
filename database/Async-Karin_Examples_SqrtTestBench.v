// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/07/2019 08:34:09 PM
// Module Name: SqrtTestBench
// Top Level: sqrt
// Description: 
// 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SqrtTestBench();
reg req=1'b0;
//reg clk=1'b1;
wire fin;
reg [31:0] in=32'd10454520;  // change the input number as you like
wire [31:0] out; 

initial begin
#100 req=1'b1;
end
/*
always begin
#5 clk=~clk;
end
*/
sqrt #(32) sqrt (req,fin,in,out);
//sqrtIP sqrtIP (clk,req,in,fin,out);
endmodule
