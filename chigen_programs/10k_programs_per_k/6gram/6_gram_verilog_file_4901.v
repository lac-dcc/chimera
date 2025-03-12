// Seed: 2204071182
module module_0 (
    output tri0  id_0,
    output uwire id_1,
    output wor   id_2,
    output tri   id_3,
    output tri1  id_4,
    input  tri1  id_5,
    input  tri0  id_6,
    output wor   id_7,
    input  tri1  id_8
);
  logic id_10;
  wand id_11 = -1;
  logic id_12 = id_8;
  supply1 id_13 = -1;
  assign id_7 = id_8;
endmodule
module module_1 (
    input  tri1 id_0,
    input  tri0 id_1,
    output tri  id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
