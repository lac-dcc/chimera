// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module SIGNED_MUL(
  input         clock,
  input         reset,
  input  [7:0]  io_inputA,
  input  [7:0]  io_inputB,
  output [15:0] io_output
);
  assign io_output = $signed(io_inputA) * $signed(io_inputB); // @[SIGNED_MUL.scala 12:26]
endmodule
