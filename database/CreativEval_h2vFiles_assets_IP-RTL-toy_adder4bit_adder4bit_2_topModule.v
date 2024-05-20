// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

// Adder 4-bit

module top (SW, LEDG);

	input [8:0] SW;
	output [4:0] LEDG;
	wire [3:0]S;
	wire [4:0]C;
	assign C[0]=SW[8];
	Full_Adder F0(SW[0],SW[4],C[0],S[0],C[1]);
	Full_Adder F1(SW[1],SW[5],C[1],S[1],C[2]);
	Full_Adder F2(SW[2],SW[6],C[2],S[2],C[3]);
	Full_Adder F3(SW[3],SW[7],C[3],S[3],C[4]);
	assign LEDG[4:0]={C[4],S[3:0]};

endmodule


module Full_Adder(A, B, Cin, S, Cout);

input A,B,Cin;
output S,Cout;
assign {Cout,S} = A+B+Cin;

endmodule