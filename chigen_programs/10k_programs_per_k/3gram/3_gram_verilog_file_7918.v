// Seed: 2937299577
module module_0 #(
    parameter id_19 = 32'd88
) (
    input tri id_0,
    input supply0 id_1,
    output tri id_2,
    output tri0 id_3#(
        .id_16 (1),
        .id_17 (1),
        .id_18 (1),
        ._id_19(1),
        .id_20 (""),
        .id_21 (-1),
        .id_22 (-1),
        .id_23 (1),
        .id_24 (1)
    ),
    output uwire id_4,
    output wor id_5,
    output tri0 id_6,
    output supply1 id_7,
    output supply0 id_8,
    input wire id_9,
    output wire id_10,
    input uwire id_11,
    output supply0 id_12,
    output wand id_13,
    input tri0 id_14
);
  wire id_25;
  wire [-1 : id_19] id_26;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    input tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply0 id_8,
    output tri0 id_9,
    input uwire id_10,
    output wire id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_11,
      id_11,
      id_9,
      id_9,
      id_9,
      id_11,
      id_8,
      id_1,
      id_0,
      id_9,
      id_9,
      id_8
  );
  assign modCall_1.id_5 = 0;
endmodule
