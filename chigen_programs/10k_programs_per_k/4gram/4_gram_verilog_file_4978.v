// Seed: 2611210682
module module_0 (
    input  uwire id_0,
    output tri0  id_1,
    input  tri1  id_2
    , id_8,
    input  wand  id_3,
    input  wand  id_4,
    input  wor   id_5,
    input  wire  id_6
);
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    output wor id_2,
    input tri0 id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri1 id_6,
    output wand id_7,
    input wor id_8,
    output supply1 id_9,
    input uwire id_10
);
  xor primCall (id_0, id_1, id_5, id_3);
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1,
      id_8,
      id_8,
      id_1,
      id_10
  );
  assign modCall_1.id_6 = 0;
endmodule
