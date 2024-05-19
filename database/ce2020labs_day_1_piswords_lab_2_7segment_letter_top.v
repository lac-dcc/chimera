// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
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

    assign led    = 8'hff;
    assign buzzer = 1'b1;
    assign hsync  = 1'b1;
    assign vsync  = 1'b1;
    assign rgb    = 3'b0;

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
    //  0 means light

    parameter [7:0] C = 8'b01100011,
                    E = 8'b01100001,
                    h = 8'b11010001,
                    I = 8'b11110011,
                    P = 8'b00110001;

    assign abcdefgh = key [0] ? C : E;
    assign digit    = key [1] ? 8'b11111110 : 8'b11111101;

    // Exercise 1: Display the first letters
    // of your first name and last name instead.

    // assign abcdefgh = ...
    // assign digit    = ...

    // Exercise 2: Display letters of a 4-character word
    // using this code to display letter of ChIP as an example

    /*

    reg [7:0] letter;
    
    always @*
      case (sw)
      4'b0111: letter = C;
      4'b1011: letter = h;
      4'b1101: letter = I;
      4'b1110: letter = P;
      default: letter = E;
      endcase
      
    assign abcdefgh = letter;
    assign digit    = (sw == 4'b1111) ? 4'b0000 : sw;
    */

endmodule
