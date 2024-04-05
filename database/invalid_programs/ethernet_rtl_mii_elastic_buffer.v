// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 *
 * This is a classic shift-register FIFO (a la XAPP 005.002) adapted for MII
 * semantics. The semantics of err/valid are slightly different from dv/er
 * when we have err and not valid. We remove this scenario from the input
 * (since it represents false carrier/LPI and we don't care about those when
 * repeating) and reuse this scenario as filler to indicate underflow.
 *
 * There is a delay of BUF_SIZE - 1 clocks between when data enters via txd
 * and when it is offered on rxd. 
 *
 * Note that because this module reacts to rx_ce/rx_dv from the previous clock,
 * the maximum duty cycle of rx_ce is 50%. Otherwise, it is possible for the
 * same data to be offered more than once.
 */

`include "common.vh"

module mii_elastic_buffer (
	input clk,

	input tx_ce,
	input tx_en,
	input tx_er,
	input [3:0] txd,

	input rx_ce,
	output reg rx_dv,
	output reg rx_er,
	output reg [3:0] rxd,

	output reg overflow,
	output reg underflow
);

	parameter BUF_SIZE	= 5;
	/*
	 * The amount of data in the buffer before we assert RX_DV. The
	 * default slightly favors overflow (tx_ce faster than rx_ce) over
	 * underflow. This is because we can generally get more data through
	 * with overflow, since the slower rx_ce allows the data in the buffer
	 * to propegate more.
	 */
	parameter WATERMARK	= (BUF_SIZE + 1) / 2;

	integer i;
	reg [BUF_SIZE - 1:0] valid, valid_next, err, err_next;
	(* mem2reg *)
	reg [3:0] data [BUF_SIZE - 1:0], data_next [BUF_SIZE - 1:0];
	reg shift, overflow_next, underflow_next;
	reg in, in_next, out, out_next, rx_ce_last, rx_dv_last;
	reg [BUF_SIZE - 1:0] debug;

	initial begin
		valid = 0;
		err = 0;
		overflow = 0;
		underflow = 0;
		in = 0;
		out = 0;
		rx_dv_last = 0;
		rx_ce_last = 0;
	end

	always @(*) begin
		if (out)
			rx_dv = valid[BUF_SIZE - 1];
		else
			rx_dv = &valid[BUF_SIZE - 1:BUF_SIZE - WATERMARK - 1];
		rx_er = err[BUF_SIZE - 1];
		underflow_next = 0;
		if (err[BUF_SIZE - 1] && !valid[BUF_SIZE - 1]) begin
			rx_dv = 1;
			underflow_next = rx_ce;
		end
		rxd = data[BUF_SIZE - 1];
		out_next = rx_ce ? rx_dv : out;

		valid_next = valid;
		err_next = err;
		shift = rx_ce_last && rx_dv_last;
		debug[BUF_SIZE - 1] = shift;
		for (i = BUF_SIZE - 1; i > 0; i = i - 1) begin
			data_next[i] = data[i];
			if (shift || !valid[i]) begin
				valid_next[i] = valid[i - 1];
				err_next[i] = err[i - 1];
				data_next[i] = data[i - 1];
				shift = 1;
			end
			debug[i - 1] = shift;
		end

		data_next[0] = data[0];
		if (shift) begin
			valid_next[0] = 0;
			err_next[0] = in;
			data_next[0] = 4'hX;
		end

		overflow_next = 0;
		in_next = in;
		if (tx_ce) begin
			if (tx_en) begin
				valid_next[0] = 1;
				err_next[0] = tx_er;
				if (valid[0] && !shift) begin
					overflow_next = 1;
					err_next[0] = 1;
				end
				in_next = 1;
			end else begin
				valid_next[0] = 0;
				err_next[0] = 0;
				in_next = 0;
			end
			data_next[0] = txd;
		end
	end

	always @(posedge clk) begin
		valid <= valid_next;
		err <= err_next;
		for (i = 0; i < BUF_SIZE; i = i + 1)
			data[i] <= data_next[i];
		overflow <= overflow_next;
		underflow <= underflow_next;
		in <= in_next;
		out <= out_next;
		rx_ce_last <= rx_ce;
		rx_dv_last <= rx_dv;
	end

`ifndef SYNTHESIS
	/* This is the only way to look into a buffer... */
	genvar j;
	generate for (j = 0; j < BUF_SIZE; j = j + 1)
		wire [3:0] tmpd = data[j];
	endgenerate
`endif

endmodule
