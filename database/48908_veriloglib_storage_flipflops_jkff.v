// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// Jack Kilby flip flop
// Behaves like an SR FF except for the S=1 R=1 case
// which yields Q=~Q instead of Q=X
module jkff
(
    input clk, rst_n,
    input j, k,
    output reg q,
    output q_
);

always @(posedge clk)
    if(!rst_n)
        q <= 0;
    else
        case({j, k})
            2'b00: q <= q;
            2'b01: q <= 1'b0;
            2'b10: q <= 1'b1;
            2'b11: q <= 1'bx;
            default: q <= ~q;
        endcase

assign q_ = ~q;

endmodule