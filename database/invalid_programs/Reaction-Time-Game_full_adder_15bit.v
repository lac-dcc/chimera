// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef full_adder_15bit
	`define full_adder_15bit

`include "FA.v" 

module full_adder_15bit(X, Y, Cin, Sout, Cout, Overflow);
  input [14:0] X;
  input [14:0] Y;
  input Cin;

  output Overflow;
  output [14:0] Sout;
  output Cout;

  FA adder1 (.X(X[0]), .Y(Y[0]), .Cin(Cin), .Cout(Cnext), .S(Sout[0]));
  FA adder2 (.X(X[1]), .Y(Y[1]), .Cin(Cnext), .Cout(Cnext1), .S(Sout[1]));
  FA adder3 (.X(X[2]), .Y(Y[2]), .Cin(Cnext1), .Cout(Cnext2), .S(Sout[2]));
  FA adder4 (.X(X[3]), .Y(Y[3]), .Cin(Cnext2), .Cout(Cnext3), .S(Sout[3]));
  FA adder5 (.X(X[4]), .Y(Y[4]), .Cin(Cnext3), .Cout(Cnext4), .S(Sout[4]));
  FA adder6 (.X(X[5]), .Y(Y[5]), .Cin(Cnext4), .Cout(Cnext5), .S(Sout[5]));
  FA adder7 (.X(X[6]), .Y(Y[6]), .Cin(Cnext5), .Cout(Cnext6), .S(Sout[6]));
  FA adder8 (.X(X[7]), .Y(Y[7]), .Cin(Cnext6), .Cout(Cnext7), .S(Sout[7]));
  FA adder9 (.X(X[8]), .Y(Y[8]), .Cin(Cnext7), .Cout(Cnext8), .S(Sout[8]));
  FA adder10 (.X(X[9]), .Y(Y[9]), .Cin(Cnext8), .Cout(Cnext9), .S(Sout[9]));
  FA adder11 (.X(X[10]), .Y(Y[10]), .Cin(Cnext9), .Cout(Cnext10), .S(Sout[10]));
  FA adder12 (.X(X[11]), .Y(Y[11]), .Cin(Cnext10), .Cout(Cnext11), .S(Sout[11]));
  FA adder13 (.X(X[12]), .Y(Y[12]), .Cin(Cnext11), .Cout(Cnext12), .S(Sout[12]));
  FA adder14 (.X(X[13]), .Y(Y[13]), .Cin(Cnext12), .Cout(Cnext13), .S(Sout[13]));
  FA adder15 (.X(X[14]), .Y(Y[14]), .Cin(Cnext13), .Cout(CnextOut), .S(Sout[14]));

  assign Overflow = Cnext13 ^ CnextOut;
  assign Cout = CnextOut;

  endmodule
  

`endif
