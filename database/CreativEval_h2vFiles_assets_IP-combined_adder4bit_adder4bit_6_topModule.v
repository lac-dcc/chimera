// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top(A, B, Cin, Sum, Cout);
	input [3:0] A, B;
	input Cin;
	output [3:0] Sum;
	output Cout;
	wire [2:0]CO;
	full_adder F1(A[0], B[0],   Cin, Sum[0], CO[0]);
	full_adder F2(A[1], B[1], CO[0], Sum[1], CO[1]);
	full_adder F3(A[2], B[2], CO[1], Sum[2], CO[2]);
	full_adder F4(A[3], B[3], CO[2], Sum[3], Cout);
endmodule

module full_adder (a, b, cin, sum, cout);
	input a,b,cin;
	output sum, cout;
	assign sum  = (a^b)^cin;
	assign cout = ((a^b) ? cin : b);
endmodule

