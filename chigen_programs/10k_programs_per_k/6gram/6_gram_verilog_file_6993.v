// Seed: 681211761
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input tri1 id_2,
    input tri0 id_3,
    input supply1 id_4,
    output uwire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input wand id_8,
    output uwire id_9,
    output wor id_10
    , id_12
);
  assign id_9 = id_8;
  assign id_5 = id_1;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    output uwire id_4,
    output tri0  id_5,
    output tri   id_6,
    input  wire  id_7,
    input  tri1  id_8,
    input  tri0  id_9
);
  wire id_11, id_12, id_13, id_14;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_1,
      id_9,
      id_9,
      id_0,
      id_7,
      id_8,
      id_9,
      id_6,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_15 = id_7;
endmodule
