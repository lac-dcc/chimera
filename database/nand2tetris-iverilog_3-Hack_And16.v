/**
 * 16-bit bitwise And:
 * for i = 0..15: out[i] = (a[i] and b[i])
 */

`default_nettype none
module And16(
	input wire [15:0] a,
	input wire [15:0] b,
	output wire [15:0] out
);

// your implementation comes here:

And And_0(a[0], b[0], out[0]);
And And_1(a[1], b[1], out[1]);
And And_2(a[2], b[2], out[2]);
And And_3(a[3], b[3], out[3]);
And And_4(a[4], b[4], out[4]);
And And_5(a[5], b[5], out[5]);
And And_6(a[6], b[6], out[6]);
And And_7(a[7], b[7], out[7]);
And And_8(a[8], b[8], out[8]);
And And_9(a[9], b[9], out[9]);
And And_10(a[10], b[10], out[10]);
And And_11(a[11], b[11], out[11]);
And And_12(a[12], b[12], out[12]);
And And_13(a[13], b[13], out[13]);
And And_14(a[14], b[14], out[14]);
And And_15(a[15], b[15], out[15]);

endmodule
