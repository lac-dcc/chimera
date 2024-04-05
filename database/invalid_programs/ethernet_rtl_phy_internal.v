// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 *
 * PHY with internal (unexposed) MII and a wishbone management interface
 */

`include "common.vh"
`include "io.vh"

module phy_internal (
	input clk_125,
	input clk_250,

	/* DP83223 */
	input indicate_data,
	input signal_detect,
	output request_data,

	/* MII */
	input mii_tx_ce,
	input mii_tx_en,
	input mii_tx_er,
	input [3:0] mii_txd,

	output mii_rx_ce,
	output mii_rx_dv,
	output mii_rx_er,
	output [3:0] mii_rxd,

	output mii_col,
	output mii_crs,

	/* Wishbone management */
	output wb_ack, wb_err,
	input wb_cyc, wb_stb, wb_we,
	input [4:0] wb_addr,
	input [15:0] wb_data_write,
	output [15:0] wb_data_read,

	/* Control/status */
	output link_status,
	output receiving,
	output false_carrier,
	output symbol_error
);

	parameter WISHBONE		= 1;
	parameter ENABLE_COUNTERS	= 1;
	parameter COUNTER_WIDTH		= 15;
	parameter [23:0] OUI		= 0;
	parameter [5:0] MODEL		= 0;
	parameter [3:0] REVISION	= 0;

	wire isolate, tx_data, signal_status, link_monitor_test, descrambler_test;
	wire loopback, coltest;
	wire [1:0] rx_data, rx_data_valid;

	phy_core phy_core (
		.clk(clk_125),
		.tx_data(tx_data),
		.rx_data(rx_data),
		.rx_data_valid(rx_data_valid),
		.signal_status(signal_status),
		.tx_ce(mii_tx_ce),
		.tx_en(mii_tx_en),
		.txd(mii_txd),
		.tx_er(mii_tx_er),
		.rx_ce(mii_rx_ce),
		.rx_dv(mii_rx_dv),
		.rxd(mii_rxd),
		.rx_er(mii_rx_er),
		.crs(mii_crs),
		.col(mii_col),
		.loopback(loopback),
		.coltest(coltest),
		.link_monitor_test_mode(link_monitor_test),
		.descrambler_test_mode(descrambler_test),
		.link_status(link_status),
		.receiving(receiving),
		.false_carrier(false_carrier),
		.symbol_error(symbol_error)
	);

	pmd_dp83223 pmd (
		.clk_125(clk_125),
		.clk_250(clk_250),
		.signal_detect(signal_detect),
		.request_data(request_data),
		.indicate_data(indicate_data),
		.tx_data(tx_data),
		.rx_data(rx_data),
		.rx_data_valid(rx_data_valid),
		.signal_status(signal_status),
		.loopback(loopback)
	);

	generate if (WISHBONE) begin
		mdio_regs #(
			.OUI(OUI),
			.MODEL(MODEL),
			.REVISION(REVISION),
			.EMULATE_PULLUP(1'b1),
			.ENABLE_COUNTERS(ENABLE_COUNTERS),
			.COUNTER_WIDTH(COUNTER_WIDTH)
		) mdio_regs (
			.clk(clk_125),
			.ack(wb_ack),
			.err(wb_err),
			.cyc(wb_cyc),
			.stb(wb_stb),
			.we(wb_we),
			.addr(wb_addr),
			.data_write(wb_data_write),
			.data_read(wb_data_read),
			.link_status(link_status),
			.negative_wraparound(!rx_data_valid),
			.positive_wraparound(rx_data_valid[1]),
			.false_carrier(false_carrier),
			.symbol_error(symbol_error),
			.loopback(loopback),
			.isolate(isolate),
			.coltest(coltest),
			.descrambler_test(descrambler_test),
			.link_monitor_test(link_monitor_test)
		);
	end else begin
		assign wb_ack = 0;
		assign wb_err = wb_cyc && wb_stb;
		assign loopback = 0;
		assign coltest = 0;
		assign descrambler_test = 0;
		assign link_monitor_test = 0;
	end endgenerate

endmodule
