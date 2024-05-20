// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// Synchronous reset D flip-flop
module dff_srst
(
    input clk, rst_n,
    input d,
    output reg q
);

always @(posedge clk)
    if(!rst_n)
        q <= 0;
    else
        q <= d;

endmodule