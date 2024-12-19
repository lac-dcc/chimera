// Seed: 1469169179
macromodule module_0 (
    output tri1 id_0,
    output tri1 id_1,
    output tri id_2,
    input wor id_3,
    output wor id_4,
    input supply0 id_5,
    input wand id_6,
    output wor id_7,
    output wire id_8,
    input tri0 id_9,
    input wor id_10,
    input tri id_11,
    output tri id_12,
    input uwire id_13
    , id_28,
    output tri1 id_14,
    input wor id_15,
    input tri id_16,
    output tri1 id_17,
    output tri1 id_18,
    input tri1 id_19,
    input wand id_20,
    output tri0 id_21,
    input tri0 id_22,
    output wand id_23
    , id_29,
    input wand id_24,
    input supply0 id_25,
    input wor id_26
);
  wor id_30 = 1;
endmodule
module module_1 (
    output tri id_0
    , id_17,
    output wand id_1,
    output wire id_2,
    input uwire id_3,
    input uwire id_4,
    output tri1 id_5,
    input wor id_6,
    input tri0 id_7,
    output uwire id_8,
    output uwire id_9,
    input wand id_10,
    output supply1 id_11,
    input supply1 id_12,
    output tri id_13,
    output uwire id_14,
    input tri0 id_15
);
  assign id_11 = id_6;
  xor primCall (id_11, id_17, id_10, id_12, id_4, id_7, id_3, id_15, id_6);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_13,
      id_12,
      id_1,
      id_4,
      id_10,
      id_1,
      id_2,
      id_7,
      id_4,
      id_15,
      id_11,
      id_12,
      id_1,
      id_12,
      id_3,
      id_2,
      id_5,
      id_4,
      id_12,
      id_14,
      id_3,
      id_0,
      id_3,
      id_3,
      id_10
  );
  assign modCall_1.id_1 = 0;
endmodule
