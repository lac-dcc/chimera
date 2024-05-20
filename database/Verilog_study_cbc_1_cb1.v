// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module cb1(
  input d, x, a,
  output l
);

  assign l = (~d) & (~x) & a | (~d) & x & a | d & (~x) & (~a) | d & (~x) & a | d & x & a;

endmodule