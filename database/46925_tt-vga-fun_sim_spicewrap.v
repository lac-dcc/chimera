// This program was cloned from: https://github.com/algofoogle/tt-vga-fun
// License: Apache License 2.0

`default_nettype none

// This wrapper exists to work around what appears to be a problem where
// ngspice doesn't properly support buses (vectors) in d_cosim.

module controller_spicewrap(
    input wire clk,
    input wire rst_n,

    input wire in7,
    input wire in6,
    input wire in5,
    input wire in4,
    input wire in3,
    input wire in2,
    input wire in1,
    input wire in0,

    output wire hsync,
    output wire vsync,
    output wire hblank,
    output wire vblank,

    output wire r7,
    output wire r6,
    output wire r5,
    output wire r4,
    output wire r3,
    output wire r2,
    output wire r1,
    output wire r0,

    output wire g7,
    output wire g6,
    output wire g5,
    output wire g4,
    output wire g3,
    output wire g2,
    output wire g1,
    output wire g0,

    output wire b7,
    output wire b6,
    output wire b5,
    output wire b4,
    output wire b3,
    output wire b2,
    output wire b1,
    output wire b0,

    output wire dr7,
    output wire dg7,
    output wire db7,

    output wire dr6,
    output wire dg6,
    output wire db6

    // // Debug stuff...

    // output wire m7,
    // output wire m6,
    // output wire m5,
    // output wire m4,
    // output wire m3,
    // output wire m2,
    // output wire m1,
    // output wire m0,

    // output wire o_reset,
    // output wire o_visible,
    // output wire c7,
    // output wire c6,
    // output wire c5,
    // output wire c4,
    // output wire c3,
    // output wire c2,
    // output wire c1,
    // output wire c0,

    // output wire o_clk,
    // output wire ix7,
    // output wire ix6,
    // output wire ix5,
    // output wire ix4,
    // output wire ix3,
    // output wire ix2,
    // output wire ix1,
    // output wire ix0,

    // output wire o_clk2,
    // output wire o_zero,
    // output wire o_one

);


    controller controller_0(
        .clk      (clk),
        .rst_n    (rst_n),
        .ui_in    ({in7,in6,in5,in4,in3,in2,in1,in0}),
        .hsync    (hsync),
        .vsync    (vsync),
        .hblank   (hblank),
        .vblank   (vblank),
        .r        ({r7,r6,r5,r4,r3,r2,r1,r0}),
        .g        ({g7,g6,g5,g4,g3,g2,g1,g0}),
        .b        ({b7,b6,b5,b4,b3,b2,b1,b0}),
        .r7       (dr7),
        .g7       (dg7),
        .b7       (db7),
        .r6       (dr6),
        .g6       (dg6),
        .b6       (db6)
        // // Debug stuff...
        // .o_mode   ({m7,m6,m5,m4,m3,m2,m1,m0}),
        // .o_reset  (o_reset),
        // .o_visible(o_visible),
        // .o_rampc  ({c7,c6,c5,c4,c3,c2,c1,c0}),
        // .o_clk    (o_clk),
        // .o_in     ({ix7,ix6,ix5,ix4,ix3,ix2,ix1,ix0}),
        // .o_clk2   (o_clk2),
        // .o_zero   (o_zero),
        // .o_one    (o_one)
    );


endmodule