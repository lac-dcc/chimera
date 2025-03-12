// Seed: 708349407
module module_0 (
    input tri id_0,
    input wand id_1,
    input uwire id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input tri0 id_6,
    input supply0 id_7,
    output supply0 id_8,
    output tri id_9,
    output wor id_10,
    input supply1 id_11,
    output supply1 id_12,
    input wire id_13,
    output tri1 id_14,
    input tri0 id_15
    , id_22,
    output wand id_16,
    output supply0 id_17,
    output tri id_18,
    input wand id_19,
    input tri1 id_20
);
  wire id_23, id_24, id_25, id_26, id_27, id_28, id_29, id_30, id_31, id_32, id_33, id_34, id_35;
endmodule
module module_1 #(
    parameter id_3 = 32'd33,
    parameter id_7 = 32'd48
) (
    input tri1 id_0,
    input wor id_1,
    output supply1 id_2,
    output uwire _id_3,
    input tri1 id_4,
    input uwire id_5,
    output tri1 id_6,
    output tri _id_7,
    input wor id_8,
    output tri1 id_9
);
  union packed {
    logic [id_3 : -1] id_11;
    logic [( "" ) : id_7] id_12;
  } [id_3 : id_3] id_13;
  ;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_9,
      id_8,
      id_1,
      id_8,
      id_8,
      id_9,
      id_2,
      id_9,
      id_8,
      id_9,
      id_0,
      id_2,
      id_5,
      id_6,
      id_6,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
