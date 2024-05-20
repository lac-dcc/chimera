// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module adder(
    input[7:0]  a,
    input[7:0]  b,
    input       sub,
    output[7:0] out
    );

    assign out = (sub) ? a-b : a+b;

endmodule
