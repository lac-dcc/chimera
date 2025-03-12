// Seed: 835025088
module module_0 (
    input  wand  id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  wor   id_5,
    output tri0  id_6
);
  logic [1 'd0 : 1] id_8;
endmodule
module module_1 #(
    parameter id_8 = 32'd26
) (
    output tri   id_0,
    input  uwire id_1,
    input  uwire id_2,
    output wor   id_3,
    input  wor   id_4,
    inout  uwire id_5,
    input  wand  id_6,
    input  wire  id_7,
    input  wor   _id_8
);
  always @(id_5 or negedge id_4);
  wire [-1 : id_8] id_10;
  assign id_3 = id_4;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_7,
      id_4,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
  assign id_5 = 1;
  wire id_11;
endmodule
