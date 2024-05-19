// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
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

    assign abcdefgh = 8'hff;
    assign digit    = 8'b0;
    assign hsync    = 1'b1;
    assign vsync    = 1'b1;
    assign rgb      = 3'b0;

    wire a = ~ key [0];
    wire b = ~ key [1];
    
    wire result = a ^ b;

    assign led [0] = ~ result;
    
    assign led [1] = ~ (~ key [0] ^ ~ key [1]);

    // Exercise 1: Change the code below.
    // Write the same for AND and OR operations
    
    assign led [2] = 1'b1;
    assign led [3] = 1'b1;

    // Exercise 2: Change the code below.
    // Assign to led [4] the result of XOR operation
    // without using "^" operation.
    // Use only operations "&", "|", "~" and parenthesis, "(" and ")".

    assign led [4] = 1'b1;

    assign led [11:5] = 7'h7f;

endmodule
