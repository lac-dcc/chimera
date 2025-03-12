// Seed: 1541846098
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    output wand id_2,
    input wor id_3,
    output tri0 id_4,
    output wand id_5,
    input uwire id_6,
    input uwire id_7
);
endmodule
module module_1 (
    input  wand  id_0,
    input  wor   id_1,
    input  wire  id_2,
    inout  uwire id_3,
    output wor   id_4,
    input  tri   id_5,
    input  wand  id_6,
    input  tri0  id_7,
    input  wand  id_8,
    input  wand  id_9,
    input  tri   id_10,
    input  wand  id_11,
    input  wand  id_12,
    input  wire  id_13
);
  assign id_4 = id_2 ? 1 : id_8;
  nor primCall (id_4, id_10, id_7, id_11, id_6, id_2, id_3, id_0);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_4,
      id_9,
      id_3,
      id_3,
      id_6,
      id_13
  );
  assign modCall_1.id_3 = 0;
  wire id_15;
  ;
  assign id_3 = id_5;
endmodule
