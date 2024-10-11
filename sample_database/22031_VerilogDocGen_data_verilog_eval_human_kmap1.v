// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module kmap1(
  input a,
  input b,
  input c,
  output out

);

  assign out = (a | b | c);

endmodule



