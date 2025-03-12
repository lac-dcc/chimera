// Seed: 568793578
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output supply1 id_2,
    output wand id_3,
    output tri1 id_4,
    input wand id_5,
    output uwire id_6,
    input tri1 id_7,
    output supply0 id_8,
    output tri0 id_9
    , id_17, id_18,
    input wand id_10,
    output wire id_11,
    input tri0 id_12
    , id_19,
    input wor id_13,
    input tri1 id_14,
    output tri0 id_15
);
  assign id_19[1] = 1;
  logic [-1 : (  -1  )] id_20, id_21;
endmodule
macromodule module_1 #(
    parameter id_5 = 32'd25
) (
    input  wor  id_0,
    input  tri  id_1,
    input  wire id_2,
    output tri1 id_3,
    output tri1 id_4,
    input  wand _id_5,
    output tri  id_6
);
  supply0 [1 : id_5] id_8 = -1;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_3,
      id_6,
      id_0,
      id_6,
      id_1,
      id_6,
      id_6,
      id_0,
      id_4,
      id_2,
      id_0,
      id_1,
      id_6
  );
  assign modCall_1.id_11 = 0;
  wire id_9 = id_5;
  tri  id_10 = id_5 & 1;
endmodule
