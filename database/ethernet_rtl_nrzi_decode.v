// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module nrzi_decode (
	input clk,
	input rst,
	input [1:0] nrzi,
	input [1:0] nrzi_valid,
	output reg [1:0] nrz,
	output reg [1:0] nrz_valid
);

	reg [1:0] nrz_next, nrz_valid_next;
	reg nrzi_last, nrzi_last_next, nrzi_last_valid, nrzi_last_valid_next;
	initial nrz_valid = 0;
	initial nrzi_last_valid = 0;

	always @(*) begin
		nrz_next[0] = nrzi[1] ^ nrzi[0];
		nrz_next[1] = nrzi[1] ^ nrzi_last;

		nrzi_last_next = nrzi_last;
		nrzi_last_valid_next = 1'b1;
		if (nrzi_valid[1])
			nrzi_last_next = nrzi[0];
		else if (nrzi_valid[0])
			nrzi_last_next = nrzi[1];
		else
			nrzi_last_valid_next = nrzi_last_valid;

		nrz_valid_next = nrzi_valid;
		if (!nrzi_last_valid) begin
			nrz_valid_next = 0;
			if (nrzi_valid[1]) begin
				nrz_valid_next = 2'b1;
				nrz_next[1] = nrz_next[0];
			end
		end
	end

	always @(posedge clk) begin
		if (rst) begin
			nrzi_last <= 1'bX;
			nrzi_last_valid <= 1'b0;
			nrz_valid <= 2'b0;
			nrz <= 2'b0;
		end else begin
			nrzi_last <= nrzi_last_next;
			nrzi_last_valid = nrzi_last_valid_next;
			nrz_valid <= nrz_valid_next;
			nrz <= nrz_next;
		end
	end

endmodule
