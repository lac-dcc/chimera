// Seed: 1073292048
module module_0 (
    output uwire id_0,
    output wor   id_1,
    output uwire id_2,
    input  tri0  id_3,
    output wor   id_4,
    input  uwire id_5,
    output tri1  id_6
);
  id_8(
      id_5
  );
endmodule
module module_1 (
    input  wand  id_0,
    output wand  id_1,
    input  tri   id_2,
    output wire  id_3,
    input  wor   id_4,
    input  wand  id_5,
    input  tri   id_6,
    input  uwire id_7,
    input  tri0  id_8,
    output wand  id_9
);
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_7,
      id_9,
      id_6,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
