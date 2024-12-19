// Seed: 2885936922
macromodule module_0 (
    output wor id_0,
    input tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6
);
  wire id_8, id_9, id_10, id_11, id_12;
  id_13(
      1 - 1
  );
  assign module_1.id_18 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wand id_1,
    input supply1 id_2,
    input supply0 id_3
    , id_22,
    output wand id_4,
    input wire id_5,
    output supply0 id_6,
    output tri1 id_7,
    output wor id_8,
    output tri0 id_9,
    output wand id_10,
    input wire id_11,
    input uwire id_12,
    input uwire id_13,
    input supply0 id_14,
    input wire id_15,
    input tri0 id_16,
    input wand id_17,
    input uwire id_18
    , id_23,
    input tri0 id_19,
    input wor id_20
);
  assign id_7 = 1;
  nor primCall (
      id_0, id_22, id_20, id_3, id_17, id_19, id_11, id_16, id_18, id_2, id_23, id_5, id_12, id_15
  );
  module_0 modCall_1 (
      id_0,
      id_11,
      id_19,
      id_20,
      id_11,
      id_2,
      id_13
  );
endmodule
