// Seed: 1753676438
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input tri0 id_2,
    output tri0 id_3,
    output wor id_4,
    input tri1 id_5
    , id_21,
    input supply0 id_6,
    input tri0 id_7,
    output wor id_8,
    output supply0 id_9,
    input tri0 id_10,
    output tri0 id_11,
    input wand id_12,
    input uwire id_13
    , id_22,
    input supply1 id_14,
    input tri id_15,
    output supply1 id_16,
    input tri id_17,
    input wand id_18,
    input wire id_19
);
  wire id_23;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    output wand id_2,
    output wand id_3,
    input tri id_4,
    input tri1 id_5,
    input wor id_6,
    output tri id_7,
    input supply1 id_8,
    output tri id_9
);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_5,
      id_9,
      id_9,
      id_6,
      id_1,
      id_1,
      id_2,
      id_9,
      id_1,
      id_3,
      id_6,
      id_1,
      id_5,
      id_4,
      id_3,
      id_6,
      id_4,
      id_8
  );
  assign modCall_1.type_25 = 0;
  wire id_11;
  xor primCall (id_7, id_8, id_1, id_6, id_5, id_4, id_0);
endmodule
