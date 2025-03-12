// Seed: 3486363787
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1] = id_9 >= 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd80,
    parameter id_6 = 32'd80
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout logic [7:0] id_10;
  module_0 modCall_1 (
      id_10,
      id_9,
      id_3,
      id_9,
      id_3,
      id_9,
      id_9,
      id_9,
      id_2,
      id_3,
      id_9
  );
  inout wire id_9;
  output wire id_8;
  inout logic [7:0] id_7;
  input wire _id_6;
  input wire id_5;
  input wire _id_4;
  inout wire id_3;
  input wire id_2;
  input logic [7:0] id_1;
  logic id_12 = id_1[1 : id_4];
  assign id_7[id_6] = 1 & id_10[id_4] + 1;
endmodule
