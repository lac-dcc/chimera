// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module divider(
    input[7:0] a,
    input[7:0] b,
    output[7:0] out
    );

    // Implementing simple division, quotient only
    // For division by zero, output is zero
    assign out = (b != 0) ? a / b : 8'b0;

endmodule
