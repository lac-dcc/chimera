// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module FP16Multiplier(
  input         clock,
  input         reset,
  input  [15:0] io_a,
  input  [15:0] io_b,
  output [15:0] io_result
);
  wire  signA = io_a[15]; // @[FloatingPointMultiply.scala 13:18]
  wire [4:0] expA = io_a[14:10]; // @[FloatingPointMultiply.scala 14:22]
  wire [10:0] sigA = {1'h1,io_a[9:0]}; // @[Cat.scala 33:92]
  wire  signB = io_b[15]; // @[FloatingPointMultiply.scala 13:18]
  wire [4:0] expB = io_b[14:10]; // @[FloatingPointMultiply.scala 14:22]
  wire [10:0] sigB = {1'h1,io_b[9:0]}; // @[Cat.scala 33:92]
  wire  newSign = signA ^ signB; // @[FloatingPointMultiply.scala 23:23]
  wire  isZeroA = expA == 5'h0 & io_a[9:0] == 10'h0; // @[FloatingPointMultiply.scala 26:30]
  wire  isZeroB = expB == 5'h0 & io_b[9:0] == 10'h0; // @[FloatingPointMultiply.scala 27:30]
  wire  isInfA = expA == 5'h1f; // @[FloatingPointMultiply.scala 28:21]
  wire  isInfB = expB == 5'h1f; // @[FloatingPointMultiply.scala 29:21]
  wire [15:0] _io_result_T = {newSign,15'h0}; // @[Cat.scala 33:92]
  wire [15:0] _io_result_T_1 = {newSign,5'h1f,10'h0}; // @[Cat.scala 33:92]
  wire [5:0] _expResult_T = {1'b0,$signed(expA)}; // @[FloatingPointMultiply.scala 41:31]
  wire [5:0] _expResult_T_1 = {1'b0,$signed(expB)}; // @[FloatingPointMultiply.scala 41:45]
  wire [5:0] _expResult_T_4 = $signed(_expResult_T) + $signed(_expResult_T_1); // @[FloatingPointMultiply.scala 41:34]
  wire [4:0] _expResult_T_5 = {1'b0,$signed(4'hf)}; // @[FloatingPointMultiply.scala 41:65]
  wire [5:0] _GEN_4 = {{1{_expResult_T_5[4]}},_expResult_T_5}; // @[FloatingPointMultiply.scala 41:48]
  wire [5:0] expResult = $signed(_expResult_T_4) - $signed(_GEN_4); // @[FloatingPointMultiply.scala 41:75]
  wire [21:0] _sigResult_T = sigA * sigB; // @[FloatingPointMultiply.scala 42:27]
  wire [11:0] sigResult = _sigResult_T[21:10]; // @[FloatingPointMultiply.scala 42:34]
  wire [15:0] _io_result_T_5 = {newSign,expResult[4:0],sigResult[9:0]}; // @[Cat.scala 33:92]
  wire [15:0] _GEN_0 = expResult > 6'h1e ? _io_result_T_1 : _io_result_T_5; // @[FloatingPointMultiply.scala 48:40 50:17 53:17]
  wire [15:0] _GEN_1 = expResult[5] ? 16'h0 : _GEN_0; // @[FloatingPointMultiply.scala 45:24 47:17]
  wire [15:0] _GEN_2 = isInfA | isInfB ? _io_result_T_1 : _GEN_1; // @[FloatingPointMultiply.scala 36:32 38:15]
  assign io_result = isZeroA | isZeroB ? _io_result_T : _GEN_2; // @[FloatingPointMultiply.scala 33:28 35:15]
endmodule
