// Seed: 3635156423
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
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_5 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire _id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_3,
      id_6,
      id_3,
      id_3,
      id_6,
      id_6,
      id_3,
      id_7,
      id_6,
      id_2,
      id_3,
      id_4,
      id_6
  );
  inout wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1] = id_6;
  assign id_1 = id_5;
  assign id_1[id_5] = -1;
endmodule
