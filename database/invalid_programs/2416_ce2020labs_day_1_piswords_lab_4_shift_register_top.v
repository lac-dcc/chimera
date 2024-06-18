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

    wire reset = ~ key[3];

    assign abcdefgh  = 8'hff;
    assign digit     = 4'hf;
    assign buzzer    = 1'b1;
    assign hsync     = 1'b1;
    assign vsync     = 1'b1;
    assign rgb       = 3'b0;
    
    //------------------------------------------------------------------------

    reg [31:0] cnt;
    
    always @ (posedge clk or posedge reset)
      if (reset)
        cnt <= 32'b0;
      else
        cnt <= cnt + 32'b1;
        
    wire enable = (cnt [22:0] == 23'b0);

    //------------------------------------------------------------------------

    wire button_on = ~ key [0];

    reg [7:0] shift_reg;
    
    always @ (posedge clk or posedge reset)
      if (reset)
        shift_reg <= 8'b0;
      else if (enable)
        shift_reg <= { button_on, shift_reg [7:1] };

    assign led = ~ shift_reg;

    // Exercise 1: Make the light move in the opposite direction.

    // Exercise 2: Make the light moving in a loop.
    // Use another key to reset the moving lights back to no lights.

    // Exercise 3: Display the state of the shift register
    // on a seven-segment display, moving the light in a circle.

endmodule
