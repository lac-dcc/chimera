// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module srlatch
(
    input s,
    input r,
    output reg q,
    output q_n
);

always @*
    case({s, r})
        2'b00 : q = q;
        2'b01 : q = 0;
        2'b10 : q = 1;
        2'b11 : q = 1'bX;
        default: q = 1'bX;
    endcase

assign q_n = ~q;

endmodule
