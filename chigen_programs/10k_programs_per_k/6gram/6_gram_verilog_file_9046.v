// Seed: 943474117
module module_0 (
    input  wand  id_0,
    output tri0  id_1,
    output tri1  id_2,
    input  tri0  id_3,
    output wor   id_4,
    input  uwire id_5,
    output wand  id_6
);
  generate
    if (1 && id_5 == id_3) begin : LABEL_0
      tri0 id_8 = 1 - 1;
      assign id_8 = 1 ? id_8 : 1'b0 ? id_3 : id_0;
    end
  endgenerate
endmodule
module module_0 (
    input  wire  module_1,
    output uwire id_1,
    input  tri   id_2,
    input  wand  id_3,
    input  tri0  id_4,
    input  wand  id_5,
    input  tri1  id_6,
    output wand  id_7,
    output wor   id_8
    , id_12,
    input  uwire id_9,
    output tri0  id_10
);
  assign id_10 = 1;
  assign id_12 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7,
      id_2,
      id_8
  );
  assign modCall_1.type_11 = 0;
endmodule
