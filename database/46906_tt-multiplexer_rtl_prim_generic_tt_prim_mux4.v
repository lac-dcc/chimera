// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_mux4.v
 *
 * TT Primitive
 * Mux4
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_mux4 (
	input  wire a,
	input  wire b,
	input  wire c,
	input  wire d,
	output reg  x,
	input  wire [1:0] s
);

	always @(*)
		case (s)
			2'b00:   x = a;
			2'b01:   x = b;
			2'b10:   x = c;
			2'b11:   x = d;
			default: x = 1'bx;
		endcase

endmodule // tt_prim_mux4
