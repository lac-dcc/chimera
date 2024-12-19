// Seed: 1459314472
module module_0 (
    output tri1 id_0,
    output wor id_1,
    output tri id_2,
    input supply1 id_3,
    output wand id_4,
    input wire id_5,
    output wand id_6,
    input tri id_7,
    output wand id_8,
    input supply1 id_9,
    output supply0 id_10,
    input supply1 id_11,
    input wand id_12,
    input supply1 id_13,
    output supply0 id_14,
    input wor id_15,
    output wire id_16,
    output wand id_17,
    output tri id_18
);
endmodule
module module_1 (
    input tri0 id_0,
    output wand id_1,
    output wand id_2,
    input wire id_3,
    input supply0 id_4,
    input uwire id_5
);
  genvar id_7;
  or primCall (id_2, id_3, id_4, id_5, id_7, id_0);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_5,
      id_2,
      id_4,
      id_4,
      id_0,
      id_1,
      id_5,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_18 = 0;
endmodule
