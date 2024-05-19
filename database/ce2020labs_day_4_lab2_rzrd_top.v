// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter clk_mhz = 50,
              strobe_to_update_xy_counter_width = 20
)
(
    input        clk,
    input        reset_n,
    
    input  [3:0] key_sw,
    output [3:0] led,

    output [7:0] abcdefgh,
    output [3:0] digit,

    output       buzzer,

    output       hsync,
    output       vsync,
    output [2:0] rgb
);

    assign led       = key_sw;
    assign abcdefgh  = { key_sw, key_sw };
    assign digit     = 4'b0;
    assign buzzer    = 1'b0;

    wire launch_key = key_sw != 4'b1111;  // Any key is pressed
    
    // Either of two leftmost keys is pressed
    wire left_key   = key_sw [3:2] != 2'b11;

    // Either of two rightmost keys is pressed
    wire right_key  = key_sw [1:0] != 2'b11;

    wire [3:0] key_sw_p  = ~ key_sw;

    risk_game_top
    # (
        .clk_mhz (clk_mhz),

        .strobe_to_update_xy_counter_width
        (strobe_to_update_xy_counter_width)
    )
    i_game_top
    (
        .clk              (   clk                   ),
        .reset            ( ~ reset_n               ),

        .launch_key       (   launch_key            ),
        .left_right_keys  ( { left_key, right_key } ),
        .key_sw           (   key_sw_p              ),

        .hsync            (   hsync                 ),
        .vsync            (   vsync                 ),
        .rgb              (   rgb                   )
    );

endmodule
