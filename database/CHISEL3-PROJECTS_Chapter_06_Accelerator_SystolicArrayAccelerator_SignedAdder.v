// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module SignedAdder(
  input        clock,
  input        reset,
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [7:0] io_sum,
  output       io_carryOut,
  output       io_overflow
);
  wire [7:0] sum = $signed(io_a) + $signed(io_b); // @[SignedAdder.scala 13:18]
  wire  carryOut = sum[7]; // @[SignedAdder.scala 14:21]
  assign io_sum = $signed(io_a) + $signed(io_b); // @[SignedAdder.scala 13:18]
  assign io_carryOut = sum[7]; // @[SignedAdder.scala 14:21]
  assign io_overflow = (io_a[7] ^ io_b[7]) & (io_a[7] ^ carryOut); // @[SignedAdder.scala 15:38]
endmodule
