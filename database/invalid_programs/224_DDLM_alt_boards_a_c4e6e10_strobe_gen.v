// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`include "config.vh"

module strobe_gen
# (
    parameter w = 24
)
(
    input  clk,
    input  rst_n,
    output strobe
);

    wire [w - 1:0] count; 

    counter # (w) i_counter (clk, rst_n, 1'b1, count);
    assign strobe = (count == { w { 1'b0 } } );

endmodule
