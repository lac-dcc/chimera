// Seed: 201935404
module module_0 (
    output tri1  id_0,
    input  tri1  id_1,
    input  wand  id_2
    , id_10,
    input  wor   id_3,
    input  wor   id_4,
    input  tri   id_5,
    output wire  id_6,
    input  wor   id_7,
    input  uwire id_8
);
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    output tri0 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input wire id_6,
    input wand id_7,
    input wire id_8,
    input uwire id_9
);
  module_0 modCall_1 (
      id_5,
      id_6,
      id_1,
      id_9,
      id_9,
      id_6,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.type_13 = 0;
  reg id_11;
  always_latch @(id_2) id_11 = #1 1;
  wire  id_12;
  uwire id_13 = 1;
endmodule
