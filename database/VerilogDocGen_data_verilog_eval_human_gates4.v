// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module gates4 (
  input [3:0] in,
  output out_and,
  output out_or,
  output out_xor

);

  assign out_and = &in;
  assign out_or = |in;
  assign out_xor = ^in;

endmodule



