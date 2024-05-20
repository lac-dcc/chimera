// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module Arbiter(
  input         clock,
  input         reset,
  input         io_fifo_valid, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  output        io_fifo_ready, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  input  [15:0] io_fifo_data, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  output        io_pe0_valid, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  input         io_pe0_ready, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  output [15:0] io_pe0_data, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  output        io_pe1_valid, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  input         io_pe1_ready, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
  output [15:0] io_pe1_data // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]
);
  assign io_fifo_ready = io_pe0_ready | io_pe1_ready; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 22:33]
  assign io_pe0_valid = io_fifo_valid & io_pe0_ready; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 23:33]
  assign io_pe0_data = io_fifo_data; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 25:15]
  assign io_pe1_valid = io_fifo_valid & io_pe1_ready & ~io_pe0_ready; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 24:49]
  assign io_pe1_data = io_fifo_data; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 26:15]
endmodule
