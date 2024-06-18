// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

// Parameterized Adder Module with an additional shift parameter
module Adder #(
    parameter WIDTH = 8,  // Default bit width is 8 bits
    parameter SHIFT = 0   // Default shift amount is 0 bits
)(a,b,sum);
    input [WIDTH-1:0] a;
    input [WIDTH-1:0] b;     // Two inputs
    output [WIDTH-1+SHIFT:0] sum; // Output sum with shift

// Compute the sum of the inputs and apply shift
assign sum = (a + b) << SHIFT;

endmodule

// Top Level Module
module TopModule(a1, b1, a2, b2, sum1, sum2);
    input [7:0] a1, b1;         // Inputs for the first adder
    input [15:0] a2, b2;         // Inputs for the second adder
    output [7:0] sum1;           // Output for the first adder (no shift applied, acts as before)
    output [15+1:0] sum2;         // Output for the second adder with an extra bit to accommodate for shift

// Instantiate the first adder with a width of 8 bits and no shift
Adder #(
    .WIDTH(8),
    .SHIFT(0)
) adder1 (
    .a(a1),
    .b(b1),
    .sum(sum1)
);

// Instantiate the second adder with a width of 16 bits and a shift of 1 bit
Adder #(
    .WIDTH(16),
    .SHIFT(1)
) adder2 (
    .a(a2),
    .b(b2),
    .sum(sum2)
);

endmodule