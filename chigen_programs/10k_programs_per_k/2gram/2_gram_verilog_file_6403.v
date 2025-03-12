// Seed: 1454421586
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd81,
    parameter id_6  = 32'd9,
    parameter id_9  = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  inout logic [7:0] id_15;
  output wire id_14;
  inout wire _id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire _id_9;
  input wire id_8;
  input wire id_7;
  inout wire _id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_2,
      id_2,
      id_8,
      id_2,
      id_5,
      id_2,
      id_10,
      id_3,
      id_2,
      id_17,
      id_5,
      id_4
  );
  assign id_15[id_13] = id_1[id_9 : id_6];
endmodule
