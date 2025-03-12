// Seed: 4050376074
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
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_14 = id_8;
  wire id_15;
  wire id_16 = id_11 | id_7;
endmodule
module module_1 #(
    parameter id_4 = 32'd56,
    parameter id_9 = 32'd97
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_8,
      id_1,
      id_6,
      id_1,
      id_6,
      id_1,
      id_1,
      id_7,
      id_1,
      id_6,
      id_6
  );
  inout wire _id_4;
  input wire id_3;
  input logic [7:0] id_2;
  inout wire id_1;
  logic [-1 : id_4] _id_9;
  ;
  assign id_1 = id_2[id_9];
  parameter id_10 = 1 - 1;
  wire id_11;
  wire id_12;
  tri1 id_13 = id_2 + 1, id_14 = id_6;
endmodule
