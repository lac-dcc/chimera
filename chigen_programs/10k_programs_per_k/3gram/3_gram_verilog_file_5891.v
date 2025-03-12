// Seed: 3536739870
module module_0 (
    output wor id_0,
    output tri id_1,
    output supply1 id_2,
    input uwire id_3,
    output supply0 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input wor id_7,
    output supply1 id_8
);
  parameter id_10 = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd13
) (
    input  wand  id_0,
    output tri0  id_1,
    output tri0  id_2,
    input  tri0  id_3,
    input  wor   id_4,
    input  wand  id_5,
    input  uwire id_6,
    input  wire  _id_7
);
  wire id_9;
  logic [7:0] id_10;
  wire id_11;
  parameter id_12 = 1;
  assign id_10[id_7 : 1] = id_9;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_5,
      id_2,
      id_1,
      id_6,
      id_6,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
