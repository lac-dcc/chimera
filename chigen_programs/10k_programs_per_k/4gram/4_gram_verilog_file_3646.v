// Seed: 2070146143
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
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd89
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout logic [7:0] id_9;
  output tri id_8;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_7,
      id_4,
      id_1,
      id_6,
      id_7,
      id_4,
      id_5,
      id_1,
      id_5,
      id_6,
      id_4,
      id_2,
      id_4
  );
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire _id_3;
  input wire id_2;
  input wire id_1;
  assign id_9[id_3] = id_2;
  assign id_8 = id_9 | 1'd0 - id_1;
endmodule
