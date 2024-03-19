`ifndef ADDSUB_4BIT
`define ADDSUB_4BIT
    `include "fadder_1bit.v"
    module addSub_4bit(
        output [3:0] sum,
        output cout,
        input [3:0] a,
        input [3:0] b,
        input cin,
        input sel
    );

        wire [2:0] tmpCout;
        wire [3:0] xorbs;
        
        assign xorbs[0] = b[0] ^ sel;
        assign xorbs[1] = b[1] ^ sel;
        assign xorbs[2] = b[2] ^ sel;
        assign xorbs[3] = b[3] ^ sel;

        fadder_1bit f1( .cout(tmpCout[0]), .sum(sum[0]), .a(a[0]), .b(xorbs[0]), .cin(cin) );
        fadder_1bit f2( .cout(tmpCout[1]), .sum(sum[1]), .a(a[1]), .b(xorbs[1]), .cin(tmpCout[0]) );
        fadder_1bit f3( .cout(tmpCout[2]), .sum(sum[2]), .a(a[2]), .b(xorbs[2]), .cin(tmpCout[1]) );
        fadder_1bit f4( .cout(cout), .sum(sum[3]), .a(a[3]), .b(xorbs[3]), .cin(tmpCout[2]) );

    endmodule
`endif