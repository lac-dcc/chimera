// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`define FA_LOGIC

module full_adder
(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

`ifdef FA_LOGIC
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | cin & (a ^ b);
`elsif FA_SUM
    assign {cout, sum} = a + b + cin;
`endif

endmodule
