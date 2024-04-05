/*
 * iua_top.v
 *
 * ice40 USB Analyzer - Top Level
 *
 * Copyright (C) 2008  Sylvain Munaut <tnt@246tNt.com>
 *
 * vim: ts=4 sw=4
 */

`ifdef SIM
`default_nettype none
`endif

module iua_top #(
	parameter integer SERIAL_DIV = 16
)(
	// USB input
	input wire usb_dp_pad,
	input wire usb_dn_pad,

	// Serial interface
	output wire uart_tx,
	input  wire uart_rx,

	// External clock
	input wire clk,
	input wire rst
);
	// Signals
	// -------

	// RAW captured signals
	wire [1:0] usb_dp_cap;
	wire [1:0] usb_dn_cap;

	// FIFO
	wire [31:0] fifo_di;
	wire [ 1:0] fifo_diw;
	wire fifo_wren;
	wire fifo_full;

	wire [ 7:0] fifo_do;
	wire fifo_empty;
	wire fifo_rden;

	// UART
	wire [7:0] uart_data;
	wire uart_ack;
	wire uart_valid;


	// Actual Logic Analyzer
	// ---------------------

	// PHY
	iua_phy phy_dp_I (
		.pad(usb_dp_pad),
		.cap(usb_dp_cap),
		.clk(clk)
	);

	iua_phy phy_dn_I (
		.pad(usb_dn_pad),
		.cap(usb_dn_cap),
		.clk(clk)
	);

	// Logic Analyzer core
	iua_core core_I (
		.data_t0({usb_dp_cap[0], usb_dn_cap[0]}),
		.data_t1({usb_dp_cap[1], usb_dn_cap[1]}),
		.out_data(fifo_di),
		.out_width(fifo_diw),
		.out_valid(fifo_wren),
		.clk(clk),
		.rst(rst)
	);

	// Big FIFO
	iua_fifo fifo_I (
		.di(fifo_di),
		.diw(fifo_diw),
		.wren(fifo_wren),
		.full(),
		.do(fifo_do),
		.empty(fifo_empty),
		.rden(fifo_rden),
		.clk(clk),
		.rst(rst)
	);

	// UART
		// TX
	uart_tx #(
		.DIV_WIDTH(8)
	) uart_I (
		.data(uart_data),
		.valid(uart_valid),
		.ack(uart_ack),
		.tx(uart_tx),
		.div(SERIAL_DIV),
		.clk(clk),
		.rst(rst)
	);

	assign uart_data  = fifo_do;
	assign uart_valid = ~fifo_empty;
	assign fifo_rden  = uart_ack;

		// RX
	// FIXME: TODO

	// Command processing
	// FIXME: TODO

endmodule // iua_top
