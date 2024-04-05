`include "fadder_1bit.v"
module fadder_4bit(
    output [3:0] sum,
    output cout,
    input [3:0]  a,
    input [3:0]  b,
    input cin
);

    wire [2:0] tmpCout;

    fadder_1bit f1( .cout(tmpCout[0]), .sum(sum[0]), .a(a[0]), .b(b[0]), .cin(cin) );
    fadder_1bit f2( .cout(tmpCout[1]), .sum(sum[1]), .a(a[1]), .b(b[1]), .cin(tmpCout[0]) );
    fadder_1bit f3( .cout(tmpCout[2]), .sum(sum[2]), .a(a[2]), .b(b[2]), .cin(tmpCout[1]) );
    fadder_1bit f4( .cout(cout), .sum(sum[3]), .a(a[3]), .b(b[3]), .cin(tmpCout[2]) );

endmodule