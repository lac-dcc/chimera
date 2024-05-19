// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

//product = in_c + in_a * in_b
module multip_adder#(
           parameter BITWIDTH = 8,
           parameter IS_BITWIDTH_DOUBLE_SCALE = 1
       )
       (
           input wire signed [BITWIDTH - 1: 0] in_a,
           input wire signed [BITWIDTH - 1: 0] in_b,
           input wire signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] in_c,
           output wire signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] product
       );
assign product = in_c + (in_a * in_b);
endmodule
