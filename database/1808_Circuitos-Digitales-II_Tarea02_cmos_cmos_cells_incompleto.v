// This program was cloned from: https://github.com/jrpompio/Circuitos-Digitales-II
// License: MIT License

module BUF(A, Y);
  input A;
  output Y;
  assign Y = A;
endmodule

module NOT(A, Y);
  input A;
  output Y;
  assign Y = ~A;
endmodule

module NAND(A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A & B);
endmodule

module NOR(A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A | B);
endmodule
