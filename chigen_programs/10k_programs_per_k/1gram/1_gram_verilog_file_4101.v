// Seed: 2358379685
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output wor id_3,
    output tri id_4,
    output tri id_5,
    output tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    input tri1 id_9,
    output tri0 id_10,
    input tri0 id_11,
    output supply0 id_12,
    input wire id_13
    , id_20,
    output wor id_14,
    input tri0 id_15
    , id_21,
    input tri id_16,
    input wor id_17,
    output wire id_18
);
  logic id_22;
  assign id_12 = -1;
  wire id_23;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd3
) (
    output wor   id_0 [id_5 : -1],
    output tri   id_1,
    input  wor   id_2,
    output uwire id_3,
    input  wire  id_4,
    input  tri   _id_5,
    input  tri   id_6,
    output uwire id_7,
    output tri0  id_8
);
  logic id_10;
  ;
  nand primCall (id_8, id_4, id_2, id_10, id_6);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_8,
      id_3,
      id_8,
      id_7,
      id_6,
      id_2,
      id_6,
      id_8,
      id_4,
      id_7,
      id_6,
      id_1,
      id_6,
      id_6,
      id_6,
      id_8
  );
endmodule
