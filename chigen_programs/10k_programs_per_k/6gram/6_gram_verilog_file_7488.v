// Seed: 1129605914
module module_0 (
    output wand id_0,
    output tri1 id_1,
    output wand id_2,
    input uwire id_3,
    input tri1 id_4,
    input wire id_5,
    input tri1 id_6,
    output supply1 id_7
);
  initial repeat (!id_6) id_1 = id_4;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    input wire id_6,
    input wand id_7,
    input tri1 id_8,
    input tri id_9,
    input wire id_10,
    output tri0 id_11,
    output tri1 id_12
);
  assign id_12 = id_8;
  xnor primCall (id_12, id_10, id_9, id_6, id_7, id_1, id_8, id_2, id_3, id_0, id_4);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_5,
      id_3,
      id_2,
      id_9,
      id_7,
      id_12
  );
endmodule
