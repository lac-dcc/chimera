// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 *
 * This is an LED blinker designed to make it easier to monitor internal
 * signals with LEDs. The blinker is active for ~16 and inactive for ~16 ms.
 * When triggered, the corresponding output will go high the next time
 * the blinker becomes active. This results in blinking at 30 Hz if
 * continuously triggered. All outputs blink at the same time.
 */

`include "common.vh"

module led_blinker (
	input clk,
	input [LEDS - 1:0] triggers,
	output reg [LEDS - 1:0] out,

	input test_mode
);

	parameter LEDS		= 2;

	/*
	 * $ scripts/lfsr.py 0x300000 4166667 16
	 *
	 * 33.33 ms
	 */
	localparam TIMER_RESET		= 22'h27b194;
	/* 16 cycles */
	localparam TEST_TIMER_RESET	= 22'h15557f;

	reg active, active_next;
	reg [LEDS - 1:0] out_next, triggered, triggered_next;
	reg [21:0] lfsr, lfsr_next;

	initial begin
		active = 0;
		triggered = {LEDS{1'b0}};
		out = {LEDS{1'b0}};
		lfsr = TEST_TIMER_RESET;
	end

	always @(*) begin
		active_next = active;
		triggered_next = triggered | triggers;
		out_next = out;
		lfsr_next = { lfsr[20:0], lfsr[21] ^ lfsr[20] };
		if (&lfsr) begin
			if (active) begin
				active_next = 0;
				triggered_next = triggered_next & ~out;
				out_next = {LEDS{1'b0}};
			end else begin
				active_next = 1;
				out_next = triggered;
			end
			lfsr_next = test_mode ? TEST_TIMER_RESET : TIMER_RESET;
		end
	end

	always @(posedge clk) begin
		active <= active_next;
		triggered <= triggered_next;
		out <= out_next;
		lfsr <= lfsr_next;
	end

endmodule
