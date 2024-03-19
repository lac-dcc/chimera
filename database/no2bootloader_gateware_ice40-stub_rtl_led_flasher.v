/*
 * led_flasher.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module led_flasher #(
	parameter integer DW = 21
)(
	// LED
	output reg  led,

	// Config
	input  wire [3:0] flash_cnt,

	// Clock / Reset
	input  wire clk,
	input  wire rst
);

	// FSM
	// ---

	localparam
		ST_PAUSE      = 0,
		ST_FLASH_OFF  = 2,
		ST_FLASH_ON   = 3;


	// Signals
	// -------

	// FSM
	reg   [1:0] state_nxt;
	reg   [1:0] state;

	// Timer
	reg  [DW:0] timer_cnt = 0;	// Init for SIM only
	wire        timer_tick;

	// Repeat counter
	reg   [3:0] cnt;
	wire        cnt_ce;
	wire        cnt_ld_now;
	wire        cnt_ld_sel;
	reg         cnt_is_zero;


	// State machine
	// -------------

	// Next state logic
	always @(*)
	begin
		// Default is to stay put
		state_nxt = state;

		// Main case
		case (state)
			ST_PAUSE:
				if (timer_tick & cnt_is_zero)
					state_nxt = ST_FLASH_OFF;

			ST_FLASH_OFF:
				if (timer_tick)
					state_nxt = cnt_is_zero ? ST_PAUSE : ST_FLASH_ON;

			ST_FLASH_ON:
				if (timer_tick)
					state_nxt = ST_FLASH_OFF;
		endcase
	end

	// State register
	always @(posedge clk or posedge rst)
		if (rst)
			state <= ST_PAUSE;
		else
			state <= state_nxt;


	// Timer
	// -----

	always @(posedge clk)
		if (timer_tick)
			timer_cnt <= 0;
		else
			timer_cnt <= timer_cnt + 1;

	assign timer_tick = timer_cnt[DW];


	// Counter
	// -------

	assign cnt_ld_now = cnt_is_zero;
	assign cnt_ld_sel =  (state == ST_PAUSE);
	assign cnt_ce     = ((state == ST_PAUSE) || (state == ST_FLASH_OFF)) && timer_tick;

	always @(posedge clk or posedge rst)
		if (rst) begin
			cnt <= 0;
		end else if (cnt_ce) begin
			if (cnt_ld_now)
				cnt <= cnt_ld_sel ? flash_cnt : 4'h5;
			else
				cnt <= cnt - 1;
		end

	always @(posedge clk)
		cnt_is_zero <= (cnt == 4'h0);


	// Output
	// ------

	always @(posedge clk)
		led <= state == ST_FLASH_ON;

endmodule // led_flasher
