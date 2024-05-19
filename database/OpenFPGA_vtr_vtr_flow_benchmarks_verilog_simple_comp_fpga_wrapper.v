// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module simple_comp
(
    a_in, b_in, c_in,
    d_out,
    clock, rst, rdy
);

    input [15:0] a_in;
    input [15:0] b_in;
    input [15:0] c_in;

    input clock;
    input rst;

    output [15:0] d_out;

    output reg rdy;
