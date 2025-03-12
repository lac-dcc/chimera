// Seed: 2754766829
module module_0 (
    input wire id_0,
    input supply0 id_1,
    output wire id_2,
    input tri1 id_3,
    output supply1 id_4
    , id_19,
    input supply0 id_5,
    output tri id_6,
    input wor id_7,
    output tri id_8,
    input supply1 id_9,
    input wand id_10,
    input wor id_11,
    input supply0 id_12,
    output uwire id_13,
    input supply0 id_14,
    output supply1 id_15,
    input supply1 id_16,
    output wire id_17
);
  logic id_20;
  assign id_15 = id_9;
  assign id_8  = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd3,
    parameter id_5 = 32'd94
) (
    input  wire  id_0,
    input  tri1  id_1,
    input  uwire _id_2,
    output tri1  id_3
);
  genvar _id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3,
      id_0,
      id_3,
      id_1,
      id_1,
      id_0,
      id_0,
      id_3,
      id_1,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_17 = 0;
  assign id_3 = -1;
  wire [(  id_5  ===  1  ) : id_2] id_6, id_7, id_8, id_9, id_10, id_11, id_12;
endmodule
