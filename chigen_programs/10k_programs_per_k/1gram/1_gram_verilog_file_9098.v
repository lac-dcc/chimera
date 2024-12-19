// Seed: 3605438548
module module_0 (
    output supply0 id_0,
    output wand id_1,
    input tri1 id_2,
    output wor id_3,
    input supply0 id_4,
    input supply1 id_5,
    output wire id_6,
    input wand id_7,
    input wor id_8
);
  tri0 id_10 = id_10, id_11;
  uwire id_12, id_13, id_14, id_15;
  initial id_1 = id_4;
  wor   id_16;
  uwire id_17;
  assign id_14 = id_16 - 1;
  assign id_11 = id_16;
  assign id_17 = 0;
endmodule
module module_1 (
    input  wand id_0,
    input  wand id_1,
    output wire id_2,
    input  wor  id_3
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.type_10 = 0;
  generate
    supply0 id_5 = id_1;
    wand id_6 = 1, id_7;
  endgenerate
endmodule
