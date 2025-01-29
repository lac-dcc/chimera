// Seed: 4026277422
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input tri1 id_2,
    id_21,
    input wor id_3,
    input supply0 id_4,
    input wand id_5,
    input wor id_6,
    input tri id_7,
    output uwire id_8,
    input wand id_9,
    id_22,
    id_23,
    input tri1 id_10,
    input wor id_11,
    input uwire id_12,
    output supply1 id_13,
    output tri id_14,
    id_24,
    output wor id_15,
    input tri0 id_16,
    output uwire id_17,
    input supply0 id_18,
    output supply0 id_19
);
  supply1 id_25 = -1;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input wire id_2,
    input wand id_3,
    input tri0 id_4,
    output tri1 id_5,
    output tri1 id_6,
    output tri0 id_7,
    input wor id_8,
    output wire id_9
);
  assign id_7 = 1 << 1;
  nand primCall (id_7, id_2, id_8, id_3, id_1, id_4, id_0);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_6,
      id_1,
      id_1,
      id_3,
      id_3,
      id_9,
      id_9,
      id_7,
      id_8,
      id_6,
      id_4,
      id_7
  );
endmodule
