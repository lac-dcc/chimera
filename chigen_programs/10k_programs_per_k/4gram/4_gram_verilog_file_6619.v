// Seed: 441018549
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wire id_3,
    output wire id_4,
    output supply1 id_5,
    input wand id_6,
    input uwire id_7,
    input wand id_8,
    output supply1 id_9,
    input uwire id_10,
    input supply0 id_11,
    input tri0 id_12,
    input supply1 id_13,
    input tri0 id_14,
    input wor id_15,
    output wor id_16
);
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    input tri id_2,
    output wor id_3,
    input supply0 id_4,
    input wand id_5,
    input wand id_6,
    input tri0 id_7,
    output wor id_8
);
  wire id_10;
  ;
  nand primCall (id_3, id_2, id_10, id_4, id_1, id_6);
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_1,
      id_8,
      id_0,
      id_6,
      id_1,
      id_1,
      id_8,
      id_1,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
