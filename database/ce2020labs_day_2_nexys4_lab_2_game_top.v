// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

// Nexus A7 wrapper

module top
# (
    parameter clk_mhz = 100,
              strobe_to_update_xy_counter_width = 20
)
(
    input        CLK100MHZ,
    input        CPU_RESETN,

    input        BTNC,
    input        BTNU,
    input        BTNL,
    input        BTNR,
    input        BTND,

    output       VGA_HS,
    output       VGA_VS,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B
);

    wire r,g,b;

    assign VGA_R = { 4 { r } };
    assign VGA_G = { 4 { g } };
    assign VGA_B = { 4 { b } };

    wire any_key = BTNC | BTNU | BTNL | BTNR | BTND;

    game_top
    # (
        .clk_mhz (clk_mhz),

        .strobe_to_update_xy_counter_width
        (strobe_to_update_xy_counter_width)
    )
    i_game_top
    (
        .clk              (   CLK100MHZ     ),
        .reset            ( ~ CPU_RESETN    ),

        .launch_key       (   any_key       ),
        .left_right_keys  ( { BTNL , BTNR } ),

        .hsync            (   VGA_HS        ),
        .vsync            (   VGA_VS        ),
        .rgb              ( { r, g, b }     )
    );

endmodule
