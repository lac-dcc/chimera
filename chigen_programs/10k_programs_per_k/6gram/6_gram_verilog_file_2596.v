// Seed: 3335180211
module module_0 (
    output tri   id_0,
    input  tri1  id_1,
    output uwire id_2,
    input  uwire id_3,
    output tri   id_4,
    output tri0  id_5,
    output wand  id_6
);
  assign id_5 = id_3 ? -1 : 1;
  uwire id_8 = 1, id_9 = -1'd0, id_10 = id_9, id_11 = 1, id_12 = id_12 - {-1{-1}};
  initial assume (id_11);
endmodule
module module_1 #(
    parameter id_1 = 32'd80,
    parameter id_7 = 32'd38
) (
    output uwire id_0,
    input  tri0  _id_1,
    input  wor   id_2,
    output tri0  id_3,
    output wire  id_4
);
  localparam id_6 = -1 === -1;
  wire _id_7;
  wire [~  {  id_1  +  id_7  ,  1  !=  id_7  ,  id_7  } : id_7] id_8;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_4 = 0;
  assign id_4 = -1'b0;
endmodule
