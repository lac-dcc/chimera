// Seed: 803377818
module module_0 (
    output tri id_0,
    output tri1 id_1,
    output uwire id_2,
    input supply0 id_3
    , id_23,
    input wire id_4,
    input tri0 id_5,
    output wor id_6,
    input wand id_7,
    input wire id_8,
    output wand id_9,
    input tri0 id_10,
    input tri id_11,
    input uwire id_12,
    output tri0 id_13,
    input wor id_14,
    input tri0 id_15,
    output wand id_16,
    output supply0 id_17,
    input tri0 id_18,
    output supply1 id_19,
    input tri1 id_20,
    output tri0 id_21
);
  assign id_16 = 1;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    input wand id_2,
    input wire id_3,
    input wor id_4,
    input wire id_5,
    input tri0 id_6,
    input wire id_7,
    output wand id_8,
    input supply1 id_9,
    input tri0 id_10,
    input uwire id_11,
    input wand id_12,
    input wand id_13,
    input tri id_14,
    output tri0 id_15
);
  assign id_8 = id_2;
  xnor primCall (id_8, id_5, id_14, id_6, id_4, id_2, id_9, id_11, id_10, id_12, id_3, id_0);
  module_0 modCall_1 (
      id_15,
      id_1,
      id_8,
      id_5,
      id_5,
      id_3,
      id_8,
      id_4,
      id_14,
      id_15,
      id_12,
      id_6,
      id_6,
      id_1,
      id_2,
      id_11,
      id_8,
      id_1,
      id_13,
      id_1,
      id_3,
      id_8
  );
endmodule
