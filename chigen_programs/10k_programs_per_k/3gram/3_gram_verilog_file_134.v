// Seed: 1500950994
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
    .id_16(id_10),
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wand id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_9 = 1 - id_6;
  wire id_17;
endmodule
module module_1 #(
    parameter id_3 = 32'd82,
    parameter id_4 = 32'd21
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  module_0 modCall_1 (
      id_11,
      id_12,
      id_12,
      id_5,
      id_12,
      id_12,
      id_12,
      id_7,
      id_12,
      id_8,
      id_12,
      id_11,
      id_12,
      id_1,
      id_14
  );
  assign modCall_1.id_9 = 0;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire _id_4;
  output wire _id_3;
  input wire id_2;
  output wire id_1;
  parameter id_15 = 1;
  wire id_16[id_4 : id_3];
  ;
  tri1 id_17 = -1;
endmodule
