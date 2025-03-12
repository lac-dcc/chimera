// Seed: 334111236
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    output wor id_4,
    input tri0 id_5,
    input wand id_6,
    output wand id_7,
    input uwire id_8,
    input tri1 id_9,
    input supply0 id_10,
    output wand id_11
);
  wire id_13;
  ;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wor id_4,
    input wand id_5,
    input tri id_6,
    output tri1 id_7,
    output tri0 id_8,
    input uwire id_9,
    output supply1 id_10,
    input supply0 id_11,
    output tri1 id_12
);
  assign id_8 = id_4;
  nand primCall (id_10, id_1, id_5, id_9, id_2, id_4, id_3, id_6, id_11);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_5,
      id_8,
      id_9,
      id_9,
      id_12,
      id_6,
      id_5,
      id_1,
      id_10
  );
endmodule
