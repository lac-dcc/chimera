// Seed: 1917879191
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
    id_20
);
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout tri id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = -1 || id_5;
endmodule
module module_1 #(
    parameter id_1 = 32'd97
) (
    _id_1,
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
  input wire id_11;
  input wire id_10;
  input wire id_9;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_9,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_3,
      id_5,
      id_3,
      id_3,
      id_3,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_5
  );
  output logic [7:0] id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  nand primCall (id_8, id_11, id_6, id_9, id_5, id_4, id_10);
  input wire _id_1;
  assign id_8[id_1] = id_7;
endmodule
