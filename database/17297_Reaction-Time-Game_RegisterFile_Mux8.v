// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef Mux8
`define Mux8

module Mux8(S2, S1, S0, W7, W6, W5, W4, W3, W2, W1, W0, F);
	input [12:0] W0;
	input [12:0] W1;
	input [12:0] W2;
	input [12:0] W3;
	input [12:0] W4;
	input [12:0] W5;
	input [12:0] W6;
	input [12:0] W7;
	
	input S2;
	input S1;
	input S0;

	wire [12:0] SW1;
	wire [12:0] SW2;
	wire [12:0] SW3;
	wire [12:0] SW4;

	wire [12:0] ST1;
	wire [12:0] ST2;
	
	output [12:0] F;
	
	assign SW1 = S0 ? W1 : W0;
	assign SW2 = S0 ? W3 : W2;
	assign SW3 = S0 ? W5 : W4;
	assign SW4 = S0 ? W7 : W6;
	
	assign ST1 = S1 ? SW2 : SW1;
	assign ST2 = S1 ? SW4 : SW3;
	
	assign F = S2 ? ST2 : ST1;
	
endmodule

`endif