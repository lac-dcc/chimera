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

	generate
		if (HIGH_DRIVE) begin
			sky130_fd_sc_hd__ebufn_8 cell0_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
				.VPB  (1'b1),
				.VNB  (1'b0),
`endif
				.A    (a),
				.TE_B (tx),
				.Z    (z)
			);
		end else begin
			sky130_fd_sc_hd__ebufn_1 cell0_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
				.VPB  (1'b1),
				.VNB  (1'b0),
`endif
				.A    (a),
				.TE_B (tx),
				.Z    (z)
			);
		end
	endgenerate

endmodule // tt_prim_tbuf
