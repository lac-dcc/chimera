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

    wire   reset  = ~ key [3];

    assign led    = 12'hfff;
    assign hsync  = 1'b1;
    assign vsync  = 1'b1;
    assign rgb    = 3'b0;

    //------------------------------------------------------------------------

    reg [31:0] cnt;
    
    always @ (posedge clk or posedge reset)
      if (reset)
        cnt <= 32'b0;
      else
        cnt <= cnt + 32'b1;
        
    wire enable = (cnt [22:0] == 23'b0);

    //------------------------------------------------------------------------

    reg [7:0] shift_reg;
    
    always @ (posedge clk or posedge reset)
      if (reset)
        shift_reg <= 8'b0000_0001;
      else if (enable)
        shift_reg <= { shift_reg [0], shift_reg [7:1] };

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
    //  0 means light

    parameter [7:0] C = 8'b01100011,
                    E = 8'b01100001,
                    h = 8'b11010001,
                    I = 8'b11110011,
                    O = 8'b00000011,
                    P = 8'b00110001,
                    X = 8'b10010001;

    reg [7:0] letter;
    
    always @*
      case (shift_reg)
      8'b1000_0000: letter = C;
      8'b0100_0000: letter = h;
      8'b0010_0000: letter = I;
      8'b0001_0000: letter = P;

      8'b0000_1000: letter = E;
      8'b0000_0100: letter = X;
      8'b0000_0010: letter = P;
      8'b0000_0001: letter = O;
      default:      letter = E;
      endcase

    assign abcdefgh = letter;
    assign digit    = ~ shift_reg;

    // Exercise 1: Increase the frequency of enable signal
    // to the level your eyes see the letters as a solid word
    // without any blinking. What is the threshold of such frequency?

    // Exercise 2: Put your name or another word to the display.

    // Exercise 3: Comment out the "default" clause from the "case" statement
    // in the "always" block,and re-synthesize the example.
    // Are you getting any warnings or errors? Try to explain why.

endmodule
