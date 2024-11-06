// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module myWhenAbs(
  input        clock,
  input        reset,
  input  [7:0] io_x,
  output [7:0] io_absX
);
  wire [7:0] _io_absX_T_2 = 8'sh0 - $signed(io_x); // @[myWhenAbs.scala 11:16]
  assign io_absX = $signed(io_x) < 8'sh0 ? $signed(_io_absX_T_2) : $signed(io_x); // @[myWhenAbs.scala 10:21 11:13 9:11]
endmodule
