// Seed: 1576541912
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri0 id_5
    , id_13,
    output tri0 id_6,
    output tri1 id_7,
    output wire id_8
    , id_14,
    input wor id_9,
    output wand id_10,
    input supply0 id_11
    , id_15
);
  wire id_16;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    output wand  id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  wand  id_5,
    input  tri1  id_6,
    input  logic id_7,
    output tri0  id_8
);
  assign id_2 = 1'd0;
  wire id_10;
  wire id_11;
  always #id_12 id_12 <= id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_4,
      id_5,
      id_8,
      id_2,
      id_8,
      id_2,
      id_0,
      id_8,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
