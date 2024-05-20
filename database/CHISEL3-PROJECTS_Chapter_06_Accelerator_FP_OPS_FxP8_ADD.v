// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module FxP8_ADD(
  input        clock,
  input        reset,
  input  [7:0] io_in1,
  input  [7:0] io_in2,
  output [7:0] io_out
);
  assign io_out = $signed(io_in1) + $signed(io_in2); // @[FIXED8_ADD.scala 14:20]
endmodule
