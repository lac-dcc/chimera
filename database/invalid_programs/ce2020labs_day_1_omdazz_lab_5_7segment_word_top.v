// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
(
    input        clk,
    input        reset_n,
    
    input  [3:0] key_sw,
    output [3:0] led,

    output [7:0] abcdefgh,
    output [3:0] digit,

    output       buzzer,

    output       hsync,
    output       vsync,
    output [2:0] rgb
);

    wire reset = ~ reset_n;

    assign led    = 4'hf;
    assign buzzer = 1'b0;
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

    reg [3:0] shift_reg;
    
    always @ (posedge clk or posedge reset)
      if (reset)
        shift_reg <= 4'b0001;
      else if (enable)
        shift_reg <= { shift_reg [0], shift_reg [3:1] };

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
                    P = 8'b00110001;

    reg [7:0] letter;
    
    always @*
      case (shift_reg)
      4'b1000: letter = C;
      4'b0100: letter = h;
      4'b0010: letter = I;
      4'b0001: letter = P;
      default: letter = E;
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
