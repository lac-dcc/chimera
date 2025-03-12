// Seed: 1200310950
module module_0 (
    output supply1 id_0
);
  logic id_2;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input wor id_2,
    output tri id_3,
    input supply0 id_4,
    output tri0 id_5,
    input tri1 id_6,
    input uwire id_7,
    input wand id_8,
    output supply1 id_9,
    output tri id_10,
    output tri1 id_11
);
  wire id_13, id_14, id_15;
  and primCall (id_5, id_14, id_4, id_15, id_7, id_2, id_13, id_1);
  module_0 modCall_1 (id_5);
  assign modCall_1.id_0 = 0;
endmodule
program module_2 #(
    parameter id_0 = 32'd79
) (
    input  tri0 _id_0,
    output wire id_1,
    output wire id_2,
    output wand id_3,
    input  wor  id_4
);
  wire id_6, id_7;
  wire [1  *  -1 : id_0  .  sum] id_8;
  assign id_8 = id_0;
  assign id_3 = -1'b0;
  module_0 modCall_1 (id_1);
  assign id_3 = id_4;
endprogram
