// Seed: 1304023021
module module_0 (
    input tri0 id_0,
    input uwire id_1
    , id_8,
    input wand id_2
    , id_9,
    output wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    output tri1 id_6
);
  logic [7:0] id_10;
  wire id_11;
  assign id_10[-1] = 1;
endmodule
module module_1 (
    input  tri1  id_0,
    output wor   id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output uwire id_4,
    output tri   id_5
);
  wire id_7, id_8;
  logic id_9;
  xor primCall (id_5, id_8, id_0, id_3, id_2, id_9);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
