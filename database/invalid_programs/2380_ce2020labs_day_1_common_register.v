// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module register
# (
    parameter w = 1
) 
(
    input                clk,
    input                reset,
    input                en,
    input      [w - 1:0] d,
    output reg [w - 1:0] q
);

    always @ (posedge clk or posedge reset)
        if (reset)
            q <= { w { 1'b0 } };
        else if (en)
            q <= d;

endmodule
