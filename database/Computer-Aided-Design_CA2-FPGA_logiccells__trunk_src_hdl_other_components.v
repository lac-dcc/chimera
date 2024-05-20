// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module And(A, B, out);
	input A;
	input B;

	output out;

	C1 c(.A(2'b0), .SA(1'b0), .B({B, B}), .SB(B), .S({A, A}), .out(out));
endmodule

module Or(A, B, out);
	input A;
	input B;

	output out;

	C1 c(.A({B, B}), .SA(B), .B(2'b11), .SB(1'b1), .S({A, A}), .out(out));
endmodule

module Xor(A, B, out);
	input A;
	input B;

	output out;

	C2 c(.D(4'b0110), .A({A, B}), .B({A, B}), .out(out));
endmodule

module Not(A, out);
	input A;

	output out;

	C2 c(.D(4'b0010), .A({A, 1'b1}), .B({A, 1'b1}), .out(out));
endmodule

module And3(A, B, C, out);
	input A;
	input B;
	input C;

	output out;

	wire tmp1;

	And and1(.A(A), .B(B), .out(tmp1));
	And and2(.A(tmp1), .B(C), .out(out));
endmodule

module Or3(A, B, C, out);
	input A;
	input B;
	input C;

	output out;

	wire tmp1;

	Or or1(.A(A), .B(B), .out(tmp1));
	Or or2(.A(tmp1), .B(C), .out(out));
endmodule

module And4(input A, B, C, D, output out);

	wire tmp1;
	wire tmp2;

	And and1(.A(A), .B(B), .out(tmp1));
	And and2(.A(C), .B(D), .out(tmp2));
	And and3(.A(tmp1), .B(tmp2), .out(out));
endmodule

module Or4(input A, B, C, D, output out);

	wire tmp1;
	wire tmp2;

	Or or1(.A(A), .B(B), .out(tmp1));
	Or or2(.A(C), .B(D), .out(tmp2));
	Or or3(.A(tmp2), .B(tmp1), .out(out));
endmodule

module Mux2_1_1(A, B, S, out);
	input A;
	input B;
	input S;

	output out;

	C2 c(.D({A, B, A, B}), .A({S, 1'b1}), .B({S, 1'b1}),.out(out));
endmodule

module HalfAdder(A, B, sum, carry);
	input A;
	input B;
	output sum;
	output carry;

	Xor xor1(.A(A), .B(B), .out(sum));
	And and1(.A(A), .B(B), .out(carry));
endmodule

module FullAdder(A, B, carry_in, sum, carry_out);

    input A;
    input B;
    input carry_in;
	output sum;
	output carry_out;

    wire c1,c2, axb ;

    HalfAdder H1(.A(A), .B(B), .sum(axb), .carry(c1));
    HalfAdder H2(.A(axb), .B(carry_in), .sum(sum), .carry(c2));
    Or or1(.A(c1), .B(c2), .out(carry_out));
    
endmodule

module Reg(clk, rst, ld, in, out);
	input clk;
	input rst;
	input ld;
	input in;

	output out;

	S2 s(.clk(clk), .rst(rst), .D({in, in, in, out}), .A({ld, 1'b0}), .B({ld, 1'b0}), .out(out));
endmodule

module DFF (input D, clk, rst, output Q);
	S2 dff(.clk(clk), .rst(rst), .D({1'bz,1'bz ,1'bz , D}), .A(2'b00), .B(2'b00), .out(Q));
endmodule

