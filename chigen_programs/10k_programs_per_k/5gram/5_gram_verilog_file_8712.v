// Seed: 2826803129
module module_0 (
    input tri1 id_0,
    input wor id_1,
    output wand id_2,
    input uwire id_3,
    input tri1 id_4,
    input supply1 id_5
);
  generate
    always begin : LABEL_0
      id_2 = 1 == id_4;
    end
  endgenerate
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    input  tri   id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  uwire id_4,
    output wand  id_5,
    output tri0  id_6
);
  wire id_8;
  id_9(
      .id_0(id_2), .id_1(1'd0)
  );
  nand primCall (id_5, id_9, id_1, id_4, id_0, id_2, id_8);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_3,
      id_3
  );
endmodule
