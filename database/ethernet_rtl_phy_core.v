// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

`timescale 1ns/1ps

module phy_core (
	input clk,

	/* "PMD" */
	output tx_data,
	input [1:0] rx_data,
	input [1:0] rx_data_valid,
	input signal_status,

	/* "MII" */
	input tx_ce,
	input tx_en,
	input [3:0] txd,
	input tx_er,

	output rx_ce,
	output rx_dv,
	output [3:0] rxd,
	output rx_er,

	output reg crs,
	output reg col,

	/* Control/status */
	input loopback,
	input coltest,
	input link_monitor_test_mode,
	input descrambler_test_mode,
	output locked,
	output reg link_status,
	output receiving,
	output reg false_carrier,
	output reg symbol_error
);

	wire tx_bits, transmitting;

	pcs_tx pcs_tx (
		.clk(clk),
		.ce(tx_ce),
		.enable(tx_en),
		.data(txd),
		.err(tx_er),
		.bits(tx_bits),
		.link_status(link_status),
		.tx(transmitting)
	);

	scramble scrambler (
		.clk(clk),
		.unscrambled(tx_bits),
		.scrambled(tx_data)
	);

	reg descrambler_enable, loopback_last;
	initial loopback_last = 0;
	wire [1:0] rx_bits, rx_bits_valid;

	/* Force desynchronization when entering/exiting loopback */
	always @(*) begin
		if (loopback)
			descrambler_enable = loopback_last;
		else
			descrambler_enable = signal_status && !loopback_last;
	end

	always @(posedge clk)
		loopback_last <= loopback;

	descramble descrambler (
		.clk(clk),
		.signal_status(descrambler_enable),
		.scrambled(rx_data),
		.scrambled_valid(rx_data_valid),
		.descrambled(rx_bits),
		.descrambled_valid(rx_bits_valid),
		.test_mode(descrambler_test_mode),
		.locked(locked)
	);

	/*
	 * $ scripts/lfsr.py 0x12000 41250 16
         *
	 * 41250 cycles or 330 us at 125MHz
	 */
	localparam STABILIZE_VALUE = 17'h1590c;
	/* 16 cycles; there's no instability while testing */
	localparam TEST_STABILIZE_VALUE = 17'h038e3;

	reg link_status_next;
	initial link_status = 0;
	reg [16:0] stabilize_timer, stabilize_timer_next;
	initial stabilize_timer = STABILIZE_VALUE;

	/*
	 * Link monitor process; this is the entirety of the (section 24.3) PMA 
	 *
	 * Section 24.3.4.4 specifies that link_status is to be set to OK when
	 * stabilize_timer completes. However, I have also included whether
	 * the descrambler is locked. I think this matches the intent of the
	 * signal, which indicates whether "the receive channel is intact and
	 * enabled for reception."
	 */

	always @(*) begin
		link_status_next = 0;
		stabilize_timer_next = stabilize_timer;

		if (signal_status) begin
			if (&stabilize_timer) begin
				link_status_next = locked;
			end else begin
				stabilize_timer_next[0] = stabilize_timer[16] ^ stabilize_timer[13];
				stabilize_timer_next[16:1] = stabilize_timer[15:0];
			end
		end else if (link_monitor_test_mode) begin
			stabilize_timer_next = TEST_STABILIZE_VALUE;
		end else begin
			stabilize_timer_next = STABILIZE_VALUE;
		end

		if (loopback)
			stabilize_timer_next = 17'h1ffff;
	end

	always @(posedge clk) begin
		stabilize_timer <= stabilize_timer_next;
		link_status <= link_status_next;
	end

	pcs_rx pcs_rx (
		.clk(clk),
		.ce(rx_ce),
		.valid(rx_dv),
		.data(rxd),
		.err(rx_er),
		.bits(rx_bits),
		.bits_valid(rx_bits_valid),
		.link_status(link_status),
		.rx(receiving)
	);

	/*
	 * NB: CRS and COL are not required to be in any particular clock
	 * domain (not that it matters).
	 */
	always @(*) begin
		crs = transmitting || receiving;
		col = transmitting && receiving;
		if (coltest)
			col = transmitting;
		else if (loopback)
			col = 0;

		false_carrier = 0;
		symbol_error = 0;
		if (rx_ce && rx_er) begin
			if (rx_dv)
				symbol_error = 1;
			else
				false_carrier = 1;
		end
	end

endmodule
