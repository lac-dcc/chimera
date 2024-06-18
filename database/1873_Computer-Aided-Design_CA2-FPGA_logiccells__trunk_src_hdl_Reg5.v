// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Reg5 (
    input [4 : 0]in,
	input ld,
	input clk,
	input rst,
	output [4 : 0]out
);
    
    Reg R1(.clk(clk), .rst(rst), .ld(ld), .in(in[0]), .out(out[0]));
    Reg R2(.clk(clk), .rst(rst), .ld(ld), .in(in[1]), .out(out[1]));
    Reg R3(.clk(clk), .rst(rst), .ld(ld), .in(in[2]), .out(out[2]));
    Reg R4(.clk(clk), .rst(rst), .ld(ld), .in(in[3]), .out(out[3]));
    Reg R5(.clk(clk), .rst(rst), .ld(ld), .in(in[4]), .out(out[4]));
    
endmodule