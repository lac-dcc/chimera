// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module FDSCell(
	input CK,
	input [3:0] D,
	output reg [3:0] Q = 4'd0
);

	always @(posedge CK)
		Q <= #1 D;

endmodule
