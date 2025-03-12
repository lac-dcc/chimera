// Seed: 2142458450
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4, id_5, id_6, id_7;
  wire id_8;
endmodule
module module_1 #(
    parameter id_7 = 32'd66
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output logic [7:0] id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  nor primCall (id_4, id_11, id_9, id_2, id_3);
  output wire id_8;
  inout wire _id_7;
  output wire id_6;
  output wand id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_12,
      id_4
  );
  assign id_14[!id_7] = id_2 ^ 1 ^ id_2;
  parameter id_15 = 1;
  wire id_16;
  wire id_17;
  assign id_5 = id_4#(.id_17(id_15)) - id_3;
endmodule
