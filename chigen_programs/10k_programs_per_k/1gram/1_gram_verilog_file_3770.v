// Seed: 3944941939
macromodule module_0 (
    input wor id_0,
    input wand id_1,
    input tri0 id_2,
    input wand id_3,
    output supply1 id_4,
    input uwire id_5,
    input tri1 id_6,
    output supply1 id_7,
    output tri id_8,
    output tri id_9,
    output tri0 void id_10,
    input tri1 id_11,
    input supply0 id_12
);
  integer id_14;
endmodule
module module_1 (
    input  tri0  id_0,
    output wor   id_1
    , id_7,
    input  wand  id_2,
    input  uwire id_3,
    output uwire id_4,
    input  wor   id_5
);
  assign id_1 = 1;
  nand primCall (id_4, id_2, id_0, id_3, id_5);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_1,
      id_0,
      id_5,
      id_1,
      id_1,
      id_4,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
