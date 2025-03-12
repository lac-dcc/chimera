// Seed: 4143246501
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
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wor id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_16;
  ;
  assign id_5 = id_6 * 1;
endmodule
module module_1 #(
    parameter id_9 = 32'd5
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire _id_9;
  input wire id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_12,
      id_2,
      id_10,
      id_7,
      id_7,
      id_10,
      id_11,
      id_7,
      id_2,
      id_11,
      id_11,
      id_7,
      id_5,
      id_2,
      id_3
  );
  inout wire id_1;
  assign id_6[id_9==1] = -1 ? 1 : id_5;
  wire id_13;
  assign id_6 = id_8;
  assign id_5 = id_9;
endmodule
