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
    output  [ 3:0]  vga_b

);


    assign hex0       = 8'hff;
    assign hex1       = 8'hff;
    assign hex2       = 8'hff;
    assign hex3       = 8'hff;
    assign hex4       = 8'hff;
    assign hex5       = 8'hff;
    assign led [9:1]  = 9'b0;
    assign led [0]    = sw [0];

    wire       reset  = sw [0];

    wire       display_on;
    wire [9:0] hpos;
    wire [9:0] vpos;

    vga i_vga
    (
        .clk        ( max10_clk1_50 ),
        .reset      ( reset         ),
        .hsync      ( vga_hs        ),
        .vsync      ( vga_vs        ),
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
        .clk    ( max10_clk1_50 ),
        .reset  ( reset         ),
        .enable ( lfsr_enable   ),
        .out    ( lfsr_out      )
    );

    wire star_on = & lfsr_out [15:9];
    wire [2:0] rgb = lfsr_enable ? (star_on ? lfsr_out [2:0] : 3'b0) : rgb_squares;

    assign vga_r = { 4 { rgb [2] } };
    assign vga_g = { 4 { rgb [1] } };
    assign vga_b = { 4 { rgb [0] } };

endmodule
