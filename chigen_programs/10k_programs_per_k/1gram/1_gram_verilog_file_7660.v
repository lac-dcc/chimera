// Seed: 3513049055
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout supply0 id_4;
  output wire id_3;
  input wire id_2;
  output tri0 id_1;
  assign id_1 = 1;
  assign id_4 = 1;
  bit id_6, id_7;
  always id_7#(1, 1) = id_2;
  assign id_4 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd40,
    parameter id_14 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10[id_14 : id_11],
    _id_11,
    id_12,
    id_13,
    _id_14
);
  inout wire _id_14;
  output wire id_13;
  inout wire id_12;
  output wire _id_11;
  inout logic [7:0] id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_1 = 0;
  output wire id_1;
  nand primCall (id_6, id_10, id_2, id_9, id_7, id_3, id_12, id_8);
endmodule
