`default_nettype none

`include "../include/led-pwm-gamma.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

        led_main #(
            .FRAME_BITS(8),
            .DELAY(1)
        ) main (
            .CLK(CLK),
            .resetn_btn(BTN_N),
            .LED_PANEL(LED_PANEL));

endmodule


module painter24(
        input        clk,
        input        reset,
        input  [7:0] frame,
        input  [7:0] subframe,
        input  [5:0] x,
        input  [5:0] y,
        output [23:0] rgb24);

    wire clip_mask;
    assign clip_mask = (x < 16 | x > 48) | (y < 16 | y > 48);

    reg [7:0] red, green, blue;
    always @(posedge clk) begin
        red   <= ~clip_mask ? ((x + y) ^ (x - y)) + frame[2+:6] : 0;
        green <= clip_mask ? (x ^ y) + frame[2+:6] : 0;
        blue  <= 10;
    end

    wire [7:0] red_swiz, green_swiz, blue_swiz;
    assign red_swiz   = {red[3], red[2], red[1], red[0],
                         red[4], red[5], red[6], red[7]};
    assign green_swiz = {green[3], green[2], green[1], green[0],
                        green[4], green[5], green[6], green[7]};
    assign blue_swiz  = {red[5], green[5], red[4], green[4],
                         green[5], green[4], 1'b0, 1'b0};
    assign rgb24      = {blue_swiz, green_swiz, red_swiz};
    // assign rgb24 = {blue_swiz, 8'b0, 8'b0};

endmodule
