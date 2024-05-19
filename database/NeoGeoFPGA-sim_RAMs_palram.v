// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

// 16K palette RAM (2x 100ns 8192*8bit RAM)

module palram(
	input [12:0] ADDR,
	inout [15:0] PC,
	input nPALWE
);

	palram_l PRAML(ADDR, PC[7:0], 1'b0, 1'b0, nPALWE);
	palram_u PRAMU(ADDR, PC[15:8], 1'b0, 1'b0, nPALWE);

endmodule
