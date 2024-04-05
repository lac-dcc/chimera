`default_nettype none

`include "../include/led-bcm.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

    led_main #(
        .DELAY(1)
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

    wire border, x_single_bit, y_single_bit;
    reg [23:0] rgb;

    assign border = x == 0 || y == 0 || x == 63 || y == 63;
    assign x_single_bit = (| x) & (~|(x & (x - 1)));
    assign y_single_bit = (| y) & (~|(y & (y - 1)));

    always @(posedge clk)
        if (reset)
            rgb <= 0;
        else if (frame < x + y)
            rgb <= 0;
        else
            //             BLUE GREEN RED
            rgb <= {{8{x_single_bit}}, {8{y_single_bit}}, {8{border}}};

    assign rgb24 = rgb;
endmodule
