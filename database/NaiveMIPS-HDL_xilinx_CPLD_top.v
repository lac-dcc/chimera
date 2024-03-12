`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:04 11/15/2015 
// Design Name: 
// Module Name:    top 
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
module top(
input wire clk,
input wire rxd,
output wire txd,
input wire exp1,
output wire exp2,
inout wire[3:0] interconn
    );

assign txd = interconn[0];
assign interconn[1] = rxd;

assign exp2 = interconn[2];
assign interconn[3] = exp1;

endmodule
