// Seed: 3181396645
module module_0 (
    output supply1 id_0,
    input tri1 id_1
);
endmodule
module module_1 #(
    parameter id_2 = 32'd94
) (
    input  wand  id_0,
    output wire  id_1,
    input  tri   _id_2,
    output uwire id_3,
    input  uwire id_4,
    input  tri1  id_5,
    input  wor   id_6
);
  logic [id_2 : -1] id_8;
  module_0 modCall_1 (
      id_1,
      id_6
  );
endmodule
macromodule module_2 (
    output uwire id_0,
    output wor   id_1,
    output tri   id_2,
    input  tri   id_3,
    output tri   id_4,
    input  tri0  id_5,
    input  wire  id_6
);
  module_0 modCall_1 (
      id_0,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
