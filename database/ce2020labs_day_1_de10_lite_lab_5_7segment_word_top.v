// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
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

    assign led = 10'b0;

    wire clk   = max10_clk1_50;
    wire reset = sw [9];

    //------------------------------------------------------------------------

    reg [31:0] cnt;

    always @ (posedge clk or posedge reset)
      if (reset)
        cnt <= 32'b0;
      else
        cnt <= cnt + 32'b1;

    wire enable = (cnt [22:0] == 23'b0);

    //------------------------------------------------------------------------

    //   --a--
    //  |     |
    //  f     b
    //  |     |
    //   --g--
    //  |     |
    //  e     c
    //  |     |
    //   --d--  h
    //
    //  hgfedcba
    //  0 means light

    parameter [7:0] C  = 8'b11000110,
                    h  = 8'b10001011,
                    I  = 8'b11001111,
                    P  = 8'b10001100,
                    _  = 8'b11111111;

    reg [10 * 8 - 1:0] shift_reg;

    always @ (posedge clk or posedge reset)
      if (reset)
        shift_reg <= { C, h, I, P, { 6 { _ } } };
      else if (enable)
        shift_reg <= { shift_reg [7:0], shift_reg [10 * 8 - 1:8] };

    assign { hex5, hex4, hex3, hex2, hex1, hex0 }
      = shift_reg [6 * 8 - 1:0];
      
    // Exercise 1: Modify the code so the speed and the direction
    // of the movement changes when you press a key.

    // Exercise 2: Put your name, another word or a picture to the display.

endmodule
