// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 *
 * 8n1@115200; no one uses anything else (and neither do I)
 */

`include "common.vh"

module uart_tx (
	input clk, rst,

	input [7:0] data,
	output reg ready,
	input valid,

	output reg tx,

	/* Run at 4M for testing */
	input high_speed
);

	/*
	 * $ scripts/lfsr.py 0x500 1085 31
	 *
	 * 115200 baud with a 125 MHz clock
	 */
	parameter SLOW_VALUE	= 11'h78c;
	/* 4M baud with a 125 MHz clock */
	parameter FAST_VALUE	= 11'h68e;

	reg ready_next;
	reg [10:0] lfsr, lfsr_next;
	reg [3:0] counter, counter_next;
	reg [8:0] bits, bits_next;

	always @(*) begin
		tx = bits[0];

		ready_next = ready;
		counter_next = counter;
		lfsr_next = { lfsr[9:0], lfsr[10] ^ lfsr[8] };
		bits_next = bits;

		if (&lfsr) begin
			if (counter)
				counter_next = counter - 1;
			else
				ready_next = 1;
			lfsr_next = high_speed ? FAST_VALUE : SLOW_VALUE;
			bits_next = { 1'b1, bits[8:1] };
		end

		if (valid && ready) begin
			ready_next = 0;
			counter_next = 9;
			lfsr_next = high_speed ? FAST_VALUE : SLOW_VALUE;
			bits_next = { data, 1'b0 };
		end
	end

	always @(posedge clk) begin
		counter <= counter_next;
		lfsr <= lfsr_next;
	end

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			ready <= 1'b1;
			bits <= 9'h1ff;
		end else begin
			ready <= ready_next;
			bits <= bits_next;
		end
	end

endmodule
