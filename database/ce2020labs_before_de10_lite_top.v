// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module top
(
    input  [1:0] key,
    output [9:0] led
);

    wire a = ~ key [0];
    wire b = ~ key [1];
    
    assign led [0] = a ^ b;
    assign led [1] = ~ key [0] ^ ~ key [1];

    // Exercise: Change the code below.
    // Write the same for led [2] - logic operation AND 
    // Write the same for led [3] - logic operation OR
    
    assign led [2] = 1'b0;
    assign led [3] = 1'b1;

endmodule
