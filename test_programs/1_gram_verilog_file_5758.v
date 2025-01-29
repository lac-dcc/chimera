// Seed: 1194324357
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output uwire id_5,
    id_20,
    output wor id_6,
    input wor id_7,
    input tri id_8,
    input tri0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    input wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    output supply0 id_15,
    input supply0 id_16,
    output wor id_17,
    output tri1 id_18,
    id_21
);
  tri1 id_22 = -1;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    output wand id_2,
    output wor id_3,
    input tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    id_13,
    output supply1 id_7,
    output tri1 id_8,
    input wire id_9,
    input wor id_10,
    output wor id_11
);
  wire id_14;
  xnor primCall (id_3, id_5, id_0, id_9, id_6, id_10);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_6,
      id_9,
      id_5,
      id_8,
      id_11,
      id_5,
      id_4,
      id_6,
      id_10,
      id_9,
      id_4,
      id_6,
      id_0,
      id_2,
      id_6,
      id_3,
      id_3
  );
  assign modCall_1.id_14 = 0;
endmodule
