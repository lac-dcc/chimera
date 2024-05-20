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

	generate
		if (HIGH_DRIVE) begin
			wire l;

			sky130_fd_sc_hd__and2_2 cell0_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
				.VPB  (1'b1),
				.VNB  (1'b0),
`endif
				.A (a),
				.B (e),
				.X (l)
			);

			sky130_fd_sc_hd__buf_8 cell1_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
				.VPB  (1'b1),
				.VNB  (1'b0),
`endif
				.A (l),
				.X (z)
			);
			
		end else begin
			sky130_fd_sc_hd__and2_2 cell0_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
				.VPB  (1'b1),
				.VNB  (1'b0),
`endif
				.A (a),
				.B (e),
				.X (z)
			);
		end
	endgenerate

endmodule // tt_prim_zbuf
