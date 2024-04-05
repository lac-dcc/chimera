`default_nettype none

`include "../include/led-delay.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

    led_main #(
        .FRAME_BITS(7),
        .DELAY(3)
    ) main (
        .CLK(CLK),
        .resetn_btn(BTN_N),
        .LED_PANEL(LED_PANEL));

endmodule

module painter(
        input        clk,
        input        reset,
        input  [6:0] frame,
        input  [7:0] subframe,
        input  [5:0] x,
        input  [5:0] y,
        output [2:0] rgb);

    reg [11:0] x2, y2;
    always @(posedge clk) begin
        x2 <= (6'd32 - x) * (6'd32 - x);
        y2 <= (6'd32 - y) * (6'd32 - y);
    end

    reg [11:0] r2;
    always @(posedge clk) begin
        r2 <= x2 + y2;
    end

    reg  [7:0] sqrt_table [0:2047];
    initial $readmemh("sqrt_table.hex", sqrt_table);

    reg  [5:0] r;
    always @(posedge clk) begin
        r <= sqrt_table[r2];
    end

    wire [4:0] color;
    wire red, green, blue;
    assign color = r - frame[2+:5];
    assign red = & color;
    assign green = 0;
    assign blue = & color[1:0];
    assign rgb = {blue, green, red};

endmodule
