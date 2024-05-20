// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

module determineNextDivisionState(W, S1, S0, Check, N0, N1);
  input W;
  input S0;
  input S1;
  input Check;
  output N0;
  output N1;

  assign N0 = (~Check & S0 & ~S1) | (~S1 & ~S0 & I);
  assign N1 = ~S1 * S0 & C;

endmodule

