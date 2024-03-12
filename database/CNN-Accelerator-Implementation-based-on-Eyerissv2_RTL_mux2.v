`timescale 1ns / 1ps

module mux2 #( parameter WIDTH = 16)
	(
    input [WIDTH-1:0] a_in,
    input [WIDTH-1:0] b_in,
    input sel,
    output [WIDTH-1:0] out
    );
	
	assign out = sel ? a_in : b_in;
	
endmodule
