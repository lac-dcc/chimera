// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module hub_core (
	input clk,

	/* MII */
	input [PORT_COUNT - 1:0] rx_dv,
	input [PORT_COUNT - 1:0] rx_er,
	input [PORT_COUNT * 4 - 1:0] rxd,

	output reg [PORT_COUNT - 1:0] tx_en,
	output reg [PORT_COUNT - 1:0] tx_er,
	output reg [PORT_COUNT * 4 - 1:0] txd,

	/* Status; combinatorial! */
	output reg jam, activity
);

	parameter PORT_COUNT	= 4;
	localparam PORT_BITS	= $clog2(PORT_COUNT);

	localparam DATA_JAM	= 4'h5;

	integer i;
	reg [PORT_BITS - 1:0] active_port;
	reg [PORT_COUNT - 1:0] tx_en_next, tx_er_next;
	(* mem2reg *)
	reg [3:0] txd_next [PORT_COUNT - 1:0];

	always @(*) begin
		jam = 0;
		activity = 0;
		active_port = {PORT_BITS{1'bx}};
		for (i = 0; i < PORT_COUNT; i = i + 1) begin
			if (rx_dv[i]) begin
				if (activity)
					jam = 1;
				else
					active_port = i;
				activity = 1;
			end
		end

		for (i = 0; i < PORT_COUNT; i = i + 1) begin
			tx_en_next[i] = 0;
			tx_er_next[i] = rx_er[active_port];
			txd_next[i] = rxd[active_port * 4 +: 4];
			if (jam) begin
				tx_en_next[i] = 1;
				tx_er_next[i] = 0;
				txd_next[i] = DATA_JAM;
			end else if (activity && i != active_port) begin
				tx_en_next[i] = 1;
			end
		end
	end

	always @(posedge clk) begin
		tx_en <= tx_en_next;
		tx_er <= tx_er_next;
		for (i = 0; i < PORT_COUNT; i = i + 1)
			txd[i * 4 +: 4] <= txd_next[i];
	end

endmodule
