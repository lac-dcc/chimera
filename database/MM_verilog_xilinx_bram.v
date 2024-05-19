// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

// Generic 32-bit Xilinx Spartan-6 (true) dual-port BRAM module
`timescale 1ns / 1ps
`default_nettype none
`include "mm_defines.vh"
module bram #(
	parameter size = 16384, // bytes, valid range: 2048, 4096, 8192, 16384, 32768, 65536
	parameter name = "irom" // only for BMM generation
) (
	input wire ClockA, ClockB,
	input wire ResetA, ResetB,
	input wire [31:0] AddressA, AddressB,
	input wire [31:0] DataInA, DataInB,
	output wire [31:0] DataOutA, DataOutB,
	input wire ClockEnA, ClockEnB,
	input wire WriteA, WriteB
);
localparam N = size * 8 /* bits/bytes */ / 16384 /* bits/BRAM */;
localparam words = size / 4 /* 4 byte/word */;
localparam Log2Words = log2(words);
localparam bitwidth = 32 /* 32-bit data width */ / N; // par BRAM
localparam Log2bitwidth = log2(bitwidth);

generate
	genvar i;
	for (i = 0; i < N; i = i + 1) begin: gen_bram
		RAMB16BWER #(
			// DATA_WIDTH_A/DATA_WIDTH_B: 0, 1, 2, 4, 9, 18, or 36
			.DATA_WIDTH_A(9 * (bitwidth / 8) + (bitwidth < 8) * bitwidth),
			.DATA_WIDTH_B(9 * (bitwidth / 8) + (bitwidth < 8) * bitwidth),
			// DOA_REG/DOB_REG: Optional output register (0 or 1)
			.DOA_REG(0),
			.DOB_REG(0),
			// EN_RSTRAM_A/EN_RSTRAM_B: Enable/disable RST
			.EN_RSTRAM_A("TRUE"),
			.EN_RSTRAM_B("TRUE"),
			// INIT_A/INIT_B: Initial values on output port
			.INIT_A(36'h000000000),
			.INIT_B(36'h000000000),
			// INIT_FILE: Optional file used to specify initial RAM contents
			.INIT_FILE("NONE"),
			// RSTTYPE: "SYNC" or "ASYNC"
			.RSTTYPE("SYNC"),
			// RST_PRIORITY_A/RST_PRIORITY_B: "CE" or "SR"
			.RST_PRIORITY_A("SR"),
			.RST_PRIORITY_B("SR"),
			.SIM_DEVICE("SPARTAN6")
		) bram (
			// Port A Data: 32-bit (each) output: Port A data
			.DOA(DataOutA[31-i*bitwidth:31-(i+1)*bitwidth+1]), // 32-bit output: A port data output
			.DOPA(), // 4-bit output: A port parity output
			// Port B Data: 32-bit (each) output: Port B data
			.DOB(DataOutB[31-i*bitwidth:31-(i+1)*bitwidth+1]), // 32-bit output: B port data output
			.DOPB(), // 4-bit output: B port parity output
			// Port A Address/Control Signals: 14-bit (each) input: Port A address and control signals
			.ADDRA({AddressA[Log2Words-1:0], {Log2bitwidth{1'b0}}}), // 14-bit input: A port address input
			.CLKA(ClockA), // 1-bit input: A port clock input
			.ENA(ClockEnA), // 1-bit input: A port enable input
			.REGCEA(1'b0), // 1-bit input: A port register clock enable input
			.RSTA(ResetA), // 1-bit input: A port register set/reset input
			.WEA({bitwidth{WriteA}}), // 4-bit input: Port A byte-wide write enable input
			// Port A Data: 32-bit (each) input: Port A data
			.DIA(DataInA[31-i*bitwidth:31-(i+1)*bitwidth+1]), // 32-bit input: A port data input
			.DIPA(4'hf), // 4-bit input: A port parity input
			// Port B Address/Control Signals: 14-bit (each) input: Port B address and control signals
			.ADDRB({AddressB[Log2Words-1:0], {Log2bitwidth{1'b0}}}), // 14-bit input: B port address input
			.CLKB(ClockB), // 1-bit input: B port clock input
			.ENB(ClockEnB), // 1-bit input: B port enable input
			.REGCEB(1'b0), // 1-bit input: B port register clock enable input
			.RSTB(ResetB), // 1-bit input: B port register set/reset input
			.WEB({bitwidth{WriteB}}), // 4-bit input: Port B byte-wide write enable input
			// Port B Data: 32-bit (each) input: Port B data
			.DIB(DataInB[31-i*bitwidth:31-(i+1)*bitwidth+1]), // 32-bit input: B port data input
			.DIPB(4'hf) // 4-bit input: B port parity input
		);
	end
endgenerate
endmodule
