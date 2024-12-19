// Seed: 3157880447
module module_0 (
    output wor id_0,
    input wor id_1,
    output tri1 id_2,
    output wire id_3,
    input tri0 id_4,
    output tri id_5,
    input wand id_6,
    input wand id_7,
    input tri0 id_8,
    input supply1 id_9,
    output wand id_10,
    output tri1 id_11
);
  assign id_2 = 1'h0;
  wire id_13, id_14;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output wire id_2,
    output supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    output tri1 id_8,
    output wand id_9,
    input uwire id_10,
    input wor id_11,
    output tri0 id_12,
    output tri1 id_13
);
  wire id_15;
  assign id_2 = id_10;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_12,
      id_13,
      id_4,
      id_2,
      id_7,
      id_4,
      id_1,
      id_5,
      id_9,
      id_2
  );
  assign modCall_1.id_7 = 0;
  wand id_16, id_17 = id_10 & id_16, id_18;
endmodule
