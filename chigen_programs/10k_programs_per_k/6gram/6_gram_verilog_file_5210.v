// Seed: 1873729311
module module_0 (
    output tri  id_0,
    input  tri0 id_1,
    input  wand id_2,
    input  tri1 id_3,
    input  wor  id_4,
    input  tri0 id_5,
    output wire id_6,
    output wor  id_7,
    output wor  id_8
);
  assign id_6 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri   id_2,
    output tri0  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    input  wor   id_6,
    output wand  id_7
);
  assign id_3 = !id_5;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_7,
      id_2,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
