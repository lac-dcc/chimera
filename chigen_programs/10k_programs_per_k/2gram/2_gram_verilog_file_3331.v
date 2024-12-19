// Seed: 1453783709
macromodule module_0 (
    output supply1 id_0,
    input uwire id_1,
    input wand id_2,
    output supply1 id_3,
    output tri id_4,
    output supply0 id_5,
    output uwire id_6,
    output supply0 id_7,
    input tri id_8,
    input tri0 id_9,
    output tri0 id_10,
    input supply0 id_11,
    output wor id_12,
    output tri0 id_13,
    input tri id_14,
    output supply1 id_15
);
endmodule
macromodule module_1 (
    output wand id_0,
    input  tri  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_14 = 0;
endmodule
