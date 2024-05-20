// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module FloatingPointMultiplier(
  input         clock,
  input         reset,
  input  [15:0] io_input1,
  input  [15:0] io_input2,
  output [15:0] io_output
);
  wire  input1Sign = io_input1[15]; // @[FloatingPointMultiplier.scala 12:29]
  wire [7:0] input1Exponent = io_input1[14:7]; // @[FloatingPointMultiplier.scala 13:33]
  wire [7:0] input1Mantissa = {1'h1,io_input1[6:0]}; // @[Cat.scala 33:92]
  wire  input2Sign = io_input2[15]; // @[FloatingPointMultiplier.scala 17:29]
  wire [7:0] input2Exponent = io_input2[14:7]; // @[FloatingPointMultiplier.scala 18:33]
  wire [7:0] input2Mantissa = {1'h1,io_input2[6:0]}; // @[Cat.scala 33:92]
  wire [15:0] _multipliedMantissa_T = input1Mantissa * input2Mantissa; // @[FloatingPointMultiplier.scala 27:41]
  wire  outputSign = input1Sign ^ input2Sign; // @[FloatingPointMultiplier.scala 30:31]
  wire [13:0] multipliedMantissa = _multipliedMantissa_T[13:0]; // @[FloatingPointMultiplier.scala 26:32 27:22]
  wire [7:0] _multipliedExponent_T_1 = input1Exponent + input2Exponent; // @[FloatingPointMultiplier.scala 42:44]
  wire [7:0] _multipliedExponent_T_3 = _multipliedExponent_T_1 + 8'h1; // @[FloatingPointMultiplier.scala 42:61]
  wire [7:0] _GEN_0 = multipliedMantissa[13] ? _multipliedExponent_T_3 : _multipliedExponent_T_1; // @[FloatingPointMultiplier.scala 41:3 42:26 46:26]
  wire [8:0] multipliedExponent = {{1'd0}, _GEN_0}; // @[FloatingPointMultiplier.scala 32:32]
  wire [7:0] outputExponent = multipliedExponent[7:0]; // @[FloatingPointMultiplier.scala 36:42]
  wire [7:0] _GEN_1 = multipliedMantissa[13] ? multipliedMantissa[8:1] : multipliedMantissa[7:0]; // @[FloatingPointMultiplier.scala 41:3 43:22 47:22]
  wire [8:0] io_output_hi = {outputSign,outputExponent}; // @[Cat.scala 33:92]
  wire [6:0] outputMantissa = _GEN_1[6:0]; // @[FloatingPointMultiplier.scala 37:28]
  assign io_output = {io_output_hi,outputMantissa}; // @[Cat.scala 33:92]
endmodule
