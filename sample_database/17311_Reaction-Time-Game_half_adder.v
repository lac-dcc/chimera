// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef half_adder
	`define half_adder

module half_adder(X, Y, Cin, Cout, S);
  input X, Y, Cin;
  output Cout, S;

  assign Cout = (X & Y) | (Y & Cin) | (X & Cin);
  assign S = Cin ^ X ^ Y;
endmodule
`endif