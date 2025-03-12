// Seed: 2411106365
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout uwire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_9 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_3,
      id_4,
      id_4,
      id_2,
      id_2,
      id_3,
      id_3,
      id_4,
      id_3,
      id_6,
      id_3,
      id_2,
      id_8,
      id_2,
      id_4,
      id_3,
      id_4,
      id_2
  );
  wire [-1 : id_5] id_9;
  nand primCall (id_2, id_4, id_7, id_3, id_1, id_6);
endmodule
