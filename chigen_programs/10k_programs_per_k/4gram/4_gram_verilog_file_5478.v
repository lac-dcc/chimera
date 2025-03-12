// Seed: 3623109848
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri1 id_5,
    input uwire id_6,
    output supply1 id_7,
    input supply0 id_8,
    output uwire id_9,
    input tri id_10,
    output wor id_11,
    input wand id_12,
    input supply0 id_13,
    input wor id_14,
    output wand id_15
    , id_26,
    output supply1 id_16,
    input tri0 id_17,
    input supply0 id_18,
    output wire id_19,
    output tri1 id_20,
    input wand id_21,
    output uwire id_22,
    output wor id_23,
    output tri0 id_24
);
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    output wor id_2,
    output supply1 id_3
);
  wand id_5 = 1, id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
