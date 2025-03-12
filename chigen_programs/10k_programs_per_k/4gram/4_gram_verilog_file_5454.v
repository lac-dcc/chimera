// Seed: 1846137019
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    output wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri id_6,
    input supply0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri id_10
);
  final $unsigned(90);
  ;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    output tri   id_2,
    output tri1  id_3,
    input  wor   id_4,
    output tri   id_5,
    input  tri1  id_6,
    input  uwire id_7,
    input  wor   id_8,
    output tri0  id_9,
    output tri   id_10,
    input  tri1  id_11
);
  assign id_9 = id_6;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_9,
      id_8,
      id_6,
      id_11,
      id_4,
      id_7,
      id_11,
      id_0,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule
