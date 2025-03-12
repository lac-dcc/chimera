// Seed: 2500978918
module module_0 (
    input  tri0  id_0
    , id_12, id_13, id_14,
    output tri0  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output wor   id_4,
    input  uwire id_5,
    output wand  id_6,
    input  wand  id_7,
    input  tri0  id_8,
    input  wor   id_9,
    input  tri   id_10
);
  logic id_15;
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input tri id_2,
    input tri0 id_3,
    input wire id_4,
    input tri id_5,
    input uwire id_6,
    input supply0 id_7,
    output tri id_8
);
  assign id_8 = id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_8,
      id_3,
      id_8,
      id_6,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_2 = 0;
  assign id_1 = id_5;
endmodule
