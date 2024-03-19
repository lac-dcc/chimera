/*
 * wb_epbuf.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module wb_epbuf #(
	parameter integer AW = 9,
	parameter integer DW = 32
)(
	// Wishbone slave
	input  wire [AW-1:0] wb_addr,
	output wire [DW-1:0] wb_rdata,
	input  wire [DW-1:0] wb_wdata,
	input  wire          wb_we,
	input  wire          wb_cyc,
	output wire          wb_ack,

	// USB EP-Buf master
	output wire [AW-1:0] ep_tx_addr_0,
	output wire [DW-1:0] ep_tx_data_0,
	output wire          ep_tx_we_0,

	output wire [AW-1:0] ep_rx_addr_0,
	input  wire [DW-1:0] ep_rx_data_1,
	output wire          ep_rx_re_0,

	// Clock / Reset
	input  wire clk,
	input  wire rst
);

	reg ack_i;

	assign ep_tx_addr_0 = wb_addr;
	assign ep_rx_addr_0 = wb_addr;

	assign ep_tx_data_0 = wb_wdata;
	assign wb_rdata = ack_i ? ep_rx_data_1 : 32'h00000000;

	assign ep_tx_we_0 = wb_cyc & wb_we & ~ack_i;
	assign ep_rx_re_0 = 1'b1;

	assign wb_ack = ack_i;

	always @(posedge clk or posedge rst)
		if (rst)
			ack_i <= 1'b0;
		else
			ack_i <= wb_cyc & ~ack_i;

endmodule // wb_epbuf
