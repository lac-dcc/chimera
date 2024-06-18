// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module RomModule(
  input         clock,
  input         reset,
  input  [7:0]  io_address, // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 4:14]
  output [31:0] io_dataOut // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 4:14]
);
  wire [24:0] _GEN_1 = 3'h1 == io_address[2:0] ? 25'h10000 : 25'h0; // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 27:{14,14}]
  wire [24:0] _GEN_2 = 3'h2 == io_address[2:0] ? 25'h10010 : _GEN_1; // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 27:{14,14}]
  wire [24:0] _GEN_3 = 3'h3 == io_address[2:0] ? 25'h1010100 : _GEN_2; // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 27:{14,14}]
  wire [24:0] _GEN_4 = 3'h4 == io_address[2:0] ? 25'h1010110 : _GEN_3; // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 27:{14,14}]
  wire [24:0] _GEN_5 = 3'h5 == io_address[2:0] ? 25'h10011 : _GEN_4; // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 27:{14,14}]
  assign io_dataOut = {{7'd0}, _GEN_5}; // @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 27:14]
endmodule
