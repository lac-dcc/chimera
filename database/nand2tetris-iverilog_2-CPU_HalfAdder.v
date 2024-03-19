/**
 * Computes the sum of two bits.
 */
`default_nettype none
module HalfAdder(
    input wire a,       //1-bit input
    input wire b,       //1-bit inpur
    output wire sum,    //Right bit of a + b
    output wire carry   //Lef bit of a + b
);

// your implementation comes here:

Xor Xor_1(a, b, sum);
And And_1(a, b, carry);

endmodule
