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

    wire reset = ~ key [3];

    assign abcdefgh = 8'hff;
    assign digit    = 8'hff;
    assign hsync    = 1'b1;
    assign vsync    = 1'b1;
    assign rgb      = 3'b0;

    // Exercise 1: Free running counter.
    // How do you change the speed of LED blinking?
    // Try different bit slices to display.

    reg [31:0] cnt;
    
    always @ (posedge clk or posedge reset)
      if (reset)
        cnt <= 32'b0;
      else
        cnt <= cnt + 32'b1;
        
    assign led = ~ cnt [31:20];

    // Exercise 2: Key-controlled counter.
    // Comment out the code above.
    // Uncomment and synthesize the code below.
    // Press the key to see the counter incrementing.
    //
    // Change the design, for example:
    //
    // 1. One key is used to increment, another to decrement.
    //
    // 2. Two counters controlled by different keys
    // displayed in different groups of LEDs.

    /*

    reg key_r;
    
    always @ (posedge clk or posedge reset)
      if (reset)
        key_r <= 1'b0;
      else
        key_r <= key [0];
        
    wire key_pressed = ~ key [0] & key_r;

    reg [11:0] cnt;

    always @ (posedge clk or posedge reset)
      if (reset)
        cnt <= 12'b0;
      else if (key_pressed)
        cnt <= cnt + 12'b1;
        
    assign led = ~ cnt;
    
    */

endmodule
