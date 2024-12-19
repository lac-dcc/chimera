// Seed: 1683685544
module module_0 (
    output wor   id_0,
    output wor   id_1,
    input  uwire id_2,
    input  tri   id_3
    , id_9,
    output uwire id_4,
    output tri0  id_5,
    output wor   id_6,
    input  tri1  id_7
);
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    output supply1 id_2,
    input tri1 id_3,
    input tri id_4,
    input wand id_5,
    input supply1 id_6,
    input wand id_7
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_0,
      id_2,
      id_2,
      id_2,
      id_6
  );
  assign modCall_1.type_11 = 0;
  assign id_2 = {id_5{id_3 & 1}};
endmodule
