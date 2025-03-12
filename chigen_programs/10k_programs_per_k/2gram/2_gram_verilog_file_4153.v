// Seed: 2804123493
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input supply0 id_2,
    output supply1 id_3,
    input supply1 id_4,
    input wand id_5
    , id_13,
    output wand id_6,
    output wor id_7,
    output wor id_8,
    output supply1 id_9,
    output supply0 id_10,
    output wor id_11#(1, 1, 1)
);
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    output uwire id_2,
    output supply1 id_3,
    input tri1 id_4,
    input wand id_5,
    input supply0 id_6,
    output supply1 id_7,
    output wand id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_8,
      id_4,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
  wire id_11;
  nand primCall (id_2, id_0, id_4, id_6, id_10, id_5);
endmodule
