// This program was cloned from: https://github.com/sellicott/sellicott_fib_seq
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Sam Ellicott
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_sellicott_fib_seq (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    fib #(
        .WIDTH(8)
    ) fib_inst (
        // global control signals
        .i_reset (~rst_n),
        .i_clk   (clk),

        // control signals
        .i_stb  (uio_in [0]),
        .o_busy (uio_out[1]),

        // module inputs/outputs
        .i_n   (ui_in [7:0]),
        .o_fib (uo_out[7:0])
    );

    // All output pins must be assigned. If not used, assign to 0.
    assign uio_oe [7:0] = 8'h2;
    assign uio_out[7:2] = 6'h0;
    assign uio_out[0]   = 1'h0;

endmodule
