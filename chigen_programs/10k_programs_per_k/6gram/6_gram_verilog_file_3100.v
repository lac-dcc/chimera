// Seed: 3377137067
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input supply1 id_2,
    output wor id_3,
    output wand id_4,
    input tri0 id_5,
    output supply0 id_6
);
  logic id_8;
  ;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  tri0  id_1,
    inout  wire  id_2,
    inout  wor   id_3,
    input  tri0  id_4,
    input  tri0  id_5,
    input  wand  id_6,
    input  tri   id_7,
    output tri0  id_8,
    output wand  id_9,
    input  uwire id_10,
    input  uwire id_11
);
  wire id_13;
  or primCall (id_9, id_10, id_4, id_0, id_11, id_13, id_1, id_5, id_6, id_3, id_2);
  module_0 modCall_1 (
      id_8,
      id_5,
      id_1,
      id_3,
      id_2,
      id_4,
      id_9
  );
endmodule
