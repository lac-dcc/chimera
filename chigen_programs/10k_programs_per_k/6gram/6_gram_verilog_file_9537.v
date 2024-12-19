// Seed: 557487506
module module_0 (
    output wor id_0,
    input wire id_1,
    input wand id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wor id_5,
    output uwire id_6,
    input wand id_7,
    input wand id_8,
    output tri0 id_9,
    input wand id_10,
    input tri1 id_11,
    input tri1 id_12,
    input wor id_13,
    input supply0 id_14,
    input supply0 id_15,
    output supply0 id_16,
    input wor id_17,
    input wor id_18,
    input supply0 id_19,
    output supply1 id_20
);
  assign id_9 = 1;
  wire id_22, id_23;
  supply0 id_24 = 1;
  wire id_25;
  assign id_5 = 1;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wire id_1,
    input  wor  id_2,
    input  wand id_3,
    output wand id_4,
    output tri  id_5
);
  assign id_4 = 1;
  nand primCall (id_4, id_2, id_1, id_0);
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_0,
      id_5,
      id_4,
      id_3,
      id_2,
      id_5,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_5,
      id_3,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
