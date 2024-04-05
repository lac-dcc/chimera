`default_nettype none

`include "../include/led-pwm.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

        led_main #(
            .FRAME_BITS(6),
            .DELAY(2)
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

    assign blank   = !x[2:0] || !y[2:0];
    assign row     = y[5:3];
    assign col     = x[5:3];

    // Trickery: the minimum value that doesn't get gamma-corrected
    // to zero is 21.  So we'll put ceil(21/2) in the low four bits
    // of x_lo and y_lo instead of repeating the high bits.
    // It's wrong, but it's less visually objectionable than having
    // pixels flicker between nonzero and zero.
    //
    // assign x_lo    = {x[2:0], x[2:0], x[2:1]};
    // assign y_lo    = {y[2:0], y[2:0], y[2:1]};
    assign x_lo    = {x[2:0], 4'd11};
    assign y_lo    = {y[2:0], 4'd11};

    reg [7:0] red, green, blue;
    reg in_gamma;
    always @(posedge clk) begin
        in_gamma  <= ((x - frame[5:0]) & 6'h20) ? 1 : 0;
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
    end

    reg [15:0] gamma_table [0:255];
    initial $readmemh("gamma_table.hex", gamma_table);

    reg [7:0] red_g, green_g, blue_g;
    always @(posedge clk) begin
        red_g     <= in_gamma ? gamma_table[red  ][15:8] : red;
        green_g   <= in_gamma ? gamma_table[green][15:8] : green;
        blue_g    <= in_gamma ? gamma_table[blue ][15:8] : blue;
    end

    assign rgb24   = {blue_g, green_g, red_g};

endmodule
