// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// Set Reset flip flop
module srff
(
    input clk, rst_n,
    input s, r,
    output reg q,
    output q_
);

always @(posedge clk)
    if(!rst_n)
        q <= 0;
    else
        case({s, r})
            2'b00: q <= q;
            2'b01: q <= 1'b0;
            2'b10: q <= 1'b1;
            2'b11: q <= 1'bx;
            default: q <= q;
        endcase

assign q_ = ~q;

endmodule