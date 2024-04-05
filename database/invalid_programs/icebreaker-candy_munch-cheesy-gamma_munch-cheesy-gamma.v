`default_nettype none

`include "../include/led-simple.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

    led_main main(
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

    wire [7:0] cmp = {subframe[0], subframe[1], subframe[2], subframe[3],
                      subframe[4], subframe[5], subframe[6], subframe[7]};

    wire [5:0] z6  = x ^ y ^ frame[2+:6];
    // wire [7:0] z8g = z6[5:2] * z6[5:2];
    wire [7:0] z8g = z6[5:2] * z6[3:0];
    wire z1g       = z8g > cmp;

    assign rgb = {z1g, z1g, z1g};

endmodule
