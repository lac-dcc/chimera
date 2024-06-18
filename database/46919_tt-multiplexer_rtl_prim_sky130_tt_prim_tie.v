// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_tie.v
 *
 * TT Primitive
 * Tie Lo/Hi
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_tie #(
	parameter integer TIE_LO = 1,
	parameter integer TIE_HI = 1
)(
	output wire lo,
	output wire hi
);

	sky130_fd_sc_hd__conb_1 cell_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
		.VPB  (1'b1),
		.VNB  (1'b0),
`endif
		.LO (lo),
		.HI (hi)
	);

endmodule // tt_prim_tie
