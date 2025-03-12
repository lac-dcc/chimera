// Seed: 3632945199
module module_0 (
    input wire id_0,
    input wand id_1,
    input tri0 id_2,
    output wand id_3,
    output wand id_4,
    output tri1 id_5,
    input supply1 id_6,
    input uwire id_7,
    input uwire id_8,
    output wor id_9
);
  wire id_11;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    output tri id_3,
    output tri1 id_4,
    input wor id_5,
    output tri id_6,
    input supply1 id_7
);
  wire id_9;
  xor primCall (id_2, id_0, id_7, id_5, id_1, id_9);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_5,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
