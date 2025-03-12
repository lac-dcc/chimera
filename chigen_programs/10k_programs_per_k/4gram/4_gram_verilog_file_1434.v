// Seed: 531021516
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
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16;
endmodule
module module_1 #(
    parameter id_4 = 32'd60,
    parameter id_6 = 32'd82,
    parameter id_7 = 32'd11
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    _id_7,
    id_8
);
  inout wand id_8;
  input wire _id_7;
  output wire _id_6;
  output wand id_5;
  input wire _id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire [1 : id_4] id_9;
  assign id_8 = -1 - id_4;
  logic [id_6  &&  1 'd0 : 1  |  id_7] id_10, id_11;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_3,
      id_1,
      id_8,
      id_8,
      id_10,
      id_8,
      id_2,
      id_8,
      id_2,
      id_9,
      id_5,
      id_2,
      id_11
  );
  assign id_5 = id_9 && id_1;
endmodule
