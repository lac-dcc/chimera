// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module Adder64bit (
    input [63:0] A,
    input [63:0] B,
    input Ci,
    output [63:0] Sum,
    output Co
);

wire [3:0] Co_intermediate; // Array to hold carry out from each 16-bit adder stage

// Instantiate four 16-bit adders in series
Adder16bit stage0 (.A(A[15:0]), .B(B[15:0]), .Sum(Sum[15:0]), .Ci(Ci), .Co(Co_intermediate[0]));
Adder16bit stage1 (.A(A[31:16]), .B(B[31:16]), .Sum(Sum[31:16]), .Ci(Co_intermediate[0]), .Co(Co_intermediate[1]));
Adder16bit stage2 (.A(A[47:32]), .B(B[47:32]), .Sum(Sum[47:32]), .Ci(Co_intermediate[1]), .Co(Co_intermediate[2]));
Adder16bit stage3 (.A(A[63:48]), .B(B[63:48]), .Sum(Sum[63:48]), .Ci(Co_intermediate[2]), .Co(Co_intermediate[3]));

// Final carry out for the 64-bit adder
assign Co = Co_intermediate[3];

endmodule