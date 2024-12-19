// Seed: 3333311885
module module_0 (
    input  wire  id_0,
    input  wor   id_1,
    output wor   id_2,
    input  tri0  id_3,
    output tri   id_4,
    input  wand  id_5,
    input  wand  module_0,
    output uwire id_7
);
  initial begin : LABEL_0
    id_7 += 1'b0;
    id_7 += id_5;
  end
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    output tri   id_2,
    input  wor   id_3,
    input  wor   id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  tri0  id_7,
    output tri   id_8,
    input  wand  id_9,
    input  wire  id_10,
    output tri1  id_11,
    input  tri0  id_12,
    input  wire  id_13,
    input  tri   id_14,
    output tri0  id_15,
    output tri   id_16
    , id_18
);
  and primCall (id_1, id_12, id_3, id_4, id_0, id_9, id_6);
  module_0 modCall_1 (
      id_4,
      id_9,
      id_8,
      id_4,
      id_2,
      id_13,
      id_4,
      id_1
  );
  assign modCall_1.type_0 = 0;
endmodule
