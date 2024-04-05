`default_nettype none

`include "../include/led-pwm-gamma.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

        led_main #(
            .FRAME_BITS(12),
            .DELAY(1)
        ) main (
            .CLK(CLK),
            .resetn_btn(BTN_N),
            .LED_PANEL(LED_PANEL));

endmodule


module painter24 (
        input         clk,
        input         reset,
        input  [11:0] frame,
        input   [7:0] subframe,
        input   [5:0] x,
        input   [5:0] y,
        output [23:0] rgb24);

    wire [7:0] rindex = frame[2+:7] - frame[11:10];
    wire [7:0] gindex = frame[1+:7] - frame[11:9];
    wire [7:0] bindex = frame[0+:7] - frame[11:8];

    wire r0 = (x ^ y) == rindex;
    wire r1 = (x ^ y) == rindex - 1;
    wire r2 = (x ^ y) == rindex - 2;
    wire r3 = (x ^ y) == rindex - 3;
    wire r4 = (x ^ y) == rindex - 4;
    wire r5 = (x ^ y) == rindex - 5;
    wire r6 = (x ^ y) == rindex - 6;
    wire r7 = (x ^ y) == rindex - 7;

    wire g0 = (x ^ y) == gindex;
    wire g1 = (x ^ y) == gindex - 2;
    wire g2 = (x ^ y) == gindex - 4;
    wire g3 = (x ^ y) == gindex - 8;
    wire g4 = (x ^ y) == gindex - 10;
    wire g5 = (x ^ y) == gindex - 12;
    wire g6 = (x ^ y) == gindex - 14;
    wire g7 = (x ^ y) == gindex - 16;

    wire b0 = (x ^ y) == bindex;
    wire b1 = (x ^ y) == bindex - 4;
    wire b2 = (x ^ y) == bindex - 8;
    wire b3 = (x ^ y) == bindex - 12;
    wire b4 = (x ^ y) == bindex - 16;
    wire b5 = (x ^ y) == bindex - 20;
    wire b6 = (x ^ y) == bindex - 24;
    wire b7 = (x ^ y) == bindex - 28;

    reg [7:0] red, grn, blu;
    always @(posedge clk) begin
        red <= {r0, r1, r2, r3, r4, r5, r6, r7};
        // grn <= {g0, g1, g2, g3, g4, g5, g6, g7};
        grn <= {g7, g6, g5, g4, g3, g2, g1, g0};
        blu <= {b0, b1, b2, b3, b4, b5, b6, b7};
        // red <= (x ^ y) == frame[2+:7] - frame[11:10] ? 255 : 0;
        // grn <= (x ^ y) == frame[1+:7] - frame[11:9] ? 255 : 0;
        // blu <= (x ^ y) == frame[0+:7] - frame[11:8]? 255 : 0;
    end

    assign rgb24 = {blu, grn, red};

endmodule // painter24
