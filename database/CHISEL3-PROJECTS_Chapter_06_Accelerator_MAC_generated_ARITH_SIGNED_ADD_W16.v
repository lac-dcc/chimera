// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module SIGNED_ADD_W16(
  input         clock,
  input         reset,
  input  [15:0] io_inputA,
  input  [15:0] io_inputB,
  output [16:0] io_output
);
  assign io_output = $signed(io_inputA) + $signed(io_inputB); // @[SIGNED_ADD_W16.scala 12:26]
endmodule
