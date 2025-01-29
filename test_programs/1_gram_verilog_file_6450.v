// Seed: 3109234316
module module_0 (
    output wand id_0,
    input uwire id_1,
    output supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    output tri0 id_5,
    input tri id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri id_9,
    input supply1 id_10,
    input tri id_11,
    output supply0 id_12,
    input uwire id_13,
    input supply0 id_14,
    output wor id_15,
    output wand id_16,
    input supply1 id_17,
    input tri0 id_18,
    input tri0 id_19,
    output wor id_20,
    input tri1 id_21,
    output supply0 id_22,
    input tri0 id_23,
    output wand id_24,
    input wire id_25,
    input wire id_26
);
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    output tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    output supply1 id_7,
    input tri id_8
);
  module_0 modCall_1 (
      id_3,
      id_8,
      id_1,
      id_3,
      id_3,
      id_3,
      id_6,
      id_6,
      id_0,
      id_0,
      id_8,
      id_0,
      id_7,
      id_6,
      id_8,
      id_1,
      id_2,
      id_4,
      id_8,
      id_5,
      id_2,
      id_4,
      id_2,
      id_5,
      id_2,
      id_0,
      id_6
  );
  assign id_7 = id_6 * id_0;
endmodule
