`timescale 1ns/1ns

// 64K backup RAM (2x 120ns 32768*8bit RAM)

module sram(
	inout [15:0] M68K_DATA,
	input [14:0] M68K_ADDR,
	input nWEL,
	input nWEU,
	input nOEL,
	input nOEU,
	input nCE
);

	sram_l SRAML(M68K_ADDR, M68K_DATA[7:0], nCE, nOEL, nWEL);
	sram_u SRAMU(M68K_ADDR, M68K_DATA[15:8], nCE, nOEU, nWEU);

endmodule
