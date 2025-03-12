// Seed: 4194262556
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input uwire id_2,
    output tri id_3,
    input supply1 id_4,
    input wire id_5,
    output tri0 id_6,
    output supply0 id_7,
    input tri id_8,
    input supply0 id_9,
    input supply0 id_10,
    input wand id_11,
    input uwire id_12
);
  wire id_14;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input wand id_2,
    input tri1 id_3,
    output uwire id_4,
    output wor id_5,
    output tri0 id_6,
    output wor id_7,
    input tri0 id_8,
    input wor id_9,
    input tri0 id_10,
    output uwire id_11,
    output tri id_12,
    output tri0 id_13,
    input wand id_14
);
  xor primCall (id_7, id_10, id_3, id_8, id_14, id_1, id_2, id_9);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_14,
      id_4,
      id_9,
      id_2,
      id_7,
      id_4,
      id_1,
      id_9,
      id_9,
      id_10,
      id_10
  );
  assign modCall_1.id_12 = 0;
endmodule
