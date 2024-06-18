// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module MyMuxWhen(
  input        clock,
  input        reset,
  input        io_s,
  input  [7:0] io_in0,
  input  [7:0] io_in1,
  output [7:0] io_out
);
  assign io_out = io_s ? io_in1 : io_in0; // @[myMuxWhen.scala 13:15 14:12 16:12]
endmodule
