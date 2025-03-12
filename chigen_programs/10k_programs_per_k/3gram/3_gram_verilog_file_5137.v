// Seed: 186716428
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    output supply0 id_5,
    input wand id_6,
    input uwire id_7,
    input supply0 id_8,
    input tri0 id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    output wand id_13,
    input wand id_14,
    input tri0 id_15,
    output tri0 id_16,
    input wand id_17,
    input supply0 id_18,
    input tri id_19,
    input tri id_20,
    input wor id_21,
    input uwire id_22,
    output wor id_23,
    input uwire id_24,
    output uwire id_25,
    input tri id_26,
    input supply1 id_27,
    input tri id_28,
    input tri1 id_29,
    input tri id_30
);
  parameter id_32 = 1;
  assign #id_33 id_23 = id_8;
endmodule
module module_1 #(
    parameter id_0 = 32'd76
) (
    input  wand _id_0,
    input  tri  id_1,
    output tri  id_2,
    input  wire id_3
);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_11 = 0;
  assign id_2 = 1;
  assign id_2 = 1;
  generate
    assign id_2 = id_0;
  endgenerate
  logic [1 : ~  id_0] id_5;
endmodule
