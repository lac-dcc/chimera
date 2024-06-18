// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module MyMux(
  input   clock,
  input   reset,
  input   io_s,
  input   io_in0,
  input   io_in1,
  output  io_out
);
  assign io_out = io_s ? io_in1 : io_in0; // @[myMux.scala 14:16]
endmodule
