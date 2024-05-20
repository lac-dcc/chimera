// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_formal.v
 *
 * Formal connectivity check
 *
 * Copyright (c) 2023 Matt Venn <matt@mattvenn.net>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`timescale 1ns / 100ps

module tt_formal;

	// Signals
	// -------

	// DUT signals
	wire [37:0] io_in;
	wire [37:0] io_out;
	wire [37:0] io_oeb;
	wire        k_zero;
	wire        k_one;


	// DUT
	// ---

	tt_top #(
		.N_PADS (44),
        .G_X    (16),
		.G_Y    (24),
		.N_IO   (8),
		.N_O    (8),
		.N_I    (10)
	) dut_I (
		.io_in       (io_in),
		.io_out      (io_out),
		.io_oeb      (io_oeb),
		.k_zero      (k_zero),
		.k_one       (k_one)
	);

    /* 
    IO in/out/oeb is split like this:
    io_oeb is 'output enable bar': low means a pin is an output

	31:24 user out
	23:16 user io
	   15 user rst
	   14 user clk
	   13 user in [7]
	 6: 0 user in [6:0]


    */

    // loop back dedicated outs to ins
    assign { io_in[13], io_in[6:0] } = io_out[31:24];

    // loop back bidirectional outs to ins, depending on output enable
    assign io_in[23:16] = io_out[23:16] & (~io_oeb[23:16]);


endmodule // tt_formal
