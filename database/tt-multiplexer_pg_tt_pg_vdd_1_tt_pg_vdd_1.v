// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_pg_vdd_1.v
 *
 * Blackbox for the VDD power switches
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

(* blackbox *)
module tt_pg_vdd_1 (
`ifdef USE_POWER_PINS
	input  wire VGND,
	input  wire VPWR,
	output wire GPWR,
`endif
	input  wire ctrl
);

`ifdef USE_POWER_PINS
	assign GPWR = !ctrl ? VPWR : 1'bz;
`endif

endmodule
