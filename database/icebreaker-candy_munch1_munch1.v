// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none

`include "../include/led-pwm-gamma.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

        led_main #(
            .FRAME_BITS(12),
            .DELAY(3)
        ) main (
            .CLK(CLK),
            .resetn_btn(BTN_N),
            .LED_PANEL(LED_PANEL));

endmodule


module lerp (
        input        clk,
        input  [7:0] a,
        input  [7:0] b,
        input  [7:0] t,
        output [7:0] m);

    // m = (t * a + (255 - t) * b) / 255;

    reg [7:0] a0, a1, b0, b1;
    always @(posedge clk) begin
        a0 <= t;
        a1 <= a;
        b0 <= 255 - t;
        b1 <= b;
    end

    reg [15:0] p0, p1;
    always @(posedge clk) begin
        p0 <= a0 * a1;
        p1 <= b0 * b1;
    end

    reg [15:0] m_r;
    always @(posedge clk) begin
        m_r <= p0 + p1;
    end

    // // identity: x / 255 == (x + 1 + x >> 8) >> 8
    // wire [15:0] intermediate = m_r + 1 + m_r[15:8];
    // assign m = intermediate[15:8];

    // That uses too many LUTs.  Divide by 256 instead.
    assign m = m_r[15:8];

endmodule // lerp


module painter24 (
        input         clk,
        input         reset,
        input  [11:0] frame,
        input   [7:0] subframe,
        input   [5:0] x,
        input   [5:0] y,
        output [23:0] rgb24);

    wire [5:0] xo = x ^ y ^ frame[1+:6];
    // wire [6:0] index = {xo[6], xo[5], xo[4],
    //                     xo[2], xo[1], xo[0], xo[3]};
    // wire [6:0] index = {xo[frame[8+:2]:0], xo[6:frame[8+:2]]};
    wire [7:0] index = {xo[5:0], xo[5:4]};

    localparam c0 = 24'h360033;
    localparam c1 = 24'h0b8793;
    // localparam c0 = 24'h1e130c;
    // localparam c1 = 24'h9a8478;

    wire [7:0] red, grn, blu;
    lerp red_lerp(clk, c0 >> 16, c1 >> 16, index, red);
    lerp grn_lerp(clk, c0 >>  8, c1 >>  8, index, grn);
    lerp blu_lerp(clk, c0 >>  0, c1 >>  0, index, blu);

    // always @(posedge clk)
    //     if (reset)
    //         {red, grn, blu} <= 0;
    //     else begin
    //         reg <= 0;
    //         grn <= {index[5:0], 2'b0};
    //         blu <= 0;
    //     end

    assign rgb24 = {blu, grn, red};

endmodule // painter24
