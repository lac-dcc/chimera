`timescale 1ns / 1ps
module NAND_from_AND_n_NOT (c,a,b);

//declare port signals
	output c;
	input a,b;

//declare internal wire
	wire d;

//instantiate structural logic gates
//d = output, a and b = input
	and a1(d,a,b);
// c = output, d = input
	not(c,d);
endmodule