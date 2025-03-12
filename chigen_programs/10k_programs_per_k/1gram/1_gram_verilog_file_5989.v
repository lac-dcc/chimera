// Seed: 901753299
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
  input wire id_13;
  assign module_1.id_12 = 0;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout tri0 id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd81,
    parameter id_13 = 32'd99,
    parameter id_3  = 32'd96,
    parameter id_4  = 32'd59,
    parameter id_8  = 32'd73
) (
    id_1[id_13 : id_8],
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    _id_13
);
  output wire _id_13;
  inout wire _id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire _id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire _id_4;
  input wire _id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  wire [ -1 : id_12] id_14 = id_4, id_15 = id_3;
  tri  [id_3 : id_4] id_16 = -1'b0, id_17 = -1;
  module_0 modCall_1 (
      id_11,
      id_17,
      id_7,
      id_14,
      id_5,
      id_2,
      id_17,
      id_16,
      id_14,
      id_14,
      id_15,
      id_11,
      id_2
  );
endmodule
