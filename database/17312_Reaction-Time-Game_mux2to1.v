// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

module mux2to1(W0, W1, S, F);
  input W0, W1, S;
  output F;

  assign F = S ? W1 : W0;

endmodule
