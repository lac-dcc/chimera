// Seed: 2454763258
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  assign module_1._id_5 = 0;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_5;
  wire id_25;
  ;
  wire id_26;
endmodule
module module_1 #(
    parameter id_0 = 32'd12,
    parameter id_4 = 32'd26,
    parameter id_5 = 32'd86
) (
    output tri0  _id_0,
    input  tri   id_1,
    input  tri0  id_2,
    input  tri   id_3,
    input  wire  _id_4,
    input  uwire _id_5,
    output tri1  id_6
);
  struct packed {
    logic id_8;
    logic [id_4  |  id_5  |  id_0 : 1] id_9;
  } [-1 'h0 : id_0] id_10[1 'b0 : -1 'b0];
  ;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_9,
      id_10,
      id_8,
      id_10,
      id_10,
      id_10,
      id_8,
      id_8,
      id_10,
      id_10,
      id_9,
      id_9,
      id_10,
      id_9,
      id_10,
      id_8,
      id_10,
      id_9,
      id_10,
      id_8,
      id_9,
      id_9
  );
endmodule
