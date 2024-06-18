// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_tbuf.v
 *
 * TT Primitive
 * Tristate buffer, polarity variable ... see tt_prim_tbuf_pol
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_tbuf #(
	parameter integer HIGH_DRIVE = 0
)(
	input  wire a,
	input  wire tx,
	output wire z
);

	assign z = tx ? a : 1'bz;

endmodule // tt_prim_tbuf
