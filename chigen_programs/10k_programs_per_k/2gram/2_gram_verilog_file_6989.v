// Seed: 3841463428
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    input wor id_4,
    input uwire id_5,
    output uwire id_6,
    input tri id_7,
    input wor id_8,
    output wand id_9,
    input supply0 id_10,
    input supply0 id_11,
    input supply1 id_12,
    output supply0 id_13,
    input tri0 id_14,
    input tri id_15,
    output supply0 id_16,
    input tri0 id_17,
    output tri id_18,
    input supply1 id_19,
    input tri id_20,
    output tri1 id_21,
    output tri id_22
);
  wire id_24;
endmodule
module module_1 #(
    parameter id_15 = 32'd83,
    parameter id_20 = 32'd73
) (
    input wire id_0,
    input wire id_1,
    input supply1 id_2,
    output uwire id_3
    , id_14,
    input supply0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    input wire id_8,
    output wor id_9,
    output wire id_10,
    input tri id_11#(
        ._id_15(1 | 1),
        .id_16 (1),
        .id_17 (1),
        .id_18 (-1),
        .id_19 (-1),
        ._id_20(1),
        .id_21 (1)
    ),
    output supply0 id_12
);
  wire id_22;
  wire [1 : id_15] id_23;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_8,
      id_0,
      id_2,
      id_12,
      id_2,
      id_0,
      id_10,
      id_4,
      id_4,
      id_2,
      id_10,
      id_0,
      id_7,
      id_12,
      id_7,
      id_12,
      id_8,
      id_8,
      id_3,
      id_9
  );
  assign modCall_1.id_9 = 0;
  logic [(  1  ) : id_20] id_24;
  ;
  assign id_21 = id_19;
endmodule
