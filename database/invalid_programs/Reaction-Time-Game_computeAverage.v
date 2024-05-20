// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef computeAverage
  `define computeAverage

  `include "full_adder_15bit.v"
module computeAverage(X1, X2, X3, X4, S);
  input [12:0] X1;
  input [12:0] X2;
  input [12:0] X3;
  input [12:0] X4;
  output [12:0] S;

  wire [14:0] sum1;
  wire [14:0] sum2;
  wire [14:0] sums;

  full_adder_15bit fa151 (.X(X1), .Y(X2), .Cin(1'b0), .Sout(sum1), .Cout(sum1[13]), .Overflow(_ignoreOVFCA));
  full_adder_15bit fa152 (.X(X3), .Y(X4), .Cin(1'b0), .Sout(sum2), .Cout(sum2[13]), .Overflow(_ignoreOVFCA1));
  full_adder_15bit fa153 (.X(sum1), .Y(sum2), .Cin(1'b0), .Sout(sums), .Cout(sums), .Overflow(_ignoreOVFCA2));	

  assign S = sums >> 2;

endmodule

`endif
