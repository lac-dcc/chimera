// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module SIGNED_ADD(
  input        clock,
  input        reset,
  input  [7:0] io_inputA,
  input  [7:0] io_inputB,
  output [8:0] io_output
);
  assign io_output = $signed(io_inputA) + $signed(io_inputB); // @[SIGNED_ADD.scala 12:26]
endmodule
