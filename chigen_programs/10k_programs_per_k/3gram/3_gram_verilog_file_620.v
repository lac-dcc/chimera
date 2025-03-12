// Seed: 693957260
module module_0 (
    id_1,
    id_2
);
  inout wand id_2;
  inout wire id_1;
  wire id_3 = id_1;
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd26
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  module_0 modCall_1 (
      id_15,
      id_3
  );
  assign modCall_1.id_2 = 0;
  inout wire id_10;
  inout logic [7:0] id_9;
  inout wire _id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_9[id_8>=-1] = id_10;
  nor primCall (id_3, id_13, id_9, id_1, id_10, id_2, id_15);
endmodule
