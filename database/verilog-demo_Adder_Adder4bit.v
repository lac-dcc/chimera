// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module Adder4bit (
    input [3:0] A, B,
    input Ci, // 进位输入
    output [3:0] Sum,
    output Co // 进位输出
);

wire [3:0] Co_intermediate; // 中间阶段的进位

// Full Adder for bit 0
FullAdder FA0 (
    .A(A[0]),
    .B(B[0]),
    .Ci(Ci),
    .Sum(Sum[0]),
    .Co(Co_intermediate[0])
);

// Full Adder for bit 1
FullAdder FA1 (
    .A(A[1]),
    .B(B[1]),
    .Ci(Co_intermediate[0]),
    .Sum(Sum[1]),
    .Co(Co_intermediate[1])
);

// Full Adder for bit 2
FullAdder FA2 (
    .A(A[2]),
    .B(B[2]),
    .Ci(Co_intermediate[1]),
    .Sum(Sum[2]),
    .Co(Co_intermediate[2])
);

// Full Adder for bit 3
FullAdder FA3 (
    .A(A[3]),
    .B(B[3]),
    .Ci(Co_intermediate[2]),
    .Sum(Sum[3]),
    .Co(Co_intermediate[3]) // 最终的进位输出
);

assign Co = Co_intermediate[3];
endmodule
