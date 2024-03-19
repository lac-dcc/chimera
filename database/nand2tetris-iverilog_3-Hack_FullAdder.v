/**
 * Computes the sum of three bits.
 */
`default_nettype none

module FullAdder(
    input wire a,       //1-bit input
    input wire b,       //1-bit input
    input wire c,       //1-bit input
    output wire sum,    //Right bit of a + b + c
    output wire carry   //Left bit of a + b + c
);

// your implementation comes here:

wire sums, carrys, carryss, throw;

HalfAdder HalfAdder_0(a, b, sums, carrys);
HalfAdder HalfAdde1(sums, c, sum, carryss);
HalfAdder HalfAdde2(carrys, carryss, carry, throw);

endmodule
