// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_tbuf_pol.v
 *
 * TT Primitive
 * Tristate buffer polarity handler
 *
 * Not all cells libraries have the same enable polarity ...
 * This converts positive enable polarity to whatever the
 * tt_prim_tbuf expects.
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_tbuf_pol (
	input  wire t,
	output wire tx
);

	sky130_fd_sc_hd__bufinv_8 cell0_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
		.VPB  (1'b1),
		.VNB  (1'b0),
`endif
		.A (t),
		.Y (tx)
	);

endmodule // tt_prim_tbuf
