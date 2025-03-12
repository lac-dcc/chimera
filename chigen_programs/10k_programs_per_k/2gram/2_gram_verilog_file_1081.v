// Seed: 147843648
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input wor id_2,
    output tri1 id_3,
    input tri id_4,
    output uwire id_5,
    input tri id_6,
    output supply1 id_7,
    input supply0 id_8,
    output wand id_9,
    output uwire id_10,
    output wand id_11,
    input wand id_12,
    input tri id_13
);
endmodule
module module_1 #(
    parameter id_8 = 32'd79
) (
    input supply1 id_0,
    input tri id_1,
    input wire id_2,
    output tri1 id_3,
    output tri id_4,
    output tri id_5,
    input supply0 id_6,
    input supply0 id_7,
    inout wand _id_8,
    output uwire id_9,
    output supply1 id_10,
    output supply1 id_11,
    output wor id_12,
    output tri0 id_13,
    output wor id_14,
    input wor id_15,
    output tri1 id_16,
    output wire id_17,
    input tri1 id_18
    , id_20
);
  wire id_21;
  assign id_5 = (id_21);
  module_0 modCall_1 (
      id_4,
      id_11,
      id_15,
      id_3,
      id_18,
      id_5,
      id_18,
      id_9,
      id_15,
      id_9,
      id_5,
      id_4,
      id_1,
      id_18
  );
  assign modCall_1.id_7 = 0;
  wire [-1 : id_8] id_22;
  assign id_9 = 1;
  wire id_23, id_24;
  assign id_10 = id_18;
endmodule
