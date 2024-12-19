// Seed: 3736361044
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    output wor id_3,
    input tri id_4,
    input uwire id_5,
    input tri0 id_6,
    output wand id_7,
    output supply1 id_8,
    input wire id_9,
    input supply0 id_10,
    output wor id_11,
    output tri0 id_12,
    output tri1 id_13,
    output tri0 id_14,
    input wire id_15,
    input supply0 id_16,
    input tri1 id_17,
    input tri id_18,
    input tri0 id_19
);
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    input tri1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri id_6,
    input tri1 id_7,
    input supply0 id_8,
    output supply1 id_9,
    input wand id_10
);
  module_0 modCall_1 (
      id_0,
      id_7,
      id_7,
      id_9,
      id_7,
      id_2,
      id_10,
      id_0,
      id_3,
      id_10,
      id_10,
      id_9,
      id_9,
      id_3,
      id_1,
      id_4,
      id_10,
      id_7,
      id_4,
      id_10
  );
  assign modCall_1.id_8 = 0;
  wire id_12;
  nor primCall (id_3, id_10, id_2, id_7, id_6, id_4, id_5, id_8);
endmodule
