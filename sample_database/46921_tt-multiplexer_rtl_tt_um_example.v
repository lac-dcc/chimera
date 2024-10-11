// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_um_example.v
 *
 * Example user module
 *
 * Copyright (c) 2023 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
`ifdef TT_WITH_ANALOG
	inout  wire [7:0] ua,		// Analog
`endif
	input  wire [7:0] ui_in,	// Dedicated inputs
	output wire [7:0] uo_out,	// Dedicated outputs
	input  wire [7:0] uio_in,	// IOs: Input path
	output wire [7:0] uio_out,	// IOs: Output path
	output wire [7:0] uio_oe,	// IOs: Enable path (active high: 0=input, 1=output)
	input  wire       ena,
	input  wire       clk,
	input  wire       rst_n
);


endmodule // tt_um_example
