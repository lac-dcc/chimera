// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none

`include "../include/led-delay.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

    led_main #(
        .DELAY(2)
    ) main (
        .CLK(CLK),
        .resetn_btn(BTN_N),
        .LED_PANEL(LED_PANEL));

endmodule

module painter(
        input        clk,
        input        reset,
        input  [9:0] frame,
        input  [7:0] subframe,
        input  [5:0] x,
        input  [5:0] y,
        output [2:0] rgb);

    reg [10:0] x2, y2;
    reg [10:0] r2;
    wire on_circle = (256 <= r2) && (r2 < 289);
    reg on_border [0:1];

    always @(posedge clk) begin
        x2 <= (6'd32 - x) * (6'd32 - x);
        y2 <= (6'd32 - y) * (6'd32 - y);
        on_border[0] <= x == 0 || x == 63 || y == 0 || y == 63;
    end

    always @(posedge clk) begin
        on_border[1] <= on_border[0];
        r2 <= x2 + y2;
    end

    //             BLUE GREEN RED
    assign rgb = {1'b0, on_circle, on_border[1]};

endmodule
