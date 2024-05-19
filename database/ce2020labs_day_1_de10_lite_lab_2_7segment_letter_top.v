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

    assign led  = 10'b0;

    wire clk   = max10_clk1_50;
    wire reset = sw [9];

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
                    E  = 8'b10000110,
                    h  = 8'b10001011,
                    I  = 8'b11001111,
                    O  = 8'b11000000,
                    P  = 8'b10001100,
                    X  = 8'b10001001,
                    D0 = 8'b11000000,
                    D2 = 8'b10100100;

    wire sel = key [0];

    assign hex5 = sel ? C : E;
    assign hex4 = sel ? h : X;
    assign hex3 = sel ? I : P;
    assign hex2 = sel ? P : O;
    assign hex1 =       D2;
    assign hex0 =       D0;

    // Alternative way

    /*
    assign { hex5, hex4, hex3, hex2 } =
       sel ? { C, h, I, P } : { E, X, P, O };

    assign { hex1, hex0 } = { D2, D0 };
    */

    // Exercise: Display your first and last names

endmodule
