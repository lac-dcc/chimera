// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter clk_mhz = 50
)
(
    input         clk,
    input  [ 3:0] key,
    input  [ 7:0] sw,
    output [11:0] led,

    output [ 7:0] abcdefgh,
    output [ 7:0] digit,

    output        vsync,
    output        hsync,
    output [ 2:0] rgb,

    inout  [18:0] gpio
);

    wire reset = ~ key [3];

    assign led       = { key, sw };
    assign abcdefgh  = 8'b1;
    assign digit     = 8'b1;

    wire       display_on;
    wire [9:0] hpos;
    wire [9:0] vpos;

    vga i_vga
    (
        .clk        ( clk           ),
        .reset      ( reset         ),
        .hsync      ( hsync         ),
        .vsync      ( vsync         ),
        .display_on ( display_on    ),
        .hpos       ( hpos          ),
        .vpos       ( vpos          )
    );

    wire [2:0] rgb_squares
        = hpos ==  0 || hpos == 639 || vpos ==  0 || vpos == 479 ? 3'b100 :
          hpos ==  5 || hpos == 634 || vpos ==  5 || vpos == 474 ? 3'b010 :
          hpos == 10 || hpos == 629 || vpos == 10 || vpos == 469 ? 3'b001 :
          hpos <  20 || hpos >  619 || vpos <  20 || vpos >= 459 ? 3'b000 :
          { 1'b0, vpos [4], hpos [3] ^ vpos [3] };
			 
    wire        lfsr_enable = ! hpos [9:8] & ! vpos [9:8];
    wire [15:0] lfsr_out;

//    select Fibonacci or Galois lfsr
//    uncomment one string and comment other

    lfsr_fibonacci #(16, 16'b1000000001011, 0) i_lfsr_fibonacci   
//    lfsr_galois #(16, 16'b1000000001011, 0) i_lfsr_galois
    (
        .clk    ( clk           ),
        .reset  ( reset         ),
        .enable ( lfsr_enable   ),
        .out    ( lfsr_out      )
    );

    wire star_on = & lfsr_out [15:9];
    assign rgb = lfsr_enable ? (star_on ? lfsr_out [2:0] : 3'b0) : rgb_squares;

endmodule
