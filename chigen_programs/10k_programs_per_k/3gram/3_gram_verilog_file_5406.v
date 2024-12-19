// Seed: 522573065
module module_0 (
    output supply0 id_0
    , id_30,
    input tri1 id_1,
    output wor id_2,
    input wand id_3,
    output wor id_4,
    output supply1 id_5,
    input uwire id_6,
    input supply1 id_7,
    input tri0 id_8,
    output supply0 id_9,
    input uwire id_10,
    output tri1 id_11,
    input wand id_12,
    output tri id_13,
    output supply1 id_14,
    input wand id_15,
    input wand id_16,
    input tri0 id_17,
    input tri0 id_18,
    output tri0 id_19,
    output supply1 id_20,
    output supply0 id_21
    , id_31,
    input tri1 id_22,
    input tri id_23,
    output supply0 id_24,
    input tri id_25,
    output supply0 id_26,
    input tri0 id_27,
    input tri0 id_28
);
  assign id_26 = ~1;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    output wand id_2,
    output supply1 id_3,
    input supply0 id_4
);
  assign id_2 = id_0 & id_1;
  not primCall (id_3, id_4);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_4,
      id_3,
      id_3,
      id_0,
      id_4,
      id_1,
      id_2,
      id_4,
      id_2,
      id_4,
      id_3,
      id_3,
      id_4,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.id_27 = 0;
endmodule
