// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module dlatch
(
    input d,
    input en,
    output reg q,
    output  q_n
);

always @*
    if(en)
        q = d;

assign q_n = ~q;

endmodule
