// Seed: 1818913627
module module_0 (
    input uwire id_0,
    input wor id_1,
    input supply0 id_2,
    output tri1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    output uwire id_7,
    input wor id_8,
    input tri1 id_9,
    input tri1 id_10,
    input wand id_11,
    output uwire id_12
);
  wire [-1 'h0 : -1] id_14;
  logic id_15;
endmodule
module module_1 #(
    parameter id_0 = 32'd98,
    parameter id_4 = 32'd36
) (
    input  tri   _id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    output wor   id_3,
    input  tri   _id_4,
    input  tri   id_5,
    output uwire id_6
);
  logic [-1 : id_4  ==  id_0] id_8;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_6,
      id_1,
      id_5,
      id_5,
      id_6,
      id_5,
      id_2,
      id_5,
      id_2,
      id_3
  );
  assign modCall_1.type_18 = 0;
endmodule
