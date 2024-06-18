// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module C1(A, B, S, SA, SB, out);
	input [1 : 0]A;
	input [1 : 0]B;
	input [1 : 0]S;
	input SA;
	input SB;

	output out;

	wire F1;
	wire F2;
	wire S2;

	BasicMux2 mux1(.A(A[0]), .B(A[1]), .S(SA), .out(F1));
	BasicMux2 mux2(.A(B[0]), .B(B[1]), .S(SB), .out(F2));
	BasicOr or_(.A(S[0]), .B(S[1]), .out(S2));
	BasicMux2 mux3(.A(F1), .B(F2), .S(S2), .out(out));
endmodule

module C2(D, A, B, out);
	input [3 : 0]D;
	input [1 : 0]A;
	input [1 : 0]B;

	output out;

	wire S1;
	wire S0;

	BasicMux4 mux(.A(D[0]), .B(D[1]), .C(D[2]), .D(D[3]), .S({S1, S0}), .out(out));
	BasicOr or_(.A(A[1]), .B(B[1]), .out(S1));
	BasicAnd and_(.A(A[0]), .B(B[0]), .out(S0));
endmodule

module S1(clk, D, A, B, rst, out);
	input clk,rst;
	input [3 : 0]D;
	input [1 : 0]A;
	input [1 : 0]B;
	output out;

	wire S1;
	wire S0;
	wire mux_out;

	BasicMux4 mux(.A(D[0]), .B(D[1]), .C(D[2]), .D(D[3]), .S({S1, S0}), .out(mux_out));
	BasicOr or_(.A(A[1]), .B(B[1]), .out(S1));
	BasicAnd and_(.A(A[0]), .B(rst), .out(S0));
	FlipFlop flip_flop(.clk(clk), .rst(rst), .in(mux_out), .out(out));
endmodule

module S2(clk, D, A, B, rst, out);
	input clk,rst;
	input [3 : 0]D;
	input [1 : 0]A;
	input [1 : 0]B;

	output out;

	wire S1;
	wire S0;
	wire mux_out;

	BasicMux4 mux(.A(D[0]), .B(D[1]), .C(D[2]), .D(D[3]), .S({S1, S0}), .out(mux_out));
	BasicOr or_(.A(A[1]), .B(B[1]), .out(S1));
	BasicAnd and_(.A(A[0]), .B(B[0]), .out(S0));
	FlipFlop flip_flop(.clk(clk), .rst(rst), .in(mux_out), .out(out));
endmodule