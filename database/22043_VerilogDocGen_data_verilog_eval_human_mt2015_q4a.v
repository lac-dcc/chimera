// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module mt2015_q4a(
  input x,
  input y,
  output z
);

  assign z = (x^y) & x;

endmodule



