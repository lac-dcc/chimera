// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_asw_1v8.v
 *
 * Blackbox for the analog switches
 *
 * Copyright (c) 2024 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

(* blackbox *)
module tt_asw_1v8 (
`ifdef USE_POWER_PINS
	input  wire VGND,
	input  wire VPWR,
`endif
	inout  wire mod,
	inout  wire bus,
	input  wire ctrl
);

endmodule
