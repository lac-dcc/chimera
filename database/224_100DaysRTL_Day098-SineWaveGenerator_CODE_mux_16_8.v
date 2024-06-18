// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mux_16_8(o,i1,i2,i3,i4,i5,i6,i7,i8,s);  //8x1 MUX with 16-bit I/O
input [15:0]i1,i2,i3,i4,i5,i6,i7,i8;
input [2:0]s;
output [15:0]o;
wire [15:0]x1,x2,x3,x4;
wire [15:0]y1,y2;

mux_16 mux_16_1(x1,i1,i2,s[0]);
mux_16 mux_16_2(x2,i3,i4,s[0]);
mux_16 mux_16_3(x3,i5,i6,s[0]);
mux_16 mux_16_4(x4,i7,i8,s[0]);

mux_16 mux_16_5(y1,x1,x2,s[1]);
mux_16 mux_16_6(y2,x3,x4,s[1]);

mux_16 mux_16_7(o,y1,y2,s[2]);

endmodule
