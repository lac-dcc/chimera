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
	output wire q,
	output wire q_n,
	input  wire clk,
	input  wire rst_n
);

	sky130_fd_sc_hd__dfrbp_2 cell0_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
		.VPB  (1'b1),
		.VNB  (1'b0),
`endif
		.D       (d),
		.Q       (q),
		.Q_N     (q_n),
		.CLK     (clk),
		.RESET_B (rst_n)
	);

endmodule // tt_prim_dfrbp
