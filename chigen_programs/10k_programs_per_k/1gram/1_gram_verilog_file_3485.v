// Seed: 3029327696
module module_0 (
    input  tri0  id_0,
    output tri   id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  uwire id_4,
    output wire  id_5,
    output tri   id_6,
    output wor   id_7
);
  assign id_1 = 1;
  assign module_1.id_10 = 0;
  assign id_1 = id_4;
  wire [1 : 1 'b0] id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd90,
    parameter id_9  = 32'd99
) (
    input  wand  id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output tri0  id_4,
    input  wor   id_5,
    output uwire id_6,
    output tri0  id_7,
    input  wor   id_8,
    input  tri   _id_9,
    input  tri0  _id_10,
    output tri   id_11
);
  logic [7:0][1 : id_9  -  id_10] id_13, id_14;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_8,
      id_1,
      id_5,
      id_4,
      id_4,
      id_6
  );
endmodule
