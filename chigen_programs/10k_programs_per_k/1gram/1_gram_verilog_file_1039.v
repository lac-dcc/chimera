// Seed: 3601016963
module module_0 (
    input wand id_0,
    input uwire id_1,
    output wand id_2,
    input wire id_3,
    input uwire id_4,
    input tri0 id_5,
    output tri id_6,
    input supply0 id_7,
    input wor id_8,
    input wand id_9,
    input supply1 id_10,
    input supply1 id_11,
    output tri0 id_12,
    input tri0 id_13,
    input supply1 id_14,
    input tri0 id_15
    , id_20,
    output tri id_16,
    output wor id_17,
    output wand id_18
);
  assign module_1.id_7 = 0;
  assign id_18 = id_1;
endmodule
module module_1 (
    input wand id_0,
    output tri1 id_1,
    output uwire id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output uwire id_6,
    output supply1 id_7
);
  assign id_6 = -1'b0;
  nand primCall (id_3, id_5, id_4, id_0);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_0,
      id_0,
      id_4,
      id_1,
      id_5,
      id_0,
      id_0,
      id_0,
      id_5,
      id_6,
      id_0,
      id_4,
      id_5,
      id_3,
      id_7,
      id_3
  );
endmodule
