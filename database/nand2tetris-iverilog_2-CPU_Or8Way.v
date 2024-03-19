/**
 * 8-way Or: 
 * out = (in[0] or in[1] or ... or in[7])
 */
`default_nettype none

module Or8Way(
    input  wire [7:0] in,
    output wire out
);

// your implementation comes here:

wire out0, out1, out2, out3, out4, out5;

Or Or_0(in[0], in[1], out0);
Or Or_1(out0, in[2], out1);
Or Or_2(out1, in[3], out2);
Or Or_3(out2, in[4], out3);
Or Or_4(out3, in[5], out4);
Or Or_5(out4, in[6], out5);
Or Or_6(out5, in[7], out);

endmodule
