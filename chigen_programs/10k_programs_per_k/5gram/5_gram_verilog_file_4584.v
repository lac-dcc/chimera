// Seed: 3719171646
module module_0 (
    output tri1 id_0,
    output wire id_1,
    input tri id_2,
    output tri0 id_3,
    input supply1 id_4,
    output tri id_5,
    input uwire id_6,
    input wor id_7,
    output uwire id_8,
    input wor id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri0 id_12,
    input tri1 id_13,
    input wor id_14,
    input supply1 id_15,
    input supply0 id_16,
    input wand id_17,
    output tri id_18,
    output tri id_19,
    output wor id_20,
    input wand id_21,
    input uwire id_22,
    input wand id_23,
    output wand id_24,
    input wor id_25,
    output wor id_26,
    input supply1 id_27,
    output wire id_28,
    output supply0 id_29,
    output wire id_30,
    output tri id_31,
    output tri id_32
    , id_34
);
  wire id_35;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd16,
    parameter id_8 = 32'd52
) (
    input wor _id_0,
    output tri1 id_1,
    output wire id_2,
    input wor id_3
    , id_11,
    input supply1 id_4,
    output wire id_5,
    output wor id_6,
    output uwire id_7
    , id_12,
    input tri0 _id_8,
    output supply1 id_9
);
  reg [-1  ==  id_8 : 1] id_13;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_4,
      id_9,
      id_3,
      id_5,
      id_3,
      id_3,
      id_2,
      id_4,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_4,
      id_1,
      id_2,
      id_1,
      id_4,
      id_3,
      id_3,
      id_5,
      id_4,
      id_1,
      id_4,
      id_2,
      id_1,
      id_2,
      id_1,
      id_5
  );
  wire id_14;
  always_latch @(posedge id_12[id_0]) begin : LABEL_0
    if (1) id_13 = 1;
  end
endmodule
