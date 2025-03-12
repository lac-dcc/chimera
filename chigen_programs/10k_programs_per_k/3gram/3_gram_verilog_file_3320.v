// Seed: 2003732240
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output tri id_2,
    output wire id_3,
    input wire id_4,
    input supply1 id_5,
    input tri id_6,
    output tri id_7,
    input wand id_8,
    input supply0 id_9,
    output wand id_10,
    output wor id_11,
    output wire id_12,
    input tri1 id_13
    , id_31,
    output wire id_14,
    input tri0 id_15,
    input supply1 id_16,
    input supply0 id_17,
    input supply0 id_18,
    input uwire id_19,
    input uwire id_20,
    input uwire id_21,
    input wor id_22,
    output wor id_23
    , id_32,
    output uwire id_24,
    output uwire id_25,
    input tri id_26,
    input wand id_27,
    output wire id_28,
    output wor id_29
);
  logic id_33;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd35
) (
    output tri1 id_0,
    input wor id_1,
    output tri0 _id_2,
    output supply1 id_3,
    input wand id_4
);
  logic [id_2  |  -1 : 1  /  1] id_6;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_0,
      id_4,
      id_1,
      id_4,
      id_0,
      id_4,
      id_1,
      id_3,
      id_3,
      id_0,
      id_4,
      id_0,
      id_1,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_0,
      id_3,
      id_3,
      id_4,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
