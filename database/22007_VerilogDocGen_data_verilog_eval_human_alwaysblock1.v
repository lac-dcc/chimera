// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module alwaysblock1(
  input a,
  input b,
  output out_assign,
  output reg out_alwaysblock

);

  assign out_assign = a & b;
  always @(*) out_alwaysblock = a & b;

endmodule



