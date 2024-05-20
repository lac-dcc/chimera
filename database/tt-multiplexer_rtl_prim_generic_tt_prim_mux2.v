// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_mux2.v
 *
 * TT Primitive
 * Mux2
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_mux2 (
	input  wire a,
	input  wire b,
	output reg  x,
	input  wire s
);

	always @(*)
		case (s)
			1'b0:   x = a;
			1'b1:   x = b;
			default: x = 1'bx;
		endcase

endmodule // tt_prim_mux2
