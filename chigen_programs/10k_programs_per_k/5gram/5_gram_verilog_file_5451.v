// Seed: 772119116
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_6 = 1;
  assign id_4[(-1)] = (-1 + -1 + -1'b0);
endmodule
module module_1 #(
    parameter id_14 = 32'd57,
    parameter id_8  = 32'd32
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14
);
  input wire _id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire _id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_7,
      id_4,
      id_5
  );
  assign modCall_1.id_6 = 0;
  output wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  assign id_4[id_14] = id_2 << id_2[id_8] ? id_7 : id_14;
endmodule
