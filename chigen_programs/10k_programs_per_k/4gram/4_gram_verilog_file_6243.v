// Seed: 1061197450
module module_0 (
    output wor   id_0,
    input  uwire id_1,
    output wire  id_2,
    output tri   id_3,
    input  tri   id_4,
    input  wand  id_5,
    input  wire  id_6,
    input  wor   id_7,
    output tri   id_8
);
  assign id_8 = |id_4 ? 1 : id_7;
  assign module_1.id_2 = 0;
endmodule
module module_0 #(
    parameter id_17 = 32'd94
) (
    output tri id_0,
    input supply0 id_1,
    output tri id_2,
    output wor id_3,
    output uwire id_4,
    input wor id_5,
    output uwire id_6,
    input uwire id_7,
    input wand id_8,
    input supply0 id_9,
    output supply0 id_10,
    input supply1 module_1,
    output supply0 id_12,
    input tri0 id_13,
    output tri id_14,
    input supply0 id_15,
    input tri0 id_16,
    input uwire _id_17,
    output tri id_18
);
  localparam id_20 = 1, id_21 = -1, id_22 = id_16, id_23 = 1'b0;
  wire [1  &&  id_17 : 1  ===  -1 'd0] id_24;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_4,
      id_4,
      id_9,
      id_5,
      id_7,
      id_13,
      id_2
  );
endmodule
