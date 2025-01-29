// Seed: 2736103130
module module_0 (
    output wor   id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    output wor   id_3,
    input  tri   id_4,
    output wire  id_5,
    input  wor   id_6,
    id_11,
    id_12,
    input  wand  id_7,
    input  uwire id_8,
    output tri1  id_9
);
  assign id_5 = id_2;
  assign id_9 = 1;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  uwire id_4
);
  always id_3 = id_0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_3,
      id_0,
      id_3,
      id_0,
      id_4,
      id_1,
      id_3
  );
  assign modCall_1.id_9 = 0;
endmodule
