// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`include "mult_selector.v"

module mult_top 
#(	parameter integer WIDTH = 8,
	parameter integer PIPELINED = 0,
	parameter GENERATE_PROCEDURALS = 0
)
(
	input [WIDTH-1:0] a_top, b_top,
	input clk, clr_n,
	output [(WIDTH*2)-1:0] result_top
);

//  PIPELINED = 0 if non-pipelined design is wanted, 1 otherwise
//	AWIDTH, BDWITH = bit width of operands
mult_selector #(.PIPELINED(PIPELINED), .WIDTH(WIDTH), .GENERATE_PROCEDURALS(GENERATE_PROCEDURALS))
uut (.clk(clk), .clr_n(clr_n), .a(a_top), .b(b_top), .result(result_top));
		
endmodule
