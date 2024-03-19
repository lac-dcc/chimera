/**
 * 16-bit Not:
 * for i=0..15: out[i] = not in[i]
 */
`default_nettype none

module Not16(
    input  wire [15:0] in,
    output wire [15:0] out
);

// your implementation comes here:

Not Not0(in[0], out[0]);
Not Not1(in[1], out[1]);
Not Not2(in[2], out[2]);
Not Not3(in[3], out[3]);
Not Not4(in[4], out[4]);
Not Not5(in[5], out[5]);
Not Not6(in[6], out[6]);
Not Not7(in[7], out[7]);
Not Not8(in[8], out[8]);
Not Not9(in[9], out[9]);
Not Not10(in[10], out[10]);
Not Not11(in[11], out[11]);
Not Not12(in[12], out[12]);
Not Not13(in[13], out[13]);
Not Not14(in[14], out[14]);
Not Not15(in[15], out[15]);

endmodule
