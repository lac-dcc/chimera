// Seed: 540887943
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    input tri1 id_4,
    input tri id_5,
    input uwire id_6,
    input wand id_7,
    output wor id_8,
    input wor id_9,
    input wire id_10
    , id_20,
    input tri0 id_11
    , id_21, id_22,
    input tri id_12,
    input wand id_13,
    output wand id_14,
    input uwire id_15,
    input uwire id_16,
    input wand id_17,
    input tri1 id_18
);
  wire id_23;
  wire id_24;
endmodule
module module_1 #(
    parameter id_3 = 32'd12
) (
    output tri0 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 _id_3,
    output wor id_4,
    output wire id_5,
    output wand id_6,
    output wand id_7,
    output wire id_8,
    output wand id_9,
    output supply1 id_10,
    input wor id_11
);
  wire [id_3 : -1] id_13;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_8,
      id_1,
      id_1,
      id_11,
      id_2,
      id_2,
      id_6,
      id_11,
      id_11,
      id_1,
      id_1,
      id_2,
      id_10,
      id_2,
      id_11,
      id_11,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
