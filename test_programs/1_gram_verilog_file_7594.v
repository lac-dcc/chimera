// Seed: 2080006342
module module_0 (
    input wand id_0,
    input tri  id_1,
    input tri1 id_2
);
  wire id_4;
  supply1 id_5, id_6 = 1, id_7;
endmodule
module module_1 (
    input  wand  id_0,
    input  uwire id_1,
    output wand  id_2,
    output tri1  id_3,
    output tri   id_4,
    output wire  id_5,
    input  wand  id_6,
    input  tri0  id_7,
    output wand  id_8,
    output tri1  id_9,
    input  tri1  id_10,
    input  tri0  id_11,
    input  wand  id_12,
    input  uwire id_13,
    input  tri0  id_14,
    input  tri1  id_15
);
  nor primCall (id_2, id_10, id_0, id_11, id_1, id_15, id_13, id_12, id_6, id_7);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = id_7;
endmodule
