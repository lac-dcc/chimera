// SPDX-License-Identifier: AGPL-3.0-Only
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module top (
	input clk_100,

	/* DP83223 */
	input [3:0] indicate_data,
	input [3:0] signal_detect,
	output [3:0] request_data,

	/* LEDs */
	output collision, transmitting,
	/* These match the names on the PCB which I am too lazy to change. */
	output [3:0] link_act,
	output [3:0] speed,

	/* Unused for the moment */
	input [3:0] polarity,
	output [3:0] loopback
);

	wire clk_125, clk_250;

	SB_PLL40_2F_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'd0),
		.DIVF(7'd9),
		.DIVQ(3'd2),
		.FILTER_RANGE(3'd5),
		.PLLOUT_SELECT_PORTB("GENCLK_HALF")
	) pll (
		.REFERENCECLK(clk_100),
		.PLLOUTGLOBALA(clk_250),
		.PLLOUTGLOBALB(clk_125),
		.BYPASS(1'b0),
		.RESETB(1'b1)
	);

	reg collision_raw, transmitting_raw;
	reg [3:0] receiving;

	hub #(
		.PORT_COUNT(4),
		.WISHBONE(1),
		.ENABLE_COUNTERS(1),
		.COUNTER_WIDTH(16)
	) hub (
		.clk_125(clk_125),
		.clk_250(clk_250),
		.indicate_data(indicate_data),
		.signal_detect(signal_detect),
		.request_data(request_data),
		.wb_cyc(1'b0),
		.wb_stb(1'b0),
		.collision(collision_raw),
		.transmitting(transmitting_raw),
		.link_status(speed),
		.receiving(receiving)
	);

	led_blinker #(
		.LEDS(6)
	) blinker(
		.clk(clk_125),
		.triggers({ collision_raw, transmitting_raw, receiving}),
		.out({ collision, transmitting, link_act}),
		.test_mode(1'b0)
	);

	assign loopback = 4'b0;

endmodule
