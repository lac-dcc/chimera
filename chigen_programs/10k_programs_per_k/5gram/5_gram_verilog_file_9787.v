// Seed: 140199964
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    output wor id_2,
    input supply0 id_3,
    input supply0 id_4,
    output wor id_5,
    output tri1 id_6,
    input wor id_7,
    output tri1 id_8,
    input uwire id_9,
    input supply0 id_10,
    input uwire id_11,
    input wor id_12,
    input uwire id_13,
    output tri0 id_14,
    input wand id_15,
    input wor id_16,
    input supply1 id_17,
    input wor id_18,
    output supply1 id_19,
    input wor module_0
);
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    input wor id_2,
    input supply1 id_3,
    output supply1 id_4
);
  wire id_6;
  nand primCall (id_4, id_2, id_6, id_1);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_4,
      id_3,
      id_4,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_4,
      id_2,
      id_1,
      id_3,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.id_17 = 0;
endmodule
