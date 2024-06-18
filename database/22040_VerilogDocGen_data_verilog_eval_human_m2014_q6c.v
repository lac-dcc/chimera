// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module m2014_q6c (
  input [6:1] y,
  input w,
  output Y2,
  output Y4

);
  assign Y2 = y[1]&~w;
  assign Y4 = (y[2]|y[3]|y[5]|y[6]) & w;

endmodule



