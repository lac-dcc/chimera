// Seed: 1955059426
module module_0 (
    output uwire id_0,
    output tri id_1,
    output wor id_2,
    output tri0 id_3,
    input wor id_4,
    output tri1 id_5,
    output supply1 id_6
);
  assign id_0 = id_4;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    input tri1 id_3,
    output wor id_4,
    output supply1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    output supply0 id_8,
    input wire id_9
);
  tri0 id_11 = 1;
  nand primCall (id_8, id_6, id_2, id_3, id_9, id_7);
  module_0 modCall_1 (
      id_0,
      id_8,
      id_1,
      id_8,
      id_7,
      id_1,
      id_8
  );
  assign modCall_1.type_4 = 0;
endmodule
