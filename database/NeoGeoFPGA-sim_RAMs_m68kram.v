// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

// 64K 68000 work RAM (2x 120ns 32768*8bit RAM)

module ram_68k(
	input [15:1] M68K_ADDR,
	inout [15:0] M68K_DATA,
	input nWEL,
	input nWEU,
	input nOEL,
	input nOEU
);

	ram68k_l RAM68KL(M68K_ADDR, M68K_DATA[7:0], 1'b0, nOEL, nWEL);
	ram68k_u RAM68KU(M68K_ADDR, M68K_DATA[15:8], 1'b0, nOEU, nWEU);

endmodule
