// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// Flip-Flop for Counter
// furrtek 2022

`timescale 1ns/100ps

module C11(
	input CK,
	input D,
	input L,
	input nCL,
	input TG,
	output reg Q,
	output XQ
);

wire CL = ~nCL;

always @(posedge CK or posedge CL) begin
	if (CL) begin
		Q <= 1'b0;		// Clear
	end else begin
		if (L)
			Q <= D;		// Load
		else
			if (TG)
				Q <= ~Q;	// Toggle
	end
end
	
assign XQ = ~Q;

endmodule
