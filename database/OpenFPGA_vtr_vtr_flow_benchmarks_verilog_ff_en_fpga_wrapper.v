// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module ff_en
(
    d_in, d_out, clock, rst, d_en, rdy
);
    input clock;
    input rst;
    input d_en;
    
    input [9:0] d_in;
    output [9:0] d_out;

    output reg rdy;
