// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// 4-bit Binary Synchronous Up Counter
// furrtek 2022

`timescale 1ns/100ps

module C43(
	input CK,
	input [3:0] D,
	input nL, EN, CI, nCL,
	output reg [3:0] Q = 4'd0,
	output CO
);

	always @(posedge CK or posedge ~nCL) begin
		if (!nL)
			Q <= D;			// Load
		else if (!nCL)
			Q <= 4'd0;		// Clear tmax = 9.7ns
		else if (EN & CI)
			Q <= Q + 1'b1;	// Count tmax = 13.4ns
		else
			Q <= Q;
	end
	
	assign CO = &{Q[3:0], CI};

endmodule
