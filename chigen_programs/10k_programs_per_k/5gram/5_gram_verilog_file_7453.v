// Seed: 3556691348
module module_0 (
    input wire id_0,
    output tri0 id_1,
    input tri id_2,
    input wand id_3,
    output supply0 id_4,
    output tri1 id_5,
    output tri id_6,
    input wor id_7,
    output uwire id_8,
    input wand id_9,
    input tri0 id_10,
    output uwire id_11,
    input tri0 id_12,
    output wor id_13,
    input tri0 id_14,
    input uwire id_15,
    input tri1 id_16,
    output supply0 id_17,
    input supply0 id_18,
    output tri1 id_19,
    input supply1 id_20,
    input tri1 id_21,
    output uwire id_22,
    output supply1 id_23,
    output tri1 id_24,
    input tri1 id_25,
    input tri id_26
);
  wire id_28;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input wor id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri id_6,
    output tri1 id_7,
    input tri1 id_8,
    output supply1 id_9,
    input wand id_10,
    output tri1 id_11,
    output supply0 id_12
);
  wire id_14 = id_0 || 1 || 1 || 1 || id_4;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_4,
      id_9,
      id_9,
      id_11,
      id_5,
      id_11,
      id_2,
      id_10,
      id_3,
      id_4,
      id_3,
      id_0,
      id_4,
      id_6,
      id_3,
      id_4,
      id_3,
      id_0,
      id_8,
      id_12,
      id_7,
      id_12,
      id_4,
      id_6
  );
  assign modCall_1.type_2 = 0;
endmodule
