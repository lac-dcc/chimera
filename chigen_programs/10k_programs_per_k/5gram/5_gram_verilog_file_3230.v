// Seed: 4239189591
macromodule module_0 (
    output tri1 id_0,
    output wor id_1,
    input tri id_2,
    input tri id_3,
    output wand id_4,
    output supply1 id_5,
    input wand id_6,
    output wire id_7,
    output supply1 id_8,
    input supply0 id_9,
    output supply1 id_10,
    output wand id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wor id_14,
    input wire id_15,
    output wand id_16,
    input tri id_17,
    input wand id_18
);
  assign id_10 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri1  id_1,
    input  wand  id_2,
    output wor   id_3,
    input  uwire id_4,
    output wand  id_5
);
  wire id_7;
  static integer id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_0,
      id_3,
      id_1,
      id_0,
      id_5,
      id_3,
      id_0,
      id_3,
      id_5,
      id_2,
      id_0,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.type_21 = 0;
endmodule
