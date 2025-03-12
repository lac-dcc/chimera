// Seed: 4007706210
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    output wor   id_2,
    output uwire id_3,
    output wor   id_4,
    input  tri   id_5
);
  generate
    for (id_7 = 1; 1; id_7 = id_7 ==? id_5 | !id_1 + (1)) begin : LABEL_0
      logic id_8 = id_5;
    end
  endgenerate
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd99
) (
    output tri0  id_0,
    input  uwire _id_1,
    input  tri   id_2,
    output wor   id_3
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_2
  );
  wire [-1 : id_1] id_5;
endmodule
