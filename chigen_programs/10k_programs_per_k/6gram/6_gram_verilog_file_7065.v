// Seed: 2760866267
module module_0 (
    output tri  id_0,
    input  wor  id_1,
    input  tri1 id_2,
    input  wand id_3,
    output wor  id_4
);
  assign id_0 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output supply1 id_2,
    input uwire id_3,
    output supply1 id_4,
    input supply1 id_5,
    output wand id_6,
    output supply1 id_7,
    output tri1 id_8
);
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd54
) (
    input  wor   id_0,
    input  wire  _id_1,
    input  wor   id_2,
    output wor   id_3,
    output tri0  id_4,
    input  tri   id_5,
    input  wand  id_6
    , id_10,
    input  wand  id_7,
    input  uwire id_8
);
  logic id_11 = -1'd0;
  logic [-1  *  -1  -  -1 : 1  ==  id_1] id_12;
  assign id_10 = id_5 - id_7;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_8,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
