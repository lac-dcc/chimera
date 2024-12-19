// Seed: 3196386733
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output tri id_2,
    output supply1 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output wand id_6,
    input wor id_7,
    input wor id_8,
    output tri1 id_9
    , id_16,
    output tri id_10,
    input wand id_11,
    input supply1 id_12,
    output wand id_13
    , id_17,
    output wire id_14
);
  assign id_3 = id_5;
endmodule
module module_1 (
    input tri0 id_0
    , id_11,
    output supply1 id_1,
    output tri0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri id_6,
    input uwire id_7,
    input supply0 id_8,
    output supply1 id_9
);
  assign id_9 = 1'h0;
  nand primCall (id_1, id_7, id_6, id_5, id_11, id_0);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_7,
      id_6,
      id_2,
      id_8,
      id_0,
      id_2,
      id_3,
      id_8,
      id_6,
      id_3,
      id_1
  );
  assign modCall_1.id_13 = 0;
endmodule
