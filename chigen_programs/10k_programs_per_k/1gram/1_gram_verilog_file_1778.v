// Seed: 2020230364
macromodule module_0 (
    input supply1 id_0,
    output supply1 id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri id_4,
    input tri1 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input wor id_8,
    output supply1 id_9,
    input tri0 id_10,
    output tri1 id_11,
    input uwire id_12,
    input tri0 id_13,
    input uwire id_14,
    input tri0 id_15,
    input wor id_16
);
  tri1 id_18 = id_5;
endmodule
module module_1 (
    output wand id_0,
    output wire id_1,
    input  wand id_2,
    input  tri  id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
