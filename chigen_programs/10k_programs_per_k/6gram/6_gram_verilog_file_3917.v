// Seed: 1770887048
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output uwire id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wand id_5,
    input wand id_6,
    output wire id_7,
    output uwire id_8,
    output uwire id_9,
    input supply0 id_10,
    input wire id_11,
    input tri0 id_12,
    input wand id_13,
    input wand id_14,
    output wor id_15,
    output tri0 id_16,
    input wire id_17,
    input supply0 id_18,
    input tri1 id_19,
    output uwire id_20,
    input tri0 id_21,
    input wor id_22,
    input tri0 id_23,
    output uwire id_24
);
  assign {1, 1 + 1} = id_3 !== id_11;
  assign module_1.id_3 = 0;
  tri0 id_26 = 1;
  assign #1 id_24 = 1 && id_23 == 1;
endmodule
module module_1 (
    output wor id_0,
    output wire id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input tri0 id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    inout supply0 id_10,
    input wor id_11,
    input wor id_12,
    output tri id_13
);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_0,
      id_9,
      id_13,
      id_9,
      id_6,
      id_13,
      id_10,
      id_10,
      id_10,
      id_3,
      id_4,
      id_3,
      id_11,
      id_13,
      id_13,
      id_3,
      id_4,
      id_3,
      id_0,
      id_12,
      id_10,
      id_8,
      id_10
  );
endmodule
