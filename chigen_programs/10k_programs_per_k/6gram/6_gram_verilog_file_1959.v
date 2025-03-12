// Seed: 1457301796
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always force id_1 = -1'h0;
endmodule
module module_1 #(
    parameter id_6 = 32'd14,
    parameter id_8 = 32'd52
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout reg id_14;
  input wire id_13;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_3,
      id_12,
      id_13,
      id_7
  );
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire _id_8;
  inout wire id_7;
  inout wire _id_6;
  output wire id_5;
  input logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_16;
  initial id_14 = id_4 !=? {1, id_8 == id_4[id_6 : id_8], -1, id_7, id_13};
endmodule
