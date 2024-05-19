// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none

`include "../include/led-delay.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

    led_main #(
        .DELAY(3)
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

    wire border, x_single_bit, y_single_bit;
    reg [2:0] rgb_r0, rgb_r1, rgb_r2;

    assign border = x == 0 || y == 0 || x == 63 || y == 63;
    assign x_single_bit = (| x) & (~|(x & (x - 1)));
    assign y_single_bit = (| y) & (~|(y & (y - 1)));

    always @(posedge clk) begin
        //             BLUE GREEN RED
        rgb_r2 <= rgb_r1;
        rgb_r1 <= rgb_r0;
        rgb_r0 <= {border, y_single_bit, x_single_bit};
        // if (y < 32)
        //     rgb_r0 <= y[2:0];
        // else
        //     rgb_r0 = x[2:0];
    end

    assign rgb = rgb_r2;

endmodule
