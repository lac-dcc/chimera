// Seed: 4224849135
module module_0 (
    output wor id_0
    , id_12, id_13,
    input supply1 id_1,
    input wire id_2,
    input uwire id_3,
    output wor id_4,
    output tri1 id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wor id_8,
    input tri id_9,
    output supply1 id_10
);
  logic id_14;
  ;
  logic [-1 : ""] id_15;
  assign module_1.id_5 = 0;
  assign id_12 = id_13 ? -1 : id_2;
endmodule
module module_1 #(
    parameter id_5 = 32'd79
) (
    input  tri0  id_0,
    input  uwire id_1,
    output wor   id_2,
    input  uwire id_3,
    output wire  id_4,
    output tri   _id_5,
    input  wand  id_6,
    input  tri0  id_7,
    output tri   id_8
);
  logic [-1 : id_5] id_10;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_4,
      id_2,
      id_6,
      id_8,
      id_0,
      id_0,
      id_8
  );
endmodule
