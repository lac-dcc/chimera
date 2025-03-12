// Seed: 3338215481
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
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output logic [7:0] id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_10['b0] = id_8;
endmodule
module module_1 #(
    parameter id_4 = 32'd24
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout logic [7:0] id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire _id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_8[id_4] = id_7;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7,
      id_3,
      id_7,
      id_1,
      id_7,
      id_2,
      id_3,
      id_8,
      id_1,
      id_3,
      id_6,
      id_1
  );
endmodule
