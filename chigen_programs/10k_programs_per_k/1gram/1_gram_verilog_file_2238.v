// Seed: 1778851993
module module_0 (
    input uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input tri id_3
    , id_12,
    input wor id_4,
    output tri0 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input wand id_8,
    input uwire id_9,
    output tri1 id_10
);
  supply1 id_13, id_14, id_15 = 1;
  wand id_16 = id_13 ^ 1;
endmodule
module module_1 (
    output wand id_0,
    output tri1 id_1,
    input  wand id_2,
    inout  tri0 id_3,
    output wand id_4
);
  generate
    assign id_1 = id_2 << 1;
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_0,
      id_2,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.type_22 = 0;
endmodule
