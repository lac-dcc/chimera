// Seed: 1392129188
module module_0 (
    output tri id_0,
    output wand id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wor id_4,
    input tri id_5,
    output supply1 id_6
    , id_13,
    output supply0 id_7,
    output wand id_8,
    output wire id_9,
    output wand id_10,
    input tri id_11
);
  wire id_14;
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    output wor id_3,
    input supply0 id_4
    , id_22,
    input wire id_5,
    input wor id_6,
    output supply0 id_7,
    output wire id_8,
    output supply0 id_9,
    output tri1 id_10,
    input wand id_11,
    input supply1 id_12,
    output tri1 id_13,
    input wor id_14,
    input supply1 id_15,
    input supply0 id_16,
    input tri0 id_17,
    input supply1 id_18,
    input tri id_19,
    output supply1 id_20
);
  wire id_23;
  nand primCall (
      id_8,
      id_22,
      id_15,
      id_12,
      id_11,
      id_6,
      id_18,
      id_5,
      id_19,
      id_4,
      id_0,
      id_2,
      id_17,
      id_16,
      id_23,
      id_14
  );
  module_0 modCall_1 (
      id_20,
      id_10,
      id_19,
      id_10,
      id_11,
      id_0,
      id_13,
      id_7,
      id_10,
      id_9,
      id_7,
      id_15
  );
  assign modCall_1.id_4 = 0;
endmodule
