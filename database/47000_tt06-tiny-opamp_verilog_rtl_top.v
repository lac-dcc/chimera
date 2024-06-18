// This program was cloned from: https://github.com/argunda/tt06-tiny-opamp
// License: Apache License 2.0

`default_nettype none
`timescale 1ns / 1ps

module top(
    // 8 dedicated user inputs:
    input   wire [3:0]  ui_in,

    // 8 dedicated user outputs:
    output  wire [7:0]  uo_out,
    
    // Control:
    input   wire        clk,        // 25.175MHz ideal, but 25.000MHz is good enough.
    input   wire        rst_n       // Active low reset
);

    // Register the RGB outputs for stability:
    wire r, g, b;
    reg qr, qg, qb;
    always @(posedge clk) {qr,qg,qb} <= {r,g,b};
    assign uo_out[2:0] = {qr,qg,qb};

    // Input metastability avoidance. Do we really need this, for this design?
    // I'm playing it extra safe :)
    wire pause_n, new_game_n, down_key_n, up_key_n;
    input_sync pause    (.clk(clk), .d(~ui_in[0]), .q(pause_n   ));
    input_sync new_game (.clk(clk), .d(~ui_in[1]), .q(new_game_n));
    input_sync down_key (.clk(clk), .d(~ui_in[2]), .q(down_key_n));
    input_sync up_key   (.clk(clk), .d(~ui_in[3]), .q(up_key_n  ));

    wire [9:0] h;
    wire [9:0] v;
    wire [4:0] offset; // This is effectively a frame counter.

    solo_squash game(
        // --- Inputs ---
        .clk        (clk),
        .reset      (~rst_n),       // Active HIGH reset needed here.
        // Active-low control inputs (but pulled low by the chip BY DEFAULT when not pressed, so inverted here):
        .pause_n    (pause_n),
        .new_game_n (new_game_n),
        .down_key_n (down_key_n),
        .up_key_n   (up_key_n),

        // --- Outputs ---
        .red        (r),
        .green      (g),
        .blue       (b),
        .hsync      (uo_out[3]),
        .vsync      (uo_out[4]),
        .speaker    (uo_out[5]),
        // Debug outputs:
        .col0       (uo_out[6]),
        .row0       (uo_out[7]),
        .h_out      (),
        .v_out      (),
        .offset_out (),
        .visible_out()
    );

endmodule

// Basic double DFF metastability avoidance:
module input_sync(
    input wire clk,
    input wire d,
    output wire q
);
    reg dff1, dff2;
    assign q = dff2;
    always @(posedge clk) {dff2,dff1} <= {dff1,d};
endmodule
