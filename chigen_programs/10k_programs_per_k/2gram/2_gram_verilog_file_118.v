// Seed: 719142805
module module_0 #(
    parameter id_26 = 32'd53,
    parameter id_27 = 32'd26
) (
    output supply0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wor id_3,
    output uwire id_4,
    input tri0 id_5#(
        .id_22 (1),
        .id_23 (-1),
        .id_24 (-1),
        .id_25 ((1)),
        ._id_26(1)
    ),
    input tri id_6,
    output wand id_7,
    output wire id_8,
    input uwire id_9,
    output tri1 id_10,
    input tri id_11,
    input wand id_12,
    input tri0 id_13,
    input supply1 id_14,
    output wand id_15,
    output wire id_16,
    input tri id_17,
    output wire id_18
    , _id_27,
    output wire id_19
    , id_28,
    input supply1 id_20
);
  assign module_1.id_9 = 0;
  assign id_4 = 1 | -1 - 1'h0;
  generate
    logic [id_26 : id_27] id_29;
    ;
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri0 id_3,
    output wand id_4,
    input wor id_5,
    input supply1 id_6,
    output tri0 id_7,
    input uwire id_8,
    output uwire id_9,
    input wor id_10
);
  module_0 modCall_1 (
      id_9,
      id_3,
      id_7,
      id_9,
      id_7,
      id_1,
      id_10,
      id_9,
      id_9,
      id_10,
      id_9,
      id_8,
      id_6,
      id_3,
      id_8,
      id_9,
      id_7,
      id_3,
      id_4,
      id_7,
      id_10
  );
endmodule
