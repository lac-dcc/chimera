// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module myWhenAbsNew(
  input        clock,
  input        reset,
  input  [7:0] io_x,
  output [7:0] io_absX
);
  wire [7:0] _io_absX_T_3 = 8'sh0 - $signed(io_x); // @[myWhenAbsNew.scala 9:36]
  assign io_absX = $signed(io_x) > 8'sh0 ? $signed(io_x) : $signed(_io_absX_T_3); // @[myWhenAbsNew.scala 9:17]
endmodule
