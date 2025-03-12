// Seed: 2284065529
module module_0 (
    output supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    input wor id_3,
    output tri1 id_4,
    output wor id_5,
    output supply1 id_6,
    output supply1 id_7,
    input supply0 id_8
    , id_17,
    input uwire id_9,
    input wire id_10,
    input supply0 id_11,
    input wand id_12,
    input wire id_13,
    output tri0 id_14,
    output supply1 id_15
);
endmodule
module module_1 #(
    parameter id_4 = 32'd51
) (
    input  tri0 id_0,
    output tri1 id_1,
    input  tri0 id_2
);
  wire [-1 : -1] _id_4;
  if (1) tri [id_4 : ""] id_5;
  assign id_5 = -1 & 1 - id_2;
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_11 = 0;
  always @(id_5);
endmodule
