// Seed: 439324650
macromodule module_0 (
    input supply1 id_0,
    output wire id_1,
    output uwire id_2,
    output tri1 id_3,
    output wire id_4,
    input wor id_5,
    output supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    input wire id_9
    , id_20,
    output tri0 id_10,
    input tri0 id_11,
    input supply1 id_12,
    output wand id_13,
    input wor id_14,
    output wire id_15,
    output wor id_16,
    input tri id_17
    , id_21,
    output supply0 id_18
);
endmodule
module module_1 (
    input tri0 id_0,
    output tri id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    input wire id_5,
    input supply1 id_6,
    output wand id_7,
    input supply1 id_8,
    output tri0 id_9
    , id_15,
    output wand id_10,
    input tri1 id_11,
    output wor id_12,
    output tri0 id_13
);
  uwire id_16 = id_6, id_17, id_18;
  wire id_19;
  or primCall (id_10, id_4, id_6, id_5, id_18, id_19, id_3, id_17, id_2, id_8, id_15, id_16, id_0);
  module_0 modCall_1 (
      id_4,
      id_10,
      id_12,
      id_9,
      id_1,
      id_3,
      id_18,
      id_15,
      id_2,
      id_3,
      id_15,
      id_18,
      id_16,
      id_10,
      id_4,
      id_10,
      id_17,
      id_17,
      id_10
  );
  assign modCall_1.type_23 = 0;
  assign id_12 = id_15;
endmodule
