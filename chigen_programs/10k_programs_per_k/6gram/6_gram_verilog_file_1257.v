// Seed: 3711984043
module module_0 (
    output wor id_0,
    input tri id_1,
    input tri id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri1 id_6
);
  wire id_8;
endmodule
module module_1 (
    output wor   id_0,
    output uwire id_1,
    output tri   id_2,
    input  tri0  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    input  wand  id_6,
    input  uwire id_7,
    output tri0  id_8
);
  assign id_2 = !{1, id_7, id_3.id_6} ? id_6 : id_4;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_8,
      id_5,
      id_3,
      id_0
  );
  assign modCall_1.type_4 = 0;
endmodule
