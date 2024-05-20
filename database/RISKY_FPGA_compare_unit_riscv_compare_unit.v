// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module riscv_compare_unit (
  input z,
  input n,
  input v,
  input bit31,
  input [2:0] funct3,
  output b_o
);

mux_8 mux (
  .a(z),
  .b(~z),
  .c(n^v),
  .d(bit31),
  .e(n^v),
  .f(~(n^v)|z),
  .g(bit31),
  .h(~bit31),
  .s0(funct3[0]),
  .s1(funct3[1]),
  .s2(funct3[2]),
  .out(b_o)
);

endmodule
