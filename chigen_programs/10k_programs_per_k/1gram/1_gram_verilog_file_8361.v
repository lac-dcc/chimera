// Seed: 783035194
module module_0 (
    input  uwire id_0,
    input  tri   id_1,
    input  wand  id_2,
    input  wire  id_3,
    input  tri0  id_4,
    input  wor   id_5,
    inout  uwire id_6,
    output tri0  id_7,
    input  tri   id_8,
    input  wor   id_9
);
  assign id_7 = 1;
endmodule
module module_1 (
    inout wand id_0,
    input supply1 id_1,
    output wand id_2,
    input tri id_3,
    input tri1 id_4,
    output wor id_5
);
  wire id_7;
  wire id_8, id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_9,
      id_3,
      id_3,
      id_8,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
