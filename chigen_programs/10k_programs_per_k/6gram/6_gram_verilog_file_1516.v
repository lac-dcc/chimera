// Seed: 857490494
module module_0 (
    input tri1 id_0,
    output wor id_1,
    output wand id_2,
    output supply1 id_3,
    input uwire id_4,
    output wand id_5,
    input tri0 id_6,
    input uwire id_7,
    output tri id_8
);
  wire id_10;
  assign module_1.id_3 = 0;
  always force id_8 = id_7;
endmodule
module module_1 #(
    parameter id_2 = 32'd58
) (
    input supply0 id_0,
    input supply1 id_1,
    input wand _id_2,
    output wand id_3,
    output wand id_4
);
  wire id_6;
  nand primCall (id_4, id_1, id_0, id_6);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_3,
      id_4,
      id_0,
      id_4,
      id_0,
      id_0,
      id_4
  );
  wire id_7[id_2 : 1];
endmodule
