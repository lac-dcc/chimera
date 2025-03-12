// Seed: 2373611610
module module_0 (
    input  tri0  id_0,
    input  wand  id_1,
    input  wand  id_2,
    output tri0  id_3,
    input  uwire id_4,
    output tri   id_5,
    output wor   id_6
    , id_11,
    input  wire  id_7,
    output wor   id_8,
    input  tri0  id_9
);
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd6
) (
    output tri1 id_0,
    input uwire id_1,
    input wire id_2,
    output wire id_3,
    output wand id_4,
    input tri0 id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input tri id_9,
    input tri0 id_10,
    input supply1 _id_11,
    input tri0 id_12
);
  assign id_3 = id_12;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_9,
      id_8,
      id_6,
      id_4,
      id_4,
      id_7,
      id_3,
      id_7
  );
  assign modCall_1.id_5 = 0;
  logic [1 : {  id_11  }] id_14;
  ;
  xor primCall (id_0, id_7, id_12, id_1, id_10, id_2, id_9, id_5, id_6);
endmodule
