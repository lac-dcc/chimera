// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module FDS16bit(
	input CK,
	input [15:0] D,
	output [15:0] Q
);

	FDSCell CellA(CK, D[3:0], Q[3:0]);
	FDSCell CellB(CK, D[7:4], Q[7:4]);
	FDSCell CellC(CK, D[11:8], Q[11:8]);
	FDSCell CellD(CK, D[15:12], Q[15:12]);
	
endmodule
