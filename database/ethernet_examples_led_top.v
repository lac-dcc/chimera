// SPDX-License-Identifier: AGPL-3.0-Only
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module top (
	input SYSCLK,

	input [1:0] BUT,
	output [1:0] LED
);

	parameter WISHBONE	= 1;

	wire clk_125;

	SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'd0),
		.DIVF(7'd9),
		.DIVQ(3'd3),
		.FILTER_RANGE(3'd5),
	) pll (
		.REFERENCECLK(SYSCLK),
		.PLLOUTGLOBAL(clk_125),
		.BYPASS(1'b0),
		.RESETB(1'b1)
	);

	wire [1:0] led_n;
	assign LED = ~led_n;

	led_blinker #(
		.LEDS(2)
	) blinker(
		.clk(clk_125),
		.triggers(~BUT),
		.out(led_n),
		.test_mode(1'b0)
	);

endmodule
