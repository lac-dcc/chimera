// Seed: 814214463
module module_0 (
    output uwire id_0,
    output tri1  id_1,
    output wor   id_2,
    output wand  id_3,
    input  tri0  id_4,
    input  tri   id_5
);
  assign id_0 = 1'd0;
endmodule
module module_1 #(
    parameter id_1 = 32'd48
) (
    output wor   id_0,
    output uwire _id_1,
    input  wand  id_2,
    input  wand  id_3,
    output wire  id_4,
    output wand  id_5,
    input  wire  id_6
);
  logic [1 : 'b0 &  id_1] id_8;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_0,
      id_6,
      id_3
  );
  assign modCall_1.id_5 = 0;
  logic [id_1 : -1] id_9 = id_6;
endmodule
