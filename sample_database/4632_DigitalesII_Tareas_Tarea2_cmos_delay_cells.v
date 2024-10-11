// This program was cloned from: https://github.com/menesesj6/DigitalesII
// License: MIT License

module BUF(A, Y);
  input A;
  output Y;
  assign #1 Y = A;
endmodule

module NOT(A, Y);
  input A;
  output Y;
  assign #1 Y = ~A;
endmodule

module NAND(A, B, Y);
  input A, B;
  output Y;
  assign #1 Y = ~(A & B);
endmodule

module NOR(A, B, Y);
  input A, B;
  output Y;
  assign #1 Y = ~(A | B);
endmodule

module DFF(C, D, Q);
  input C, D; 
  output reg Q;
  always @(posedge C) #1 Q <= D;
endmodule