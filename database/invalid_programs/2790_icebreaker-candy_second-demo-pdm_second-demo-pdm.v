// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none

`include "../include/led-pdm-gamma.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

    led_main #(
        .DELAY(1),
        .FRAME_BITS(10)
    ) main (
        .CLK(CLK),
        .resetn_btn(BTN_N),
        .LED_PANEL(LED_PANEL));

endmodule

module painter24(
        input         clk,
        input         reset,
        input   [9:0] frame,
        input   [7:0] subframe,
        input   [5:0] x,
        input   [5:0] y,
        output [23:0] rgb24);

    reg   [2:0] led_rgb0;
    reg   [2:0] led_rgb1;
    reg   [4:0] led_addr;
    reg         led_blank;
    reg         led_latch;
    wire        led_sclk;

    wire [7:0] xx, yy0;
    wire       blank;
    wire [2:0] row0, col;
    wire [7:0] xx_lo, yy_lo;
    wire [5:0] xort;
    reg  [7:0] red0, grn0, blu0;
    assign xx = x + frame[7:0];
    assign yy0 = y + frame[7:2];
    assign blank = ~(xx[3] & yy0[3]);
    assign row0 = yy0[6:4];
    assign col = xx[6:4];
    assign xx_lo = {xx[2:0], xx[2:0], xx[2]};
    assign yy_lo = {yy0[2:0], yy0[2:0], yy0[2]};
    assign xort = x ^ frame[9:2];
    always @(posedge clk) begin
        red0 = blank ? 0 : (row0[0] ? yy_lo : 0) | (col[0] ? xx_lo : 0);
        grn0 = blank ? 0 : (row0[1] ? yy_lo : 0) | (col[1] ? xx_lo : 0);
        blu0 = (xort == y)
                      ? 8'hFF
                      : blank
                          ? 0
                          : (row0[2] ? yy_lo : 0) | (col[2] ? xx_lo : 0);
    end

    assign rgb24 = {blu0, grn0, red0};

endmodule // painter24
