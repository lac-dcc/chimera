// Seed: 3479572461
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_11 = id_9 - 1'b0;
  logic id_12, id_13 = id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd43,
    parameter id_9  = 32'd11
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire _id_10;
  input wire _id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input logic [7:0] id_1;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_2,
      id_13,
      id_13,
      id_7,
      id_13,
      id_12,
      id_13,
      id_8
  );
  assign id_15 = id_1[id_9];
  wire [id_10 : 1] id_16;
  xor primCall (id_7, id_8, id_2, id_13, id_15, id_1, id_14);
  wire id_17;
endmodule
