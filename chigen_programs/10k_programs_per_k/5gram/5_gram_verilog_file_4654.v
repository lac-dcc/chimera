// Seed: 3396493836
module module_0 (
    input uwire id_0,
    input wand id_1,
    output wor id_2,
    output tri0 id_3,
    output tri1 id_4,
    output wire id_5,
    input supply0 id_6,
    input wand id_7,
    output tri1 id_8,
    output supply1 id_9,
    output supply0 id_10,
    input tri0 id_11,
    input uwire id_12,
    output tri1 id_13,
    output uwire id_14,
    input tri1 id_15,
    output uwire id_16,
    output tri0 id_17,
    input tri0 id_18,
    input wire id_19,
    input uwire id_20,
    input tri1 id_21,
    output uwire id_22,
    output wand id_23,
    input tri0 id_24,
    input tri id_25,
    output wire id_26,
    output supply1 id_27,
    output tri1 id_28,
    input tri id_29
);
  assign id_8 = id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd9
) (
    input tri id_0,
    input wire id_1,
    output wire id_2,
    input wand id_3,
    input wor _id_4,
    output tri0 id_5,
    input supply1 id_6,
    output tri1 id_7,
    output supply0 id_8,
    output tri id_9
);
  logic [1 : id_4] id_11;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_9,
      id_5,
      id_8,
      id_1,
      id_1,
      id_8,
      id_9,
      id_8,
      id_0,
      id_6,
      id_2,
      id_9,
      id_3,
      id_8,
      id_2,
      id_3,
      id_1,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_3,
      id_5,
      id_8,
      id_2,
      id_6
  );
  assign modCall_1.id_5 = 0;
  wire id_12;
  assign id_11[-1] = id_6 & -1'b0;
endmodule
