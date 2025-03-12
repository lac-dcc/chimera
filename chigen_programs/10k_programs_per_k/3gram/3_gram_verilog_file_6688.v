// Seed: 3319954625
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
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_15 = 32'd94
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
    id_13,
    id_14,
    _id_15
);
  inout wire _id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  nand primCall (id_2, id_9, id_1, id_10, id_12, id_7, id_6, id_13, id_5, id_4);
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_6,
      id_13,
      id_6,
      id_9,
      id_9,
      id_9,
      id_6,
      id_9,
      id_12,
      id_3,
      id_13,
      id_3
  );
  assign id_8 = id_4[-1+:id_15];
endmodule
