// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module FxP8_MUL(
  input        clock,
  input        reset,
  input  [7:0] io_inputA,
  input  [7:0] io_inputB,
  output [7:0] io_output
);
  wire [15:0] _io_output_T = $signed(io_inputA) * $signed(io_inputB); // @[FIXED8_MUL.scala 14:26]
  wire [9:0] _GEN_0 = _io_output_T[15:6]; // @[FIXED8_MUL.scala 14:13]
  assign io_output = _GEN_0[7:0]; // @[FIXED8_MUL.scala 14:13]
endmodule
