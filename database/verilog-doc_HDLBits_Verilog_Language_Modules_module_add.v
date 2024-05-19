// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1, sum2;
    wire cin, cout, cout1;
    add16 ins1(a[15:0], b[15:0], 0, sum1, cout);
    add16 ins2(a[31:16], b[31:16], cout, sum2, cout1);
    assign sum = {sum2,sum1};
endmodule

