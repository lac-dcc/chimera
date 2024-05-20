// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module HardwareModuleWithFunctions(
  input        clock,
  input        reset,
  input  [3:0] io_inputA, // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]
  input  [3:0] io_inputB, // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]
  output [4:0] io_output, // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]
  input        io_condition // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]
);
  wire [3:0] sum = io_inputA + io_inputB; // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 14:7]
  wire [5:0] shiftedResult = {sum, 2'h0}; // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 19:11]
  wire [5:0] selectedResult = io_condition ? {{2'd0}, sum} : shiftedResult; // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 24:8]
  wire [7:0] finalResult = selectedResult * 2'h3; // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 29:21]
  assign io_output = finalResult[4:0]; // @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 41:13]
endmodule
