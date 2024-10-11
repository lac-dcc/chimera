// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module fp32Class(
  input         clock,
  input         reset,
  input  [31:0] io_fpnumA,
  input  [31:0] io_fpnumB,
  output [31:0] io_fpSum
);
  wire [22:0] fpnumAman = io_fpnumA[22:0]; // @[fp32Class.scala 15:28]
  wire [22:0] fpnumBman = io_fpnumB[22:0]; // @[fp32Class.scala 20:28]
  wire [23:0] _sum_T = fpnumAman + fpnumBman; // @[fp32Class.scala 25:20]
  assign io_fpSum = {{8'd0}, _sum_T}; // @[fp32Class.scala 22:17 25:7]
endmodule
