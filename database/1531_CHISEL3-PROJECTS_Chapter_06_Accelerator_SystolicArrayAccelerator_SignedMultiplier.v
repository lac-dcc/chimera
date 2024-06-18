// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module SignedMultiplier(
  input         clock,
  input         reset,
  input  [7:0]  io_a,
  input  [7:0]  io_b,
  output [15:0] io_product
);
  assign io_product = $signed(io_a) * $signed(io_b); // @[SignedMultipler.scala 10:22]
endmodule
