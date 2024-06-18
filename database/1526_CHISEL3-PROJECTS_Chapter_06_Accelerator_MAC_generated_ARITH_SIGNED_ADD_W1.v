// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module SIGNED_ADD_W1(
  input        clock,
  input        reset,
  input  [7:0] io_inputA,
  input        io_inputB,
  output [8:0] io_output
);
  wire [7:0] _GEN_0 = {8{io_inputB}}; // @[SIGNED_ADD_W1.scala 12:26]
  assign io_output = $signed(io_inputA) + $signed(_GEN_0); // @[SIGNED_ADD_W1.scala 12:26]
endmodule
