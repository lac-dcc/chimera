// Seed: 3650417346
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_5 = -1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_8 = 32'd9
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  inout wire _id_8;
  output wire id_7;
  output wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_4,
      id_9
  );
  parameter id_12 = -1;
  parameter id_13 = id_12[1];
  tri id_14 = id_11 & id_13[id_8];
endmodule
