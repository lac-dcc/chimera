// Seed: 160489781
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wand id_2,
    output wire id_3,
    input wand id_4,
    input tri0 id_5,
    output supply1 id_6,
    output supply0 id_7,
    input tri id_8,
    output supply1 id_9,
    input tri0 id_10,
    input uwire id_11,
    output wand id_12
    , id_25,
    output supply0 id_13,
    output tri id_14,
    input wor id_15,
    input supply1 id_16,
    output supply1 id_17,
    input tri0 id_18,
    output supply0 id_19,
    input wand id_20,
    output tri0 id_21,
    input tri1 id_22,
    input wire id_23
);
  wire id_26;
endmodule
macromodule module_1 (
    output wand id_0,
    output tri1 id_1,
    input supply0 id_2
);
  wire id_4, id_5;
  wire id_6, id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_19 = 0;
  wire id_8;
  nand primCall (id_0, id_7, id_4, id_6);
endmodule
