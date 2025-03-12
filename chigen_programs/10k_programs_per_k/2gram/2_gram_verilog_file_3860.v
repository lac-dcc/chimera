// Seed: 2314487786
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri id_2,
    input supply1 id_3,
    input tri0 id_4,
    output supply0 id_5,
    input uwire id_6,
    input uwire id_7,
    output supply0 id_8,
    input uwire id_9,
    output tri0 id_10,
    input wand id_11,
    input wire id_12,
    output wire id_13,
    output wand id_14,
    output wor id_15,
    output wire id_16,
    output wor id_17,
    input supply1 id_18,
    output supply1 id_19,
    output supply1 id_20,
    output tri1 id_21,
    output tri id_22,
    input uwire id_23,
    input supply1 id_24
);
  assign id_5 = -1 == id_4;
  wire id_26;
  ;
endmodule
module module_1 #(
    parameter id_9 = 32'd83
) (
    input uwire id_0,
    input tri id_1,
    input wand id_2,
    output tri id_3,
    input wand id_4,
    input wor id_5,
    output wand id_6
    , id_12,
    input uwire id_7,
    input supply1 id_8,
    input tri _id_9,
    output wire id_10
);
  logic id_13;
  assign id_12[!id_9] = id_12;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_7,
      id_4,
      id_5,
      id_6,
      id_4,
      id_8,
      id_10,
      id_0,
      id_10,
      id_1,
      id_4,
      id_6,
      id_10,
      id_6,
      id_10,
      id_6,
      id_7,
      id_10,
      id_10,
      id_6,
      id_3,
      id_1,
      id_7
  );
  assign modCall_1.id_12 = 0;
endmodule
