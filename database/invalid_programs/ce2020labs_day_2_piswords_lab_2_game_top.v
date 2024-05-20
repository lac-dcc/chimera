// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter clk_mhz = 50,
              strobe_to_update_xy_counter_width = 20
)
(
    input         clk,
    input  [ 3:0] key,
    input  [ 3:0] sw,
    output [ 7:0] led,

    output [ 7:0] abcdefgh,
    output [ 7:0] digit,

    output        vsync,
    output        hsync,
    output [ 2:0] rgb,

    output        buzzer,
    inout  [15:0] gpio
);

    wire   reset       = ~ key [3];

    assign led         =   { sw, key };
    assign abcdefgh    =   { sw, key };
    assign digit       =   { sw, key };
    assign buzzer      = ~ reset;

    wire   launch_key  = ~ key [1] | ~ key [0];
    wire   left_key    = ~ key [1];
    wire   right_key   = ~ key [0];

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

        .hsync            (   hsync                 ),
        .vsync            (   vsync                 ),
        .rgb              (   rgb                   )
    );

endmodule
