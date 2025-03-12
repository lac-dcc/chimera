// Seed: 1870127563
module module_0 (
    output wire id_0,
    output tri1 id_1,
    output tri1 id_2,
    output supply1 id_3
);
endmodule
module module_1 (
    input  wand  id_0,
    input  tri   id_1,
    input  tri   id_2,
    input  tri1  id_3,
    output tri0  id_4,
    output wire  id_5,
    output tri   id_6,
    output tri0  id_7,
    input  wire  id_8,
    output wire  id_9,
    output uwire id_10,
    input  wor   id_11,
    output wor   id_12,
    input  tri   id_13
);
  assign id_9 = id_8;
  xor primCall (id_9, id_11, id_3, id_0, id_2, id_8, id_13, id_1);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_6,
      id_9
  );
  assign modCall_1.id_0 = 0;
endmodule
