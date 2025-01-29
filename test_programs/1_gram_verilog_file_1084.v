// Seed: 402934006
module module_0 (
    output wand id_0,
    output wand id_1,
    input  tri0 id_2,
    input  wire id_3
);
  wire id_5;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri id_3,
    input wor id_4,
    input wand id_5,
    output supply1 id_6,
    input supply1 id_7,
    input wand id_8,
    input wor id_9,
    input supply0 id_10,
    output tri id_11
);
  wire id_13 = -1'b0, id_14 = id_5;
  wand id_15, id_16;
  nand primCall (id_1, id_8, id_0, id_4, id_14, id_13, id_16, id_9, id_7, id_15);
  assign id_15 = id_0;
  module_0 modCall_1 (
      id_6,
      id_13,
      id_15,
      id_5
  );
endmodule
