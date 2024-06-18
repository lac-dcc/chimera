// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module strobe_gen
# (
    parameter w = 24
)
(
    input  clk,
    input  reset,
    output strobe
);

    wire [w - 1:0] count; 

    counter # (w) i_counter (clk, reset, 1'b1, count);
    assign strobe = (count == { w { 1'b0 } } );

endmodule
