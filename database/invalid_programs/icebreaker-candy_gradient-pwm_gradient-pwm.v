`default_nettype none

`include "../include/led-pwm.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

        led_main #(
            .FRAME_BITS(6),
            .DELAY(1)
        ) main (
            .CLK(CLK),
            .resetn_btn(BTN_N),
            .LED_PANEL(LED_PANEL));

endmodule

module painter24(
        input        clk,
        input        reset,
        input  [5:0] frame,
        input  [7:0] subframe,
        input  [5:0] x,
        input  [5:0] y,
        output [23:0] rgb24);

    wire       blank;
    wire [2:0] row, col;
    wire [7:0] x_lo, y_lo;

    assign blank = !x[2:0] || !y[2:0];
    assign row   = y[5:3];
    assign col   = x[5:3];
    assign x_lo  = {x[2:0], x[2:0], x[2]};
    assign y_lo  = {y[2:0], y[2:0], y[2]};

    reg [7:0] red, green, blue;
    always @(posedge clk)
        if (blank) begin
            red   <= 0;
            green <= 0;
            blue  <= 0;
        end
        else begin
            red   <= (row[0] ? y_lo : 0) + (col[0] ? x_lo : 0);
            green <= (row[1] ? y_lo : 0) + (col[1] ? x_lo : 0);
            blue  <= (row[2] ? y_lo : 0) + (col[2] ? x_lo : 0);
        end

    assign rgb24 = {blue, green, red};

endmodule
