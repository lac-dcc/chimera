// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

module Equals15bit(X, Y, R);
  input [15:0] X;
  input [15:0] Y;
  output R;

  assign R1 = ~(X[0] ^ Y[0]);
  assign R2 = ~(X[1] ^ Y[1]);
  assign R3 = ~(X[2] ^ Y[2]);
  assign R4 = ~(X[3] ^ Y[3]);
  assign R5 = ~(X[4] ^ Y[4]);
  assign R6 = ~(X[5] ^ Y[5]);
  assign R7 = ~(X[6] ^ Y[6]);
  assign R8 = ~(X[7] ^ Y[7]);
  assign R9 = ~(X[8] ^ Y[8]);
  assign R10 = ~(X[9] ^ Y[9]);
  assign R11 = ~(X[10] ^ Y[10]);
  assign R12 = ~(X[11] ^ Y[11]);
  assign R13 = ~(X[12] ^ Y[12]);
  assign R14 = ~(X[13] ^ Y[13]);
  assign R15 = ~(X[14] ^ Y[14]);
  assign R16 = ~(X[15] ^ Y[15]);

  assign R = R1 & R2 & R3 & R4 & R5 & R6 & R7 & R8 & R9 & R10 & R11 & R12 & R13 & R14 & R15 & R16;

endmodule
