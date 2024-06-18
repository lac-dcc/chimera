// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module wire_decl (
  input a,
  input b,
  input c,
  input d,
  output out,
  output out_n
);

  wire w1, w2;
  assign w1 = a&b;
  assign w2 = c&d;
  assign out = w1|w2;
  assign out_n = ~out;

endmodule



