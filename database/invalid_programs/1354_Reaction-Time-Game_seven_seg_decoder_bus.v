// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`include "seven_seg_decoder_enable.v"

module seven_seg_decoder_bus(X, Result, En);
  input [3:0] X;
  input En;
  output [6:0] Result;

  seven_seg_decoder_enable ssd (.X3(X[3]), .X2(X[2]), .X1(X[1]), .X0(X[0]), .A(Result[0]), .B(Result[1]), .C(Result[2]), .D(Result[3]), .E(Result[4]), .F(Result[5]), .G(Result[6]), .EN(En));

endmodule
