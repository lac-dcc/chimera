// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module top
(
    input btnc,
    input btnu,
    input btnl,
    input btnr,
    input btnd,

    output [15:0] led
);

    assign led [0] = btnl ^ btnr;

    // Exercise: Change the code below.
    // Write the same for led [1] - logic operation AND 
    // Write the same for led [2] - logic operation OR

    assign led [1] = 1'b0;
    assign led [2] = 1'b1;

endmodule
