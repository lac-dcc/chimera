// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter X_WIDTH = 10,
              Y_WIDTH = 10,
              clk_mhz = 50
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

    wire   reset       =   ~ sw [0];

    assign led         =   { sw, key };
    assign abcdefgh    =   { sw, key };
    assign digit       =   { sw, key };
    assign buzzer      =   ~ reset;

    //------------------------------------------------------------------------

    wire                 display_on;
    wire [X_WIDTH - 1:0] pixel_x;
    wire [Y_WIDTH - 1:0] pixel_y;
 
    vga
    # (
        .HPOS_WIDTH ( X_WIDTH    ),
        .VPOS_WIDTH ( Y_WIDTH    ),
        
        .CLK_MHZ    ( clk_mhz    )
    )
    i_vga
    (
        .clk        ( clk        ), 
        .reset      ( reset      ),
        .hsync      ( hsync      ),
        .vsync      ( vsync      ),
        .display_on ( display_on ),
        .hpos       ( pixel_x    ),
        .vpos       ( pixel_y    )
    );

    //------------------------------------------------------------------------

    color_square 
    # (
       .HPOS_WIDTH  ( X_WIDTH    ),
       .VPOS_WIDTH  ( Y_WIDTH    )
    )
    i_color_square
    (
        .clk        (   clk        ),
        .reset      (   reset      ),
        .display_on (   display_on ),
        .key_sw     ( ~ key        ),
        .hpos       (   pixel_x    ),
        .vpos       (   pixel_y    ),
        .rgb        (   rgb        )
    );

endmodule
