// Seed: 2918196123
module module_0 (
    output wor id_0,
    input tri id_1,
    input tri0 id_2,
    output tri id_3,
    input tri1 id_4,
    output tri1 id_5,
    output wire id_6,
    input wor id_7,
    input tri id_8,
    input uwire id_9,
    output tri1 id_10,
    input wor id_11,
    input tri id_12,
    input tri1 id_13,
    input uwire id_14,
    output wor id_15
    , id_22,
    output supply1 id_16,
    output tri1 id_17,
    output wor id_18,
    input supply0 id_19,
    output wand id_20
);
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    output tri0 id_3,
    output tri1 id_4,
    input wor id_5,
    output wor id_6,
    output tri id_7
);
  uwire id_9;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_0,
      id_9,
      id_5,
      id_3,
      id_6,
      id_0,
      id_0,
      id_2,
      id_9,
      id_0,
      id_5,
      id_0,
      id_2,
      id_1,
      id_7,
      id_4,
      id_9,
      id_5,
      id_4
  );
  assign id_9 = id_0 <= 1 ? 1 : id_2;
  assign id_1 = 1 && 0 ? 1'h0 : 1;
endmodule
