// Seed: 3817456769
module module_0 (
    output tri0  id_0,
    input  wire  id_1,
    output wor   id_2,
    output tri   id_3,
    input  wand  id_4,
    output wand  id_5,
    input  uwire id_6,
    output tri0  id_7,
    output wor   id_8
);
  tri1 id_10, id_11 = 1;
  wire id_12;
  genvar id_13;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3,
    input wand id_4,
    output tri id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
