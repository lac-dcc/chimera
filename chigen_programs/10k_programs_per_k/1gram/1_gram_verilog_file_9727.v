// Seed: 856792407
module module_0 (
    input uwire id_0
    , id_32,
    output supply1 void id_1,
    input tri0 id_2,
    output tri0 id_3,
    input supply0 id_4,
    input wand id_5,
    output wire id_6,
    input supply0 id_7,
    output tri1 id_8,
    input wand id_9,
    input uwire id_10,
    input wand id_11,
    input tri id_12,
    input uwire id_13,
    input tri id_14,
    input tri1 id_15,
    output wand id_16,
    output supply1 id_17,
    input uwire id_18,
    input wire id_19,
    output wor id_20,
    input uwire id_21,
    output supply1 id_22,
    input wand id_23
    , id_33,
    output wor id_24,
    output supply0 id_25
    , id_34,
    input uwire id_26,
    input supply0 id_27,
    output tri id_28,
    input supply1 id_29,
    input tri id_30
);
  assign id_32 = ~id_19;
  assign module_1.id_12 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd18,
    parameter id_3 = 32'd21
) (
    input wire id_0,
    output wand _id_1,
    output tri1 id_2,
    output wand _id_3,
    output uwire id_4,
    input tri1 id_5,
    output tri1 id_6,
    input supply1 id_7[id_3 : 1  ==  (  id_1  )],
    output tri id_8,
    input wor id_9,
    input tri1 id_10,
    input wand id_11,
    input wire id_12,
    output tri1 id_13
);
  assign id_2 = 1'b0;
  xnor primCall (id_8, id_12, id_5, id_11, id_9, id_7, id_0, id_10);
  module_0 modCall_1 (
      id_11,
      id_4,
      id_9,
      id_8,
      id_10,
      id_5,
      id_4,
      id_7,
      id_6,
      id_0,
      id_0,
      id_10,
      id_5,
      id_7,
      id_11,
      id_0,
      id_6,
      id_8,
      id_5,
      id_11,
      id_13,
      id_0,
      id_13,
      id_11,
      id_8,
      id_8,
      id_12,
      id_7,
      id_2,
      id_0,
      id_12
  );
  assign id_4 = 1;
endmodule
