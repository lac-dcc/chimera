// Seed: 2692744826
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output tri id_4,
    input wire id_5["" : 1],
    input wand id_6
);
  parameter id_8 = -1'b0;
  assign {-1'd0, id_0} = id_0 == id_6;
  logic id_9;
  logic id_10;
endmodule
module module_1 #(
    parameter id_10 = 32'd99,
    parameter id_8  = 32'd72
) (
    input  tri0  id_0,
    output tri0  id_1,
    input  wor   id_2,
    output tri1  id_3,
    output wand  id_4,
    input  uwire id_5,
    input  tri0  id_6,
    input  tri0  id_7,
    input  wor   _id_8,
    output tri   id_9  [id_10 : 1  ?  1 'h0 : id_8],
    input  tri0  _id_10
);
  assign id_9 = -1 || id_0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
