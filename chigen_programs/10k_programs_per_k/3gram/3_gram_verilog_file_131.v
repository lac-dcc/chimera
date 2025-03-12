// Seed: 294271442
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
    id_18
);
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_19 = 1;
  wire [-1 : 1] id_20;
endmodule
module module_1 #(
    parameter id_3 = 32'd99
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  inout logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_2,
      id_5,
      id_1,
      id_4,
      id_2,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_5
  );
  assign id_6[id_3>-1] = id_3;
  wire [-1 : id_3] id_7;
  assign id_3 = id_1;
  parameter id_8 = (1);
  parameter id_9 = -1 == -1 - id_8 * id_8;
endmodule
