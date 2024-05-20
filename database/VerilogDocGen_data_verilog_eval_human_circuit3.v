// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module circuit3 (
  input a,
  input b,
  input c,
  input d,
  output q

);

  assign q = (a|b) & (c|d);

endmodule



