// Seed: 2340051725
module module_0 (
    output uwire id_0,
    input  wire  id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  tri0  id_4,
    input  uwire id_5,
    output wire  id_6,
    input  tri0  id_7,
    output tri0  id_8,
    input  uwire id_9,
    output wor   id_10,
    input  tri0  id_11,
    output wor   id_12,
    input  uwire id_13,
    input  tri1  id_14
);
endmodule
module module_1 (
    input  wand  id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    output wire  id_3,
    output wand  id_4,
    input  wire  id_5,
    output tri0  id_6,
    output tri0  id_7,
    input  tri0  id_8,
    output wand  id_9,
    output tri0  id_10,
    input  tri   id_11,
    input  wire  id_12,
    output tri   id_13,
    input  tri0  id_14,
    output uwire id_15
);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_14,
      id_10,
      id_1,
      id_1,
      id_10,
      id_12,
      id_9,
      id_14,
      id_3,
      id_8,
      id_6,
      id_11,
      id_1
  );
  assign modCall_1.type_3 = 0;
endmodule
