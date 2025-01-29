// Seed: 2518466879
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input supply0 id_2,
    output wor id_3,
    output wor id_4,
    input uwire id_5,
    output supply0 id_6,
    input supply1 id_7,
    output wor id_8,
    input wire id_9,
    output wand id_10,
    input wand id_11,
    input tri0 id_12,
    input wand id_13,
    output tri1 id_14,
    output wor id_15,
    input tri1 id_16,
    input wor id_17,
    input supply0 id_18,
    output supply0 id_19,
    output wor id_20#(.id_23(id_11 - id_2)),
    output wand id_21
);
  wor id_24, id_25, id_26, id_27, id_28;
  wire id_29;
  assign id_25 = id_5;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    output tri id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wire id_5,
    output wand id_6
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_2,
      id_6,
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_0,
      id_4,
      id_4,
      id_4,
      id_1,
      id_6,
      id_3,
      id_3,
      id_3,
      id_6,
      id_1,
      id_0
  );
  assign modCall_1.type_36 = 0;
endmodule
