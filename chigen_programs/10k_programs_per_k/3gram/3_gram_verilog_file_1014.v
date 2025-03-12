// Seed: 1269529798
program module_0 (
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
    id_21,
    id_22,
    id_23
);
  inout tri1 id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output logic [7:0] id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  assign id_14 = id_22;
  assign id_23 = 1;
  assign id_9[{-1{""}}] = id_5;
  wire id_24 = id_3[-1];
endprogram
module module_1 #(
    parameter id_2 = 32'd46
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_4[id_2] = -1 | id_3;
  wire id_6;
  logic [id_2 : 1] id_7 = id_6;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_4,
      id_7,
      id_7,
      id_1,
      id_6,
      id_6,
      id_4,
      id_7,
      id_7,
      id_7,
      id_1,
      id_1,
      id_6,
      id_6,
      id_7,
      id_6,
      id_7,
      id_5,
      id_6,
      id_6,
      id_7
  );
endmodule
