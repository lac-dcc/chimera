// Seed: 909561883
module module_0 (
    input  wor   id_0,
    output tri   id_1
    , id_8,
    input  tri   id_2,
    input  uwire id_3,
    input  wor   id_4,
    output uwire id_5,
    output uwire id_6
);
  wire id_9 = id_3;
endmodule
module module_1 (
    output wor   id_0,
    output tri1  id_1,
    input  uwire id_2,
    output tri0  id_3,
    output uwire id_4,
    output uwire id_5,
    input  wire  id_6,
    output wand  id_7,
    input  uwire id_8,
    output tri   id_9,
    input  wand  id_10
);
  assign id_3 = ~id_8 && id_6;
  logic id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_8,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
