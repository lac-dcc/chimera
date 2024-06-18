// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_inv.v
 *
 * TT Primitive
 * Inverter
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_inv #(
	parameter integer HIGH_DRIVE = 0
)(
	input  wire a,
	output wire z
);

	assign z = ~a;

endmodule // tt_prim_inv
