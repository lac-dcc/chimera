// Seed: 2525044249
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input uwire id_2,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5,
    input wand id_6,
    input uwire id_7,
    input tri0 id_8
);
  integer id_10;
  ;
endmodule
module module_1 (
    output tri   id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output wand  id_3,
    input  tri0  id_4,
    input  uwire id_5,
    input  tri0  id_6,
    input  wor   id_7
);
  assign id_3 = id_2;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_1,
      id_5,
      id_3,
      id_6,
      id_1,
      id_7
  );
  assign modCall_1.id_7 = 0;
endmodule
