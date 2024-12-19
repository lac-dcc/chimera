// Seed: 329706675
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input uwire id_2
    , id_16,
    output supply1 id_3
    , id_17,
    output tri id_4,
    output supply0 id_5,
    input uwire id_6,
    input supply0 id_7,
    output wand id_8,
    input tri0 id_9,
    output tri0 id_10,
    input supply0 id_11,
    input wor id_12,
    input tri0 id_13,
    input tri id_14
);
endmodule
module module_1 (
    output wand id_0,
    output wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wire id_5,
    output wor id_6,
    input wire id_7,
    output tri0 id_8,
    input uwire id_9,
    output wand id_10,
    output wand id_11,
    input tri id_12
);
  assign id_8 = id_7;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_5,
      id_11,
      id_11,
      id_8,
      id_7,
      id_12,
      id_10,
      id_5,
      id_1,
      id_5,
      id_2,
      id_5,
      id_5
  );
  assign modCall_1.id_5 = 0;
  wire id_14;
  xor primCall (id_8, id_5, id_4, id_2, id_9, id_12, id_3, id_7);
endmodule
