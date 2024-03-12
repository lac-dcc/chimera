// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module reset_sync (
	input clk,
	input rst_in,
	output reg rst_out
);

	wire rst;
	reg rst_last;
	initial rst_last = 1;
	initial rst_out = 1;

`ifdef SYNTHESIS
	/* Filter out glitches */

	wire [3:0] rst_delay;
	assign rst_delay[0] = rst_in;
	assign rst = &rst_delay;

	genvar i;
	generate for (i = 0; i < 3; i = i + 1) begin
		(* keep *)
		SB_LUT4 #(
			.LUT_INIT(16'hff00)
		) filter (
			.I3(rst_delay[i]),
			.O(rst_delay[i + 1])
		);
	end endgenerate
`else
	assign rst = rst_in;
`endif

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			rst_last <= 1;
			rst_out <= 1;
		end else begin
			rst_last <= rst;
			rst_out <= rst_last;
		end
	end

endmodule
