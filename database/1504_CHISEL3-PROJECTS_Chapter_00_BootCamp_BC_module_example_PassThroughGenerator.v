// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module PassThroughGenerator(
  input        clock,
  input        reset,
  input  [9:0] io_in, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/PassThroughGenerator.scala 5:14]
  output [9:0] io_out // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/PassThroughGenerator.scala 5:14]
);
  assign io_out = io_in; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/PassThroughGenerator.scala 9:10]
endmodule
