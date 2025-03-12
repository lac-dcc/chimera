// Seed: 1583841913
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
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_14 = -1;
  assign id_13 = 1;
  assign id_8  = id_11;
endmodule
module module_1 #(
    parameter id_8 = 32'd93
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  inout wire _id_8;
  output wire id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6[1 : id_8] = 1;
  logic [-1 : id_8] id_9, id_10, id_11;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_4,
      id_9,
      id_4,
      id_1,
      id_10,
      id_10,
      id_11,
      id_10,
      id_10,
      id_2,
      id_2
  );
  assign id_2 = id_11;
endmodule
