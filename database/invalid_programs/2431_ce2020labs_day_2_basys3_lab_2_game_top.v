// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

// Basys3 wrapper

module top
# (
    parameter clk_mhz = 100,
              strobe_to_update_xy_counter_width = 20
)
(
    input        clk,

    input        btnC,
    input        btnU,
    input        btnL,
    input        btnR,
    input        btnD,

    output       Hsync,
    output       Vsync,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue
);

    wire r,g,b;

    assign vgaRed   = { 4 { r } };
    assign vgaGreen = { 4 { g } };
    assign vgaBlue  = { 4 { b } };

    wire any_key = btnC | btnU | btnL | btnR;

    game_top
    # (
        .clk_mhz (clk_mhz),

        .strobe_to_update_xy_counter_width
        (strobe_to_update_xy_counter_width)
    )
    i_game_top
    (
        .clk              (   clk           ),
        .reset            ( ~ btnD          ),

        .launch_key       (   launch        ),
        .left_right_keys  ( { btnL , btnR } ),

        .hsync            (   Hsync         ),
        .vsync            (   Vsync         ),
        .rgb              ( { r, g, b }     )
    );

endmodule
