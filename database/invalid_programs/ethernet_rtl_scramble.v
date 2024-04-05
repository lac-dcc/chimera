// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module scramble (
	input clk,
	input unscrambled,
	output reg scrambled
);

	reg lfsr_next;
	reg [10:0] lfsr;
	initial lfsr = 11'h7ff;

	always @(*) begin
		lfsr_next = lfsr[8] ^ lfsr[10];
		scrambled = unscrambled ^ lfsr_next;
	end

	always @(posedge clk)
		lfsr <= { lfsr[9:0], lfsr_next };

endmodule
