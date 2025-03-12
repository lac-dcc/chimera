// Seed: 930220811
module module_0 (
    output uwire id_0,
    output tri0  id_1,
    output wor   id_2,
    input  uwire id_3,
    output wire  id_4,
    input  tri   id_5,
    input  wand  id_6,
    input  tri0  id_7,
    output tri   id_8,
    input  wand  id_9,
    input  tri0  id_10,
    output uwire id_11,
    input  tri   id_12,
    output wire  id_13
);
  assign id_4 = {1{1}};
endmodule
module module_1 (
    output wand  id_0,
    input  wire  id_1,
    output uwire id_2
);
  wire id_4, id_5, id_6, id_7, id_8, id_9, id_10;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
