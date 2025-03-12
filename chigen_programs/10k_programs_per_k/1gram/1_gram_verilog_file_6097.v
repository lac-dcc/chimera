// Seed: 4243898057
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
  inout wire id_13;
  input wire id_12;
  output logic [7:0] id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_14 = 1;
  logic id_15;
  assign id_11[1] = 1;
  logic id_16;
  final disable id_17;
endmodule
module module_1 #(
    parameter id_5 = 32'd87
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6[id_5 : {1{-1}}]
);
  output logic [7:0] id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_2,
      id_4,
      id_3,
      id_6,
      id_3,
      id_4
  );
  input wire id_1;
endmodule
