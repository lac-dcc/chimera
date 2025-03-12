// Seed: 3136574208
module module_0 (
    input  uwire id_0,
    input  tri1  id_1,
    output wand  id_2,
    output tri0  id_3,
    input  tri1  id_4,
    input  wor   id_5,
    input  tri   id_6,
    output tri1  id_7
);
  supply1 id_9 = id_4, id_10 = 1;
endmodule
module module_1 (
    input  wand id_0,
    input  tri1 id_1,
    output tri0 id_2,
    output tri0 id_3,
    input  wand id_4
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_6 = 0;
  integer id_6;
  assign id_2 = 1 - id_1;
endmodule
