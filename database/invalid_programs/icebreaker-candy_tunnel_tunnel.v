`default_nettype none

`include "../include/led-simple.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

    led_main main (
        .CLK(CLK),
        .resetn_btn(BTN_N),
        .LED_PANEL(LED_PANEL));

endmodule

module painter(
        input        clk,
        input        reset,
        input [12:0] frame,
        input  [7:0] subframe,
        input  [5:0] x,
        input  [5:0] y,
        output [2:0] rgb);

    wire [5:0] dx0, dx1, dy0, dy1, dx, dy, dist;

    assign dx0 = x - 0;
    assign dx1 = 63 - x;
    assign dx = (dx0 < dx1) ? dx0 : dx1;
    assign dy0 = y - 0;
    assign dy1 = 63 - y;
    assign dy = (dy0 < dy1) ? dy0 : dy1;
    assign dist = (dx < dy) ? dx : dy;

    //             BLUE GREEN RED
    assign rgb = {dist[1:0] == frame[1+:2], 1'b0, 1'b0};

endmodule
