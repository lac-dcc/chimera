// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module top
(
    input  [ 3:0] key,
    output [11:0] led,
    output        buzzer
);

    wire a = ~ key [0];
    wire b = ~ key [1];
    
    wire result = a ^ b;

    assign led [0] = ~ result;
    
    assign led [1] = ~ (~ key [0] ^ ~ key [1]);

    // Exercise 1: Change the code below.
    // Write the same for AND and OR operations
    
    assign led [11:2] = 10'h3ff;

    // Exercise 2: Change the code below.
    // Turn on and off buzzer on the board using key.
    // Listen to the click sound.

    assign buzzer = 1'b1;

endmodule
