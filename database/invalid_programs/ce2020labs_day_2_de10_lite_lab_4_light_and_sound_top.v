// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter clk_mhz = 50
)
(
    input           adc_clk_10,
    input           max10_clk1_50,
    input           max10_clk2_50,

    input   [ 1:0]  key,
    input   [ 9:0]  sw,
    output  [ 9:0]  led,

    output  [ 7:0]  hex0,
    output  [ 7:0]  hex1,
    output  [ 7:0]  hex2,
    output  [ 7:0]  hex3,
    output  [ 7:0]  hex4,
    output  [ 7:0]  hex5,

    output          vga_hs,
    output          vga_vs,
    output  [ 3:0]  vga_r,
    output  [ 3:0]  vga_g,
    output  [ 3:0]  vga_b,

    inout   [35:0]  gpio
);

    assign vga_hs = 1'b0;
    assign vga_vs = 1'b0;
    assign vga_r  = 4'b0;
    assign vga_g  = 4'b0;
    assign vga_b  = 4'b0;

    //------------------------------------------------------------------------

    wire clk   = max10_clk1_50;
    wire reset = sw [9];

    //------------------------------------------------------------------------

    wire [15:0] value;

    pmod_als_spi_receiver i_light_sensor
    (
        .clock ( clk        ),
        .reset ( reset      ),
        .cs    ( gpio  [34] ),
        .sck   ( gpio  [28] ),
        .sdo   ( gpio  [30] ),
        .value ( value      )
    );

    assign gpio [26] = 1'b0;  // GND for Pmod ALS

    //------------------------------------------------------------------------

    assign led = value [15:6];

    //------------------------------------------------------------------------

    reg [15:0] prev_value;
    reg [23:0] counter;
    reg [23:0] distance;

    localparam [15:0] threshold = 16'h1000;

    always @ (posedge clk or posedge reset)
        if (reset)
        begin
            prev_value <= 16'h0;
            counter    <= 16'h0;
            distance   <= 16'h0;
        end
        else
        begin
            prev_value <= value;

            if (  value      > threshold
                & prev_value < threshold)
            begin
               distance <= counter;
               counter  <= 23'h0;
            end
            else
            begin
               counter <= counter + 23'h1;
            end
        end

    //------------------------------------------------------------------------

    wire [23:0] number_to_display = distance;

    seven_segment_digit i_digit_0 ( number_to_display [ 3: 0], hex0 [6:0]);
    seven_segment_digit i_digit_1 ( number_to_display [ 7: 4], hex1 [6:0]);
    seven_segment_digit i_digit_2 ( number_to_display [11: 8], hex2 [6:0]);
    seven_segment_digit i_digit_3 ( number_to_display [15:12], hex3 [6:0]);
    seven_segment_digit i_digit_4 ( number_to_display [19:16], hex4 [6:0]);
    seven_segment_digit i_digit_5 ( number_to_display [23:20], hex5 [6:0]);

    assign { hex0 [7], hex1 [7], hex2 [7], hex3 [7], hex4 [7], hex5 [7] } = 6'b0;

endmodule
