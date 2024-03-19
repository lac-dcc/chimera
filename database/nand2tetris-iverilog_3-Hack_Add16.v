/**
 * Adds two 16-bit values.
 * The most significant carry bit is ignored.
 * out = a + b (16 bit)
 */

`default_nettype none
module Add16(
	input wire [15:0] a,
	input wire [15:0] b,
	output wire [15:0] out
);

// your implementation comes here:

wire carry0, carry1, carry2, carry3, carry4, carry5, carry6, carry7, carry8, carry9, carry10, carry11, carry12, carry13, carry14, carry15;

HalfAdder HalfAdder_0(a[0], b[0], out[0], carry0);
FullAdder FullAdder_1(a[1], b[1], carry0, out[1], carry1);
FullAdder FullAdder_2(a[2], b[2], carry1, out[2], carry2);
FullAdder FullAdder_3(a[3], b[3], carry2, out[3], carry3);
FullAdder FullAdder_4(a[4], b[4], carry3, out[4], carry4);
FullAdder FullAdder_5(a[5], b[5], carry4, out[5], carry5);
FullAdder FullAdder_6(a[6], b[6], carry5, out[6], carry6);
FullAdder FullAdder_7(a[7], b[7], carry6, out[7], carry7);
FullAdder FullAdder_8(a[8], b[8], carry7, out[8], carry8);
FullAdder FullAdder_9(a[9], b[9], carry8, out[9], carry9);
FullAdder FullAdder_10(a[10], b[10], carry9, out[10], carry10);
FullAdder FullAdder_11(a[11], b[11], carry10, out[11], carry11);
FullAdder FullAdder_12(a[12], b[12], carry11, out[12], carry12);
FullAdder FullAdder_13(a[13], b[13], carry12, out[13], carry13);
FullAdder FullAdder_14(a[14], b[14], carry13, out[14], carry14);
FullAdder FullAdder_15(a[15], b[15], carry14, out[15], carry15);

endmodule
