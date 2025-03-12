// Seed: 2922145206
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  genvar id_11;
endmodule
module module_1 #(
    parameter id_4 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    _id_4,
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
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_8,
      id_2,
      id_8,
      id_13,
      id_7,
      id_13,
      id_7,
      id_8
  );
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output logic [7:0] id_5;
  xor primCall (id_8, id_9, id_2, id_14, id_11, id_7, id_13);
  input wire _id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5[id_4] = id_13;
  assign id_3 = id_13;
endmodule
