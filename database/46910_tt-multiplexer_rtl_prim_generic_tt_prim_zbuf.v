// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_zbuf.v
 *
 * TT Primitive
 * Zeroing buffer (i.e. AND gate ...)
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_zbuf #(
	parameter integer HIGH_DRIVE = 0
)(
	input  wire a,
	input  wire e,
	output wire z
);

	assign z = a & e;

endmodule // tt_prim_zbuf
