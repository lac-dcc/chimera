// Seed: 2303915882
module module_0 (
    output tri1 id_0,
    output wor  id_1
    , id_8,
    input  wand id_2,
    input  tri1 id_3,
    input  wand id_4,
    output tri0 id_5,
    input  tri0 id_6
    , id_9
);
  assign id_0 = id_4;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    input  wor   id_2,
    output wor   id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  uwire id_6,
    input  tri   id_7,
    input  wand  id_8,
    input  wire  id_9
);
  assign id_3 = 1;
  wire id_11;
  logic [-1 'b0 : -1  -  1] id_12;
  wire id_13;
  logic [7:0] id_14;
  assign id_14[1] = -1'd0;
  wire id_15;
  ;
  nand primCall (id_0, id_2, id_15, id_4, id_14, id_13, id_5, id_6, id_9, id_1, id_11, id_8, id_12);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_4,
      id_9,
      id_0,
      id_7
  );
endmodule
