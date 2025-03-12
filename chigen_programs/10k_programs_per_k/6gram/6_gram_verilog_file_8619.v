// Seed: 2662681235
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16;
  parameter integer id_17 = 1;
  logic [-1 : 1] id_18;
  assign module_1.id_8 = 0;
  logic id_19;
  ;
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter id_0 = 32'd19,
    parameter id_4 = 32'd24,
    parameter id_5 = 32'd28,
    parameter id_8 = 32'd71
) (
    output tri0  _id_0,
    input  wire  id_1,
    input  tri1  id_2,
    input  wire  id_3,
    input  wand  _id_4,
    input  uwire _id_5,
    output tri0  id_6
);
  logic [id_5 : (  id_4  )] _id_8[1 : id_0];
  logic [id_0 : 1 'b0] id_9;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9
  );
  logic [1 : id_4] id_10;
  assign id_10[id_8] = id_1;
endmodule
