// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Reg10 (
    input [9 : 0]in,
	input ld,
	input clk,
	input rst,
	output [9 : 0]out
);
    
    Reg R1(.clk(clk), .rst(rst), .ld(ld), .in(in[0]), .out(out[0]));
    Reg R2(.clk(clk), .rst(rst), .ld(ld), .in(in[1]), .out(out[1]));
    Reg R3(.clk(clk), .rst(rst), .ld(ld), .in(in[2]), .out(out[2]));
    Reg R4(.clk(clk), .rst(rst), .ld(ld), .in(in[3]), .out(out[3]));
    Reg R5(.clk(clk), .rst(rst), .ld(ld), .in(in[4]), .out(out[4]));
    Reg R6(.clk(clk), .rst(rst), .ld(ld), .in(in[5]), .out(out[5]));
    Reg R7(.clk(clk), .rst(rst), .ld(ld), .in(in[6]), .out(out[6]));
    Reg R8(.clk(clk), .rst(rst), .ld(ld), .in(in[7]), .out(out[7]));
    Reg R9(.clk(clk), .rst(rst), .ld(ld), .in(in[8]), .out(out[8]));
    Reg R10(.clk(clk), .rst(rst), .ld(ld), .in(in[9]), .out(out[9]));
    
endmodule