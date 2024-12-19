// Seed: 1267302955
macromodule module_0 (
    output supply1 id_0,
    output tri id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri id_4,
    output wor id_5,
    output tri0 id_6
);
  wire id_8;
  tri0 id_9 = id_3;
  assign id_9 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    output wand  id_1,
    output tri1  id_2,
    output wor   id_3,
    input  tri0  id_4,
    output tri1  id_5,
    input  wand  id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_6,
      id_1,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
