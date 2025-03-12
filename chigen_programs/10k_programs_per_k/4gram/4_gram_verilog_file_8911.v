// Seed: 13334587
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    output uwire id_2,
    input wand id_3,
    output wor id_4,
    output supply0 id_5,
    input wand id_6,
    input wor id_7,
    input wand id_8,
    input tri1 id_9,
    output wor id_10,
    input uwire id_11,
    output supply1 id_12,
    input tri id_13,
    input wor id_14,
    input tri0 id_15,
    input supply1 id_16,
    output wor id_17,
    output tri id_18,
    output uwire id_19,
    input supply0 id_20,
    input supply0 id_21,
    input supply1 id_22,
    output supply0 id_23
);
  assign id_12 = 1;
endmodule
module module_1 (
    output wand id_0,
    input  tri  id_1,
    output wire id_2,
    output tri0 id_3,
    input  wand id_4,
    input  tri1 id_5,
    output wand id_6
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_5,
      id_5,
      id_3,
      id_4,
      id_6,
      id_4,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_6,
      id_1,
      id_5,
      id_5,
      id_2
  );
  assign modCall_1.id_12 = 0;
endmodule
