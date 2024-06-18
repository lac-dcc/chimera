// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter clk_mhz = 50,
              strobe_to_update_xy_counter_width = 20
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

    assign led  = 10'b0;

    assign hex0 = 8'hff;
    assign hex1 = 8'hff;
    assign hex2 = 8'hff;
    assign hex3 = 8'hff;
    assign hex4 = 8'hff;
    assign hex5 = 8'hff;

    wire clk   = max10_clk1_50;
    wire reset = sw [9];

    wire [2:0] rgb;

    assign vga_r = { 4 { rgb [2] } };
    assign vga_g = { 4 { rgb [1] } };
    assign vga_b = { 4 { rgb [0] } };

    wire left_key   = ~ key [1];
    wire right_key  = ~ key [0];
    wire launch_key = left_key | right_key;

    game_top
    # (
        .clk_mhz (clk_mhz),

        .strobe_to_update_xy_counter_width
        (strobe_to_update_xy_counter_width)
    )
    i_game_top
    (
        .clk              (   clk                   ),
        .reset            (   reset                 ),

        .launch_key       (   launch_key            ),
        .left_right_keys  ( { left_key, right_key } ),

        .hsync            (   vga_hs                ),
        .vsync            (   vga_vs                ),
        .rgb              (   rgb                   )
    );

endmodule
