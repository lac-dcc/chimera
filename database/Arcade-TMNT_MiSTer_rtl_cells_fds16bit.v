// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// Grouped positive Edge Clocked 4-bit DFFs
// furrtek 2022

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
