// Seed: 1515862998
module module_0 (
    output wand id_0,
    input wand id_1,
    output uwire id_2,
    output wand id_3,
    output tri0 id_4,
    output supply1 id_5,
    output wor id_6,
    output tri0 id_7,
    input wire id_8,
    input tri id_9,
    output uwire id_10,
    output uwire id_11,
    output wire id_12,
    output uwire module_0,
    input uwire id_14
);
  logic
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32 = 1,
      id_33;
endmodule
module module_1 #(
    parameter id_6 = 32'd25
) (
    output wand id_0,
    output wire id_1,
    input wand id_2,
    output wand id_3,
    output supply0 id_4,
    output supply1 id_5,
    input wand _id_6,
    input wand id_7,
    input wire id_8,
    output tri id_9,
    output tri id_10,
    input tri0 id_11,
    input tri1 id_12,
    input tri1 id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_5,
      id_12,
      id_5,
      id_9,
      id_4,
      id_9,
      id_5,
      id_4,
      id_11,
      id_2,
      id_10,
      id_9,
      id_3,
      id_1,
      id_11
  );
  assign modCall_1.id_24 = 0;
  wire id_16;
  wire [-1 'b0 !=  id_6 : 1  ==  -1] id_17;
endmodule
