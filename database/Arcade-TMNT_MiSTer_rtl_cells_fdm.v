// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// DFF
// furrtek 2022

`timescale 1ns/100ps

module FDM(
	input CK,
	input D,
	output reg Q,
	output nQ
);

always @(posedge CK)
		Q <= D;		// tmax = 6.0ns

assign nQ = ~Q;

endmodule
