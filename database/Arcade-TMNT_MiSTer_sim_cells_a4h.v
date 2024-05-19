// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// 4-bit Full Adder
// furrtek 2022

`timescale 1ns/100ps

module A4H(
	input [3:0] A,
	input [3:0] B,
	input CIN,
	output [3:0] S,
	output CO
);

assign {CO, S} = A + B + {3'd0, CIN};	// tmax = 8.2ns

endmodule
