// Seed: 2398075946
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
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_14 = id_12;
endmodule
module module_1 #(
    parameter id_5 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_8,
      id_3,
      id_4,
      id_4,
      id_8,
      id_4,
      id_3,
      id_6,
      id_4,
      id_3,
      id_8
  );
  inout wire _id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[id_5] = 1;
  parameter id_9 = 1;
endmodule
