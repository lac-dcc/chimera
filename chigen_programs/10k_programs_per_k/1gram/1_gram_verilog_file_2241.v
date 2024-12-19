// Seed: 854881948
module module_0 (
    output wor id_0,
    output tri0 id_1,
    output supply1 id_2,
    output wand id_3,
    input tri0 id_4,
    input wire id_5#(
        .id_12(1'b0),
        .id_13(1),
        .id_14(1),
        .id_15(1),
        .id_16(id_14)
    ),
    output wand id_6,
    input tri0 id_7,
    input tri1 id_8,
    output uwire id_9,
    output tri id_10
);
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    output uwire id_2,
    output uwire id_3,
    input wor id_4,
    input wor id_5,
    input wand id_6,
    input supply1 id_7,
    output supply1 id_8,
    input tri id_9,
    input wor id_10,
    output wor id_11,
    output uwire id_12,
    input wire id_13,
    input tri id_14,
    input tri id_15,
    output wand id_16,
    input wire id_17,
    input tri1 id_18,
    output wor id_19,
    output supply1 id_20
);
  wire id_22;
  module_0 modCall_1 (
      id_2,
      id_16,
      id_2,
      id_19,
      id_9,
      id_5,
      id_0,
      id_10,
      id_17,
      id_11,
      id_16
  );
  assign modCall_1.id_5 = 0;
  wire id_23, id_24;
  xor primCall (id_16, id_5, id_10, id_17, id_13, id_1, id_15, id_7, id_18, id_22, id_14, id_6);
endmodule
