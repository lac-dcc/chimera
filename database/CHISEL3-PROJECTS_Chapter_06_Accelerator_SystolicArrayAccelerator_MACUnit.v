// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module SignedMultiplier(
  input  [7:0]  io_a,
  input  [7:0]  io_b,
  output [15:0] io_product
);
  assign io_product = $signed(io_a) * $signed(io_b); // @[SignedMultipler.scala 10:22]
endmodule
module SignedAdder(
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [7:0] io_sum
);
  assign io_sum = $signed(io_a) + $signed(io_b); // @[SignedAdder.scala 13:18]
endmodule
module MACUnit(
  input         clock,
  input         reset,
  input  [7:0]  io_inputA,
  input  [7:0]  io_inputB,
  input  [7:0]  io_weight,
  output [15:0] io_output
);
  wire [7:0] multiplier_io_a; // @[MACUnit.scala 11:26]
  wire [7:0] multiplier_io_b; // @[MACUnit.scala 11:26]
  wire [15:0] multiplier_io_product; // @[MACUnit.scala 11:26]
  wire [7:0] adder_io_a; // @[MACUnit.scala 12:21]
  wire [7:0] adder_io_b; // @[MACUnit.scala 12:21]
  wire [7:0] adder_io_sum; // @[MACUnit.scala 12:21]
  SignedMultiplier multiplier ( // @[MACUnit.scala 11:26]
    .io_a(multiplier_io_a),
    .io_b(multiplier_io_b),
    .io_product(multiplier_io_product)
  );
  SignedAdder adder ( // @[MACUnit.scala 12:21]
    .io_a(adder_io_a),
    .io_b(adder_io_b),
    .io_sum(adder_io_sum)
  );
  assign io_output = {{8{adder_io_sum[7]}},adder_io_sum}; // @[MACUnit.scala 20:13]
  assign multiplier_io_a = io_inputA; // @[MACUnit.scala 14:19]
  assign multiplier_io_b = io_weight; // @[MACUnit.scala 15:19]
  assign adder_io_a = multiplier_io_product[7:0]; // @[MACUnit.scala 17:14]
  assign adder_io_b = io_inputB; // @[MACUnit.scala 18:14]
endmodule
