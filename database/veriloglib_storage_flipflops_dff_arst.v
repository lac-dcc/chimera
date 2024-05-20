// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// Asynchronous reset D flip-flop
module dff_arst
(
    input clk, rst_n,
    input d,
    output reg q
);

always @(posedge clk, negedge rst_n)
    if(!rst_n)
        q <= 0;
    else
        q <= d;

endmodule