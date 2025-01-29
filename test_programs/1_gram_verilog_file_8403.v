// Seed: 2254376336
macromodule module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = id_2;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (id_1);
  wire id_2 = id_1, id_3, id_4;
  wire id_5;
endmodule
module module_2 (
    input  uwire id_0,
    input  tri   id_1,
    output tri1  id_2,
    output tri   id_3,
    input  tri0  id_4,
    input  wand  id_5,
    input  wor   id_6,
    input  tri0  id_7,
    output uwire id_8,
    output uwire id_9,
    output tri0  id_10,
    input  tri   id_11,
    output uwire id_12
);
endmodule
module module_3 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    input tri0 id_3,
    output wor id_4,
    input wor id_5,
    input supply1 id_6,
    output tri0 id_7
);
  assign id_4 = -1;
  tri1 id_9;
  assign id_7 = id_9;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_9,
      id_5,
      id_3,
      id_6,
      id_1,
      id_7,
      id_4,
      id_9,
      id_0,
      id_7
  );
  assign modCall_1.type_1 = 0;
endmodule
