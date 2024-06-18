// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mux_16(o,i1,i2,s);           //2x1 MUX with 16-bit I/O
input [15:0]i1,i2;
input s;
output [15:0]o;
mux mux_1[15:0](o,i1,i2,s);
endmodule
