// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// DFF with RESET
// furrtek 2022

`timescale 1ns/100ps

module FDO(
	input CK,
	input D,
	input nR,
	output reg Q,
	output nQ
);

always @(posedge CK or negedge nR) begin
	if (!nR)
		Q <= 1'b0;	// tmax = 2.8ns
	else
		Q <= D;		// tmax = 6.0ns
end

assign nQ = ~Q;

endmodule
