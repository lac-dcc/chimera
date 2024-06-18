// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

`timescale 1ns/1ps

module BasicAnd(A, B, out);
	input A;
	input B;
	output out;
	assign #0.5 out = A & B;
endmodule

module BasicOr(A, B, out);
	input A;
	input B;
	output out;
	assign #0.5 out = A | B;
endmodule

module BasicMux2(A, B, S, out);
	input A;
	input B;
	input S;
	output out;
	assign #1 out = S ? B : A;
endmodule

module BasicMux4(A, B, C, D, S, out);
	input A;
	input B;
	input C;
	input D;
	input [1 : 0]S;
	output reg out;

	always @(*)
	begin
		#2;
		case(S)
			2'b00: out = A;
			2'b01: out = B;
			2'b10: out = C;
			2'b11: out = D;
		endcase
	end
endmodule

module FlipFlop(clk, rst, in, out);
	input clk;
	input rst;
	input in;
	output reg out;

	always @(posedge clk, posedge rst) begin
		if (rst)
			out = 0;
		else
			out = in;
	end
endmodule