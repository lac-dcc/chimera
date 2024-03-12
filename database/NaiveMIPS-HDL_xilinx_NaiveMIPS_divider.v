`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:27 11/13/2015 
// Design Name: 
// Module Name:    divider 
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
module divider(
    input aclr,
    input clken,
    input clock,
    input [31:0] denom,
    input [31:0] numer,
    output [31:0] quotient,
    output [31:0] remain
    );

div_gen_v3_0 x_div(
  .rfd(), .sclr(aclr), .ce(clken), .clk(clock), .dividend(numer), .quotient(quotient), .divisor(denom), .fractional(remain)
);
endmodule
