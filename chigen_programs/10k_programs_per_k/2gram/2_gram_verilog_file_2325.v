// Seed: 3078632405
macromodule module_0 (
    output tri1 id_0,
    output uwire id_1,
    output supply1 id_2,
    input wand id_3,
    input wor id_4
);
endmodule
module module_1 (
    output wor id_0,
    input tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    output tri id_4,
    output wand id_5,
    output supply1 id_6
);
  logic id_8;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_1  = 32'd5,
    parameter id_20 = 32'd21,
    parameter id_22 = 32'd67,
    parameter id_4  = 32'd4
) (
    input wand id_0,
    input tri0 _id_1,
    output tri0 id_2,
    output tri1 id_3,
    input wand _id_4
    , _id_22,
    output wor id_5,
    input tri1 id_6,
    output wand id_7,
    input supply0 id_8,
    input wor id_9,
    output wor id_10,
    input wire id_11,
    input tri1 id_12,
    input tri1 id_13,
    input tri id_14,
    input wand id_15,
    output supply0 id_16,
    output wor id_17,
    output wor id_18,
    input tri0 id_19,
    input supply0 _id_20
);
  bit [1 : id_22  -  id_20  ==  1] id_23;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_10,
      id_9,
      id_0
  );
  assign modCall_1.id_1 = 0;
  always_comb id_23 <= id_9;
  logic [-1  ?  id_4 : id_1 : id_22] id_24;
  ;
  logic id_25;
endmodule
