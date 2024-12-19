// Seed: 865897963
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input wor id_3,
    input wor id_4,
    input wire id_5,
    input tri1 module_0,
    output wand id_7
);
  wire id_9;
  supply0 id_10 = 1;
endmodule
module module_1 (
    input  tri   id_0,
    input  tri0  id_1,
    output wor   id_2,
    input  tri0  id_3,
    input  wand  id_4,
    input  uwire id_5,
    output wand  id_6
);
  wire id_8;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_6,
      id_1,
      id_4,
      id_5,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
  wire id_11;
endmodule
