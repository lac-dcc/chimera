// Seed: 2420735106
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    input wand id_3,
    input wire id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    output supply1 id_8
);
  assign id_0 = id_4;
endmodule
module module_1 (
    input  wand  id_0,
    output wand  id_1,
    output uwire id_2,
    input  tri0  id_3,
    input  tri0  id_4,
    output tri   id_5,
    input  wor   id_6,
    input  tri   id_7,
    output tri1  id_8
);
  generate
    for (id_10 = 1 ** 1; id_10; id_2 = 1) begin : LABEL_0
      assign id_8 = id_0;
    end
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_6,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
