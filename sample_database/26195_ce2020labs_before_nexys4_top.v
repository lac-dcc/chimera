// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module top
(
    input         btnc,
    input         btnu,
    input         btnl,
    input         btnr,
    input         btnd,

    output [15:0] led,

    output        led16_r,
    output        led16_g,
    output        led16_b,

    output        led17_r,
    output        led17_g,
    output        led17_b
);

    assign led [0] = btnl ^ btnr;

    // Exercise 1: Change the code below.
    // Write the same for led [1] - logic operation AND 
    // Write the same for led [2] - logic operation OR

    assign led [1] = 1'b0;
    assign led [2] = 1'b1;

    // Exercise 2: RGB leds allow to make different colors.
    // Explore them.

    assign led16_r = 1'b0;
    assign led16_g = 1'b0;
    assign led16_b = 1'b0;

    assign led17_r = 1'b0;
    assign led17_g = 1'b0;
    assign led17_b = 1'b0;

endmodule
