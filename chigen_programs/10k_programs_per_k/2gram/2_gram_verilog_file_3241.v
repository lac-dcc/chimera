// Seed: 2580041708
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input tri id_2,
    input uwire id_3,
    input tri0 id_4,
    output wor id_5,
    input tri0 id_6,
    input uwire id_7,
    output tri0 id_8,
    output wire id_9,
    output supply0 id_10,
    output uwire id_11,
    input wand id_12,
    input supply0 id_13,
    output tri1 id_14,
    input tri id_15
);
  assign id_5 = -1'b0;
endmodule
module module_1 #(
    parameter id_12 = 32'd37,
    parameter id_2  = 32'd35,
    parameter id_3  = 32'd93
) (
    input wand id_0,
    output uwire id_1,
    input tri0 _id_2,
    input supply1 _id_3,
    input wand id_4,
    input tri id_5,
    output tri0 id_6,
    output wire id_7,
    input wor id_8,
    input wor id_9,
    input tri1 id_10,
    input tri0 id_11,
    output supply1 _id_12
);
  assign id_7 = id_10;
  module_0 modCall_1 (
      id_10,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_10,
      id_10,
      id_1,
      id_1,
      id_1,
      id_7,
      id_11,
      id_11,
      id_6,
      id_4
  );
  assign modCall_1.id_9 = 0;
  logic [{  id_3  { "" }  } : id_2  ==  id_12] id_14;
endmodule
