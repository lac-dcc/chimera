// Seed: 3257783453
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
    id_12
);
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd25
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
    id_10,
    id_11,
    id_12,
    _id_13
);
  input wire _id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_8,
      id_8,
      id_6,
      id_5,
      id_5,
      id_7,
      id_10,
      id_8,
      id_1,
      id_10
  );
  output wire id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4[1'b0<<id_13] = "";
endmodule
