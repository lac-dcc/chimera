// Seed: 1413464422
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input wor id_6,
    input tri id_7,
    input tri0 id_8,
    output supply0 id_9,
    output wire id_10,
    output wor id_11,
    input tri0 id_12,
    input tri id_13,
    output tri id_14,
    output supply0 id_15,
    output uwire id_16,
    output tri id_17,
    output tri0 id_18,
    output wor id_19
);
  logic id_21 = id_8;
  assign id_10 = id_9++;
endmodule
module module_1 #(
    parameter id_3 = 32'd4,
    parameter id_5 = 32'd65,
    parameter id_7 = 32'd86
) (
    output wire id_0,
    output uwire id_1,
    output supply0 id_2,
    input uwire _id_3,
    input tri1 id_4,
    output wand _id_5,
    output tri0 id_6,
    output uwire _id_7
);
  logic [id_5  &  1 : ~  id_7] id_9 = id_4;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_4,
      id_1,
      id_6,
      id_1,
      id_4,
      id_4,
      id_6,
      id_6,
      id_0,
      id_6,
      id_2,
      id_0
  );
  assign modCall_1.id_12 = 0;
  wire [id_3 : 1  ==  -1] id_10;
endmodule
