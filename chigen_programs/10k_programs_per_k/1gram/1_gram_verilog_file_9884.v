// Seed: 11169733
module module_0 #(
    parameter id_20 = 32'd29,
    parameter id_22 = 32'd13
) (
    input tri0 id_0,
    output wire id_1,
    input wire id_2,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    input wor id_6,
    input tri0 id_7
    , id_15#(
        .id_16 (-1'h0),
        .id_17 (1),
        .id_18 (1),
        .id_19 (-1),
        ._id_20(1),
        .id_21 (1),
        ._id_22(-1),
        .id_23 (1),
        .id_24 (-1),
        .id_25 (1)
    ),
    output supply1 id_8,
    input wor id_9,
    output supply1 id_10,
    output wand id_11,
    output wor id_12,
    output wor id_13
);
  wire [id_22 : id_20] id_26;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input uwire id_2,
    input wor id_3,
    output wor id_4,
    input uwire id_5,
    input uwire id_6,
    input tri id_7,
    input supply0 id_8
    , id_21,
    input tri id_9,
    input tri id_10,
    input supply1 id_11,
    output wire id_12,
    input wire id_13,
    input tri1 id_14,
    output supply1 id_15,
    input tri1 id_16,
    input tri id_17,
    input wand id_18[1 : 1],
    output wire id_19
);
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_8,
      id_3,
      id_3,
      id_14,
      id_18,
      id_15,
      id_16,
      id_12,
      id_12,
      id_4,
      id_4
  );
  assign modCall_1.id_22 = 0;
  assign id_12 = id_2;
endmodule
