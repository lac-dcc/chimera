// Seed: 2772367618
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wand id_4,
    input uwire id_5,
    output supply0 id_6
    , id_28,
    input supply1 id_7,
    output tri0 id_8,
    output uwire id_9,
    input wand id_10,
    output wor id_11,
    input tri0 id_12,
    input wand id_13,
    output wand id_14,
    input supply1 id_15,
    input tri id_16,
    input wand id_17,
    input supply1 id_18,
    output supply0 id_19,
    input tri1 id_20,
    input supply0 id_21,
    input tri id_22,
    output wire id_23,
    output tri1 id_24,
    input tri id_25,
    output supply0 id_26
);
  always disable id_29;
endmodule
module module_1 #(
    parameter id_0 = 32'd47,
    parameter id_1 = 32'd29,
    parameter id_3 = 32'd2
) (
    input tri0 _id_0,
    output supply1 _id_1,
    input uwire id_2,
    output wand _id_3,
    input wor id_4,
    output tri1 id_5
);
  wire id_7[id_1  -  id_0 : id_3];
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_2,
      id_2,
      id_2,
      id_4,
      id_5,
      id_2,
      id_4,
      id_2,
      id_5,
      id_5,
      id_4,
      id_5
  );
  assign id_5 = 1;
  wire id_8;
  xnor primCall (id_5, id_4, id_2);
  wire [1 : -1] id_9, id_10, id_11;
endmodule
