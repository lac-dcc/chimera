// Seed: 560375247
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri id_3,
    output tri id_4,
    input uwire id_5,
    input uwire id_6,
    output wire id_7,
    input tri0 id_8,
    output supply1 id_9
);
  assign id_9 = id_3 ? 1 : id_2;
endmodule
module module_1 (
    input  wand  id_0,
    input  wor   id_1,
    output uwire id_2,
    input  uwire id_3,
    input  wire  id_4,
    input  uwire id_5,
    output tri1  id_6,
    output wand  id_7,
    input  tri   id_8,
    output wand  id_9
);
  assign id_6 = id_0;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_1,
      id_9,
      id_0,
      id_1,
      id_2,
      id_1,
      id_9
  );
  assign modCall_1.id_9 = 0;
endmodule
