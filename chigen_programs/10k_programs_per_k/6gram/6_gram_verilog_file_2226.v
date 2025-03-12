// Seed: 1892167625
module module_0 (
    input  tri0  id_0,
    output tri1  id_1,
    input  tri0  id_2,
    output wire  id_3,
    input  tri0  id_4,
    input  uwire id_5,
    output tri0  id_6,
    input  tri   id_7,
    input  uwire id_8,
    output uwire id_9,
    input  wire  id_10,
    input  uwire id_11,
    input  uwire id_12,
    output wor   id_13,
    input  tri0  id_14,
    input  wor   id_15,
    output uwire id_16
);
  wire id_18;
  ;
endmodule
module module_1 #(
    parameter id_8 = 32'd18
) (
    output wire id_0,
    input  wand id_1,
    output tri0 id_2
);
  wire [-1 'd0 : 1] id_4;
  wire id_5, id_6, id_7, _id_8, id_9, id_10, id_11, id_12, id_13;
  wire id_14;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_10 = 0;
  logic [(  1 'b0 ) : id_8] id_15;
  ;
endmodule
