// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// Buffer (Delay Cell)
// furrtek 2022

`timescale 1ns/100ps

module BD3(
	input INPT,
	output OUTPT
);

	assign #12 OUTPT = INPT;	// tmax = 11.8ns

endmodule
