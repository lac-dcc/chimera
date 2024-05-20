// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top(A, B, Cin, S, Cout);

input [3:0] A,B;
input Cin;
output [3:0] S;
output Cout;
wire [3:1] C;

FA FA0(A[0], B[0], Cin, S[0], C[1]);
FA FA1(A[1], B[1], C[1], S[1], C[2]);
FA FA2(.Cin(C[2]), .S(S[2]), .A(A[2]), .Cout(C[3]), .B(B[2]));
FA FA3(A[3], B[3], C[3], S[3], Cout);

endmodule

module FA(A, B, Cin, S, Cout);

input A,B,Cin;
output S,Cout;
assign {Cout,S} = A+B+Cin;

endmodule