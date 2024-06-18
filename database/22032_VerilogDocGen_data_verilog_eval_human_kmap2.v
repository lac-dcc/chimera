// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module kmap2 (
  input a,
  input b,
  input c,
  input d,
  output out

);

  assign out = (~c & ~b) | (~d&~a) | (a&c&d) | (b&c&d);

endmodule



