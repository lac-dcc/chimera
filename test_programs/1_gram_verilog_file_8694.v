// Seed: 1921078282
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output wor id_2,
    output tri id_3,
    output supply1 id_4,
    input wor id_5,
    input tri id_6,
    input uwire id_7,
    input wire id_8,
    input supply0 id_9,
    output wor id_10,
    input tri0 id_11,
    input tri1 id_12,
    input tri0 id_13,
    output wire id_14,
    input supply0 id_15,
    input tri1 id_16,
    input wand id_17,
    input tri0 id_18,
    output wand id_19
);
  assign id_19 = id_6 - 1;
  assign module_1.id_8 = 0;
  wire id_21, id_22, id_23;
endmodule
module module_1 (
    input tri id_0,
    output wire id_1,
    input tri id_2,
    input uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    input tri0 id_8,
    input tri1 id_9,
    input wire id_10,
    output wand id_11,
    input tri id_12
);
  bit  id_14;
  tri0 id_15 = 1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_11,
      id_11,
      id_1,
      id_4,
      id_7,
      id_4,
      id_4,
      id_12,
      id_1,
      id_7,
      id_7,
      id_12,
      id_1,
      id_7,
      id_4,
      id_3,
      id_4,
      id_11
  );
  always_ff id_14 <= 1;
  xnor primCall (id_11, id_12, id_0, id_8, id_3, id_6, id_2, id_9, id_4);
endmodule
