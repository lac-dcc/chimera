// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result
);
    
    wire [31:0]invert;
    wire [15:0]sum1,sum2;
    wire cout,cout1;
    assign invert[31:0] = b[31:0]^{32{sub}};
    add16 ins1(a[15:0], invert[15:0], sub, sum1, cout);
    add16 ins2(a[31:16], invert[31:16], cout, sum2, cout1);
    assign result = {sum2,sum1};
endmodule

