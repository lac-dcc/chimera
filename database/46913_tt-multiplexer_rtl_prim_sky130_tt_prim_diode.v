// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_prim_diode.v
 *
 * TT Primitive
 * Antenna diode
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_prim_diode (
	inout  wire diode
);

			(* keep *)
			sky130_fd_sc_hd__diode_2 cell0_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
				.VPB  (1'b1),
				.VNB  (1'b0),
`endif
				.DIODE (diode)
			);

endmodule // tt_prim_diode
