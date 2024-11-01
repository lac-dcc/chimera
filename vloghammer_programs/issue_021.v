module issue_021(a, y);
  input [31:0] a;
  output [5:0] y;

  // icarus verilog (git d1c9dd5) takes forever to compile this expression because they do not
  // use an efficient Power-Modulus Algorithm to perform the calculation. (actually there are
  // two bugs: one in the compiler (ivl) and one in the simulator (vvp). But the simulator bug can't
  // be tested here because powers to something else than base 2 is not synthesizable.
  // see https://github.com/steveicarus/iverilog/issues/9
  assign y = 6'd3 ** 123456789;
endmodule
