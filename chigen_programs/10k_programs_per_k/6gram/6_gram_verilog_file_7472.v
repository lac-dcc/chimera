// Seed: 780878206
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    input uwire id_5,
    output supply1 id_6,
    input tri id_7
    , id_15,
    output supply1 id_8,
    input wand id_9,
    output wor id_10,
    input supply0 id_11,
    output wand id_12,
    output wor id_13
);
  assign id_13 = -1'b0;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input wire id_5
    , id_16,
    input supply0 id_6,
    input wire id_7,
    input wor id_8,
    output supply0 id_9,
    input supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    input wor id_13,
    output tri id_14
);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_5,
      id_2,
      id_11,
      id_4,
      id_14,
      id_8,
      id_3,
      id_8,
      id_9,
      id_11
  );
  assign modCall_1.id_6 = 0;
endmodule
