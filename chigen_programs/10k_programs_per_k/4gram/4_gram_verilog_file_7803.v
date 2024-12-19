// Seed: 2299371493
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input wire id_2,
    output wand id_3,
    output supply0 id_4,
    input tri0 id_5,
    input uwire id_6,
    output tri id_7,
    output wire id_8,
    output wor id_9,
    input uwire id_10,
    output supply1 id_11,
    output wand id_12,
    input wor id_13,
    input supply0 id_14,
    input uwire id_15
);
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wire id_5,
    output wor id_6,
    input wire id_7,
    output tri0 id_8,
    input uwire id_9,
    input wand id_10,
    input wand id_11
);
  module_0 modCall_1 (
      id_10,
      id_0,
      id_9,
      id_8,
      id_6,
      id_5,
      id_5,
      id_8,
      id_6,
      id_0,
      id_9,
      id_6,
      id_6,
      id_7,
      id_10,
      id_5
  );
  assign modCall_1.type_19 = 0;
  assign id_6 = 1;
  xor primCall (id_0, id_5, id_3, id_7, id_9, id_11, id_4, id_10, id_2, id_1);
endmodule
