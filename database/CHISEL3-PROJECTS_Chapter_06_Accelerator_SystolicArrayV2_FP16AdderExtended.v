// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module FP16AdderExtended(
  input         clock,
  input         reset,
  input  [15:0] io_a,
  input  [15:0] io_b,
  output [15:0] io_result
);
  wire  signA = io_a[15]; // @[FloatingPointAdd.scala 13:18]
  wire [4:0] expA = io_a[14:10]; // @[FloatingPointAdd.scala 14:22]
  wire [9:0] sigA = io_a[9:0]; // @[FloatingPointAdd.scala 15:25]
  wire  signB = io_b[15]; // @[FloatingPointAdd.scala 13:18]
  wire [4:0] expB = io_b[14:10]; // @[FloatingPointAdd.scala 14:22]
  wire [9:0] sigB = io_b[9:0]; // @[FloatingPointAdd.scala 15:25]
  wire  _zeroFlagA_T_1 = sigA == 10'h0; // @[FloatingPointAdd.scala 23:40]
  wire  zeroFlagA = expA == 5'h0 & sigA == 10'h0; // @[FloatingPointAdd.scala 23:32]
  wire  _zeroFlagB_T_1 = sigB == 10'h0; // @[FloatingPointAdd.scala 24:40]
  wire  zeroFlagB = expB == 5'h0 & sigB == 10'h0; // @[FloatingPointAdd.scala 24:32]
  wire  infFlagA = expA == 5'h1f & _zeroFlagA_T_1; // @[FloatingPointAdd.scala 25:38]
  wire  infFlagB = expB == 5'h1f & _zeroFlagB_T_1; // @[FloatingPointAdd.scala 26:38]
  wire [15:0] _io_result_T = infFlagA ? io_a : io_b; // @[FloatingPointAdd.scala 46:23]
  wire [15:0] _GEN_0 = infFlagA & infFlagB & signA != signB ? 16'hffff : _io_result_T; // @[FloatingPointAdd.scala 40:53 42:17 46:17]
  wire [15:0] _GEN_1 = infFlagA | infFlagB ? _GEN_0 : 16'h0; // @[FloatingPointAdd.scala 38:36 54:15]
  wire [15:0] _GEN_2 = zeroFlagA & zeroFlagB ? io_a : _GEN_1; // @[FloatingPointAdd.scala 35:38 37:15]
  wire [15:0] _GEN_3 = ~zeroFlagA & zeroFlagB ? io_a : _GEN_2; // @[FloatingPointAdd.scala 32:39 34:15]
  assign io_result = zeroFlagA & ~zeroFlagB ? io_b : _GEN_3; // @[FloatingPointAdd.scala 29:33 31:15]
endmodule
