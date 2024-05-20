// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_dfrbp.v
 *
 * TT Primitive
 * FF with positive edge clock, inverted reset, complementary outputs
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_dfrbp (
	input  wire d,
	output reg  q,
	output reg  q_n,
	input  wire clk,
	input  wire rst_n
);

	always @(posedge clk or negedge rst_n)
		if (~rst_n) begin
			q   <= 1'b0;
			q_n <= 1'b1;
		end else begin
			q   <=  d;
			q_n <= ~d;
		end

endmodule // tt_prim_dfrbp
