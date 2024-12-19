// Seed: 1052185899
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input wor id_2,
    output wand id_3,
    input supply1 id_4,
    input wand id_5
    , id_19,
    output wire id_6,
    input wand id_7,
    output tri id_8,
    input supply1 id_9,
    output supply0 id_10,
    input supply1 id_11,
    input wand id_12,
    input supply1 id_13,
    input supply0 id_14,
    input wor id_15,
    output wire id_16,
    output wand id_17
);
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input uwire id_3,
    output uwire id_4,
    output wor id_5,
    input wor id_6
);
  assign id_4 = id_6 & id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_0,
      id_3,
      id_3,
      id_5,
      id_1,
      id_0,
      id_2,
      id_0,
      id_2,
      id_6,
      id_6,
      id_1,
      id_6,
      id_0,
      id_5
  );
  assign modCall_1.id_10 = 0;
endmodule
