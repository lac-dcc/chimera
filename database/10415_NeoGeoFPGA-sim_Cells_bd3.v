// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module BD3(
	input INPT,
	output OUTPT
);

	assign #5 OUTPT = INPT;

endmodule
