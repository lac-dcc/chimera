// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module ManAddClass(
  input         clock,
  input         reset,
  input  [22:0] io_manA,
  input  [22:0] io_manB,
  input  [7:0]  io_exp,
  output [22:0] io_manOut,
  output [7:0]  io_expOut
);
  wire [23:0] operandA = {1'h1,io_manA}; // @[Cat.scala 33:92]
  wire [23:0] operandB = {1'h1,io_manB}; // @[Cat.scala 33:92]
  wire [23:0] operandOut = operandA + operandB; // @[ManAddClass.scala 23:26]
  wire [23:0] _io_manOut_T = {{1'd0}, operandOut[23:1]}; // @[ManAddClass.scala 27:30]
  wire [7:0] _io_expOut_T_1 = io_exp + 8'h1; // @[ManAddClass.scala 28:25]
  assign io_manOut = operandOut[23] ? _io_manOut_T[22:0] : _io_manOut_T[22:0]; // @[ManAddClass.scala 26:5 27:15 32:17]
  assign io_expOut = operandOut[23] ? _io_expOut_T_1 : io_exp; // @[ManAddClass.scala 21:13 26:5 28:15]
endmodule
