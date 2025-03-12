// Seed: 224307769
module module_0 (
    input wire id_0,
    input uwire id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri1 id_4,
    output supply1 id_5
);
  integer id_7;
endmodule
module module_1 #(
    parameter id_0 = 32'd26
) (
    input tri _id_0
    , id_22, id_23,
    input wire id_1,
    input wor id_2,
    output tri1 id_3,
    output supply1 id_4,
    output wor id_5,
    input tri0 id_6,
    output wor id_7,
    input wor id_8,
    output wire id_9,
    input wor id_10,
    input wire id_11,
    input wor id_12,
    input supply0 id_13,
    input wand id_14,
    input wire id_15,
    input wor id_16,
    input supply1 id_17,
    output supply1 id_18,
    input wor id_19,
    output supply0 id_20
);
  logic [-1 : id_0] id_24;
  ;
  xor primCall (
      id_20,
      id_13,
      id_12,
      id_15,
      id_6,
      id_2,
      id_16,
      id_24,
      id_14,
      id_23,
      id_17,
      id_19,
      id_10,
      id_11,
      id_22,
      id_8
  );
  module_0 modCall_1 (
      id_1,
      id_12,
      id_2,
      id_11,
      id_12,
      id_20
  );
  assign modCall_1.id_3 = 0;
endmodule
