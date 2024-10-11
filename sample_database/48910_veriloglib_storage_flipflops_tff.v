// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// T flip flop
module tff
(
    input clk, rst_n,
    input t,
    output reg q,
    output q_
);

always @(posedge clk)
    if(!rst_n)
        q <= 0;
    else
        q <= (t? ~q:q);

assign q_ = ~q;

endmodule