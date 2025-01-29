// Seed: 1355732688
module module_0 (
    output tri0  id_0,
    input  wire  id_1,
    output wor   id_2,
    input  tri   id_3,
    output wand  id_4,
    output wand  id_5,
    input  uwire id_6,
    output tri0  id_7
);
  assign module_1.type_20 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1,
    input  tri   id_2,
    input  wire  id_3,
    input  wand  id_4,
    input  tri0  id_5,
    input  wand  id_6,
    output tri1  id_7,
    output uwire id_8,
    input  tri0  id_9,
    output tri   id_10
);
  wor id_12, id_13;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_8,
      id_5,
      id_8,
      id_8,
      id_9,
      id_10
  );
  assign id_12 = id_2 - 1;
  assign id_8  = id_4 == -1;
endmodule
