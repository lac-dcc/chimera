// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module MAC(
  input        clock,
  input        reset,
  input  [3:0] io_in_a, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]
  input  [3:0] io_in_b, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]
  input  [3:0] io_in_c, // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]
  output [7:0] io_out // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]
);
  wire [7:0] _io_out_T = io_in_a * io_in_b; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:22]
  wire [7:0] _GEN_0 = {{4'd0}, io_in_c}; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:33]
  assign io_out = _io_out_T + _GEN_0; // @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:33]
endmodule
