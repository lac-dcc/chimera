// Seed: 1560430839
module module_0 (
    input wand id_0
    , id_16,
    input supply1 id_1,
    output tri1 id_2,
    input tri id_3,
    input tri0 id_4,
    input uwire id_5,
    output wor id_6,
    output tri1 id_7,
    output tri id_8,
    input wire id_9,
    input supply1 id_10,
    output supply0 id_11,
    output supply1 id_12,
    input supply1 id_13,
    input wire id_14
);
  wire id_17;
endmodule
module module_1 #(
    parameter id_0 = 32'd93,
    parameter id_1 = 32'd90
) (
    output uwire _id_0,
    input  tri0  _id_1,
    output wand  id_2,
    output wand  id_3,
    input  uwire id_4,
    output wire  id_5
);
  logic [id_0 : id_1] id_7;
  nand primCall (id_5, id_4, id_7);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2,
      id_5,
      id_4,
      id_4,
      id_3,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.id_14 = 0;
  logic id_8;
endmodule
