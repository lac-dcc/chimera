// Seed: 1999280385
module module_0 (
    output uwire id_0,
    input tri id_1,
    output wand id_2,
    input wand id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input wand id_7,
    input wor id_8,
    input tri id_9,
    input wand id_10,
    output tri0 id_11,
    input supply1 id_12,
    output wor id_13,
    output wor id_14,
    input wire id_15,
    output supply0 id_16,
    output supply1 id_17,
    output supply0 module_0,
    output supply0 id_19,
    input wor id_20
);
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    output wor id_3
);
  assign id_1 = 1'd0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
