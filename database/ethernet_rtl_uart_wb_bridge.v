// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module uart_wb_bridge (
	input clk,
	input rst,

	/* UART */
	input rx,
	output tx,

	/* Wishbone */
	output wb_rst,
	input wb_ack, wb_err,
	output wb_cyc, wb_stb, wb_we,
	output [ADDR_WIDTH - 1:0] wb_addr,
	output [DATA_WIDTH - 1:0] wb_data_write,
	input [DATA_WIDTH - 1:0] wb_data_read,

	input high_speed
);

	parameter ADDR_WIDTH	= 16;
	localparam DATA_WIDTH	= 16;

	wire rx_ready, rx_valid;
	wire [7:0] rx_data;
	wire overflow;

	uart_rx uart_rx (
		.clk(clk),
		.rst(rst),
		.rx(rx),
		.ready(rx_ready),
		.valid(rx_valid),
		.data(rx_data),
		.high_speed(high_speed),
		.overflow(overflow),
		.frame_error(wb_rst)
	);

	wire tx_ready, tx_valid;
	wire [7:0] tx_data;

	axis_wb_bridge #(
		.ADDR_WIDTH(ADDR_WIDTH)
	) bridge (
		.clk(clk),
		.rst(rst || wb_rst),
		.s_axis_ready(rx_ready),
		.s_axis_valid(rx_valid),
		.s_axis_data(rx_data),
		.m_axis_ready(tx_ready),
		.m_axis_valid(tx_valid),
		.m_axis_data(tx_data),
		.wb_ack(wb_ack),
		.wb_err(wb_err),
		.wb_cyc(wb_cyc),
		.wb_stb(wb_stb),
		.wb_we(wb_we),
		.wb_addr(wb_addr),
		.wb_data_write(wb_data_write),
		.wb_data_read(wb_data_read),
		.overflow(overflow)
	);

	uart_tx uart_tx (
		.clk(clk),
		.rst(rst),
		.tx(tx),
		.ready(tx_ready),
		.valid(tx_valid),
		.data(tx_data),
		.high_speed(high_speed)
	);

endmodule
