// Seed: 889643391
module module_0 (
    input wire id_0,
    output uwire id_1,
    input wor id_2,
    input tri id_3,
    output wand id_4,
    output tri0 id_5,
    input wand id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri0 id_9,
    input tri id_10,
    output wor id_11,
    input supply1 id_12,
    input uwire id_13,
    input tri1 id_14,
    output wire id_15
);
  supply1 id_17 = 1;
endmodule
module module_1 (
    input  wire  id_0,
    output tri   id_1,
    output wor   id_2,
    input  uwire id_3,
    input  wand  id_4,
    output tri0  id_5,
    input  tri0  id_6,
    input  tri0  id_7,
    output tri1  id_8
);
  assign id_8 = id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_5,
      id_5,
      id_6,
      id_6,
      id_3,
      id_0,
      id_4,
      id_5,
      id_7,
      id_6,
      id_3,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
