// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module clock(
    input  hlt,
    input  clk_in,
    output clk_out
    );

    assign clk_out = (hlt) ? 1'b0 : clk_in;

endmodule

