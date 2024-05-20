// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top (C, HEX0);
	input [2:0] C;
	output [6:0] HEX0;
	wire [2:0] SW;
	assign SW = C[2:0];
	assign HEX0[0] = C[2];
	assign HEX0[1] = C[0] & ~C[1];
	assign HEX0[2] = C[0] & C[2];
	assign HEX0[3] = C[2] | (C[1] & C[0]);
	assign HEX0[4] = C[2] | (C[1] & C[0]);
	assign HEX0[5] = (C[0] & C[1]) |  (C[0] & C[2]);
	assign HEX0[6] = (C[0] & C[1]) | (C[0] & C[2]) | (~C[0] & ~C[1] & ~C[2]);
endmodule
