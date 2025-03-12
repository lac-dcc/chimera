// Seed: 2217517636
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input wire id_2,
    input supply0 id_3
    , id_10,
    input uwire id_4,
    output supply1 id_5,
    input supply0 id_6,
    output wor id_7,
    output wire id_8
);
  assign id_5 = id_4;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    output tri1 id_3
    , id_18,
    input tri1 id_4,
    output wand id_5,
    output uwire id_6,
    input tri1 id_7,
    output wor id_8,
    input wor id_9,
    input uwire id_10
    , id_19,
    output tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input supply0 id_14,
    input supply1 id_15,
    input supply1 id_16
);
  assign id_6 = id_4 ? 1 & id_14 : id_14;
  nand primCall (id_5, id_13, id_0, id_14, id_7, id_10, id_4, id_16, id_12, id_1);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_12,
      id_9,
      id_1,
      id_3,
      id_4,
      id_11,
      id_5
  );
endmodule
