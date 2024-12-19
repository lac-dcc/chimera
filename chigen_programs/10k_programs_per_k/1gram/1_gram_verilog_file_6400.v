// Seed: 4053873395
module module_0 (
    output wand  id_0,
    output tri   id_1,
    input  tri0  id_2,
    output wand  id_3,
    output tri1  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  wire  id_7,
    output uwire id_8,
    output wor   id_9,
    input  uwire id_10,
    input  tri0  id_11
);
  assign id_4 = id_2;
  initial id_3 = id_2;
  assign id_0 = 1'h0;
  wire id_13;
  tri  id_14 = id_6;
  assign id_1 = id_5;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri id_2,
    output wand id_3,
    input wire id_4
);
  assign id_3 = 1 - id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_2,
      id_0,
      id_4,
      id_3,
      id_1,
      id_2,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
