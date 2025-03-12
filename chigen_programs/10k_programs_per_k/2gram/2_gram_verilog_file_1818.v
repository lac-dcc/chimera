// Seed: 2072724931
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input uwire id_2,
    output supply1 id_3,
    output tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    output wand id_7,
    output tri0 id_8,
    input tri1 id_9,
    input wor id_10,
    input tri id_11,
    input tri1 id_12,
    output tri0 id_13,
    input wor id_14,
    output wor id_15,
    output supply1 id_16,
    input tri0 id_17,
    input tri id_18,
    input wor id_19,
    output wand id_20,
    input tri0 id_21,
    input tri id_22,
    input tri0 id_23,
    input tri1 id_24
);
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd14,
    parameter id_6 = 32'd68,
    parameter id_8 = 32'd5
) (
    input wor id_0,
    output wor id_1,
    output supply0 id_2,
    input wire id_3,
    input supply0 id_4,
    input supply1 _id_5,
    input supply1 _id_6
);
  wire [1 'b0 : id_6] _id_8;
  assign id_8 = id_5;
  wire [-1 : id_5] id_9;
  wire [ 1 : id_8] id_10;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_4,
      id_1,
      id_2,
      id_3,
      id_4,
      id_2,
      id_2,
      id_0,
      id_0,
      id_4,
      id_4,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_4,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_22 = 0;
endmodule
