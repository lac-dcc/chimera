/*
 * led_blinker.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module led_blinker #(
	parameter integer DW = 15,
	parameter integer TW = 11
)(
	// LED
	output wire led,

	// Config
	input  wire          ena,
	input  wire [TW-1:0] off,
	input  wire [TW-1:0] on,

	// Clock / Reset
	input  wire clk,
	input  wire rst
);

	// Signals
	// -------

	// Pre Divider
	reg  [DW:0] div_cnt = 0;	// Init for SIM only
	wire        div_tick;

	// Timer
	reg  [TW:0] timer_cnt = 0;	// Init for SIM only
	wire        timer_tick;

	// State
	reg         state;


	// Divider
	// -------

	always @(posedge clk)
		if (div_tick)
			div_cnt <= 0;
		else
			div_cnt <= div_cnt + 1;

	assign div_tick = div_cnt[DW];


	// On/Off timer
	// ------------

	always @(posedge clk)
		if (timer_tick)
			timer_cnt <= state ? {1'b0, off} : {1'b0, on};
		else
			timer_cnt <= timer_cnt + {(TW+1){div_tick}};
	
	assign timer_tick = timer_cnt[TW];


	// Output
	// ------
	
	always @(posedge clk)
		state <= ena & (state ^ timer_tick);

	assign led = state;

endmodule // led_blinker
