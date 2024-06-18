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

(* noblackbox *) module tt_prim_diode (
	inout  wire diode
);

	//pulldown(diode);

endmodule // tt_prim_diode
