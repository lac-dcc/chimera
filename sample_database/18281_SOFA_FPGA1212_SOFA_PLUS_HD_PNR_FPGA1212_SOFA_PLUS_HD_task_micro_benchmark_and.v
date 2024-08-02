// This program was cloned from: https://github.com/lnis-uofu/SOFA
// License: MIT License

`timescale 1ns / 1ps

module top(
  a,
  b,
  c);

input wire a;
input wire b;
output wire c;

assign c = a & b;

endmodule
