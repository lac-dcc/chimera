// Seed: 1109321445
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  wand  id_3,
    output tri0  id_4,
    output wand  id_5,
    input  wire  id_6
);
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    input  tri  id_0,
    output wor  id_1,
    input  tri0 id_2,
    output tri0 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_0 = 32'd67
) (
    output tri1  _id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output wor   id_3,
    input  tri0  id_4
);
  logic [1  &  id_0 : ! ""] id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_1
  );
endmodule
