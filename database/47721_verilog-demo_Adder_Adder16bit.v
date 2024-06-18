// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module Adder16bit (
    input [15:0] A,
    input [15:0] B,
    input Ci,
    output [15:0] Sum,
    output Co
);

wire [3:0] Co_intermediate; // Array to hold carry out from each 4-bit adder stage

// Instantiate four 4-bit adders in series
Adder4bit stage0 (.A(A[3:0]), .B(B[3:0]), .Sum(Sum[3:0]), .Ci(Ci), .Co(Co_intermediate[0]));
Adder4bit stage1 (.A(A[7:4]), .B(B[7:4]), .Sum(Sum[7:4]), .Ci(Co_intermediate[0]), .Co(Co_intermediate[1]));
Adder4bit stage2 (.A(A[11:8]), .B(B[11:8]), .Sum(Sum[11:8]), .Ci(Co_intermediate[1]), .Co(Co_intermediate[2]));
Adder4bit stage3 (.A(A[15:12]), .B(B[15:12]), .Sum(Sum[15:12]), .Ci(Co_intermediate[2]), .Co(Co_intermediate[3]));

// Final carry out for the 16-bit adder
assign Co = Co_intermediate[3];

endmodule