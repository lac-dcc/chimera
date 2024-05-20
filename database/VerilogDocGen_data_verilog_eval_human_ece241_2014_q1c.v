// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module ece241_2014_q1c (
  input [7:0] a,
  input [7:0] b,
  output [7:0] s,
  output overflow

);

  wire [8:0] sum = a+b;
  assign s = sum[7:0];
  assign overflow = !(a[7]^b[7]) && (a[7] != s[7]);

endmodule



