// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module compare_unit (
  input z,
  input n,
  input v,
  input [1:0] alu_fn,
  output b_o
);

mux_4 mux (
  .a(),
  .b(z),
  .c(n^v),
  .d(z|(n^v)),
  .s0(alu_fn[0]),
  .s1(alu_fn[1]),
  .out(b_o)
);

endmodule
