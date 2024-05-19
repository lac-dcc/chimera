// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module multi_consumer
(
    d_in,
    d_out_1, d_out_2, d_out_4, d_out_7,
    clock, rst, rdy
);

    input clock;
    input rst;

    input [15:0] d_in;

    output [15:0] d_out_1, d_out_2, d_out_4, d_out_7;

    output reg rdy;
