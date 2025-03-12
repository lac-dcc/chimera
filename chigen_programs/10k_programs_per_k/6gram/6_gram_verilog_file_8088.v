// Seed: 1729854859
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_6 = 32'd83
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output logic [7:0] id_14;
  inout wire id_13;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_4,
      id_4
  );
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire _id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  nor primCall (id_4, id_2, id_7, id_13, id_12, id_10, id_5, id_8, id_1, id_9);
  assign id_1 = id_10;
  wire id_16;
  logic [id_6 : 1] id_17;
  assign id_6 = id_16;
  assign id_14[1] = id_2 & -1;
endmodule
