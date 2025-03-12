// Seed: 2846060773
module module_0 #(
    parameter id_16 = 32'd67
) (
    output tri id_0,
    output tri id_1,
    input supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    output supply1 id_7,
    output wire id_8,
    input wire id_9,
    output tri1 id_10,
    input supply1 id_11#(
        .id_14 (-1),
        .id_15 (1'h0),
        ._id_16(1),
        .id_17 ({1, 1}),
        .id_18 (1)
    ),
    input tri1 id_12
);
  wire id_19;
  ;
  assign id_10 = -1 || ~id_17 / id_17[id_16] ? -1 : id_19;
  wire id_20;
endmodule
module module_1 #(
    parameter id_4 = 32'd67
) (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    output uwire id_3,
    input tri _id_4,
    input wor id_5,
    input supply1 id_6,
    output wand id_7,
    input wire id_8,
    input wor id_9,
    output tri0 id_10,
    input supply1 id_11,
    output tri1 id_12
);
  assign id_10 = 1;
  wire [id_4 : -1] id_14;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_8,
      id_5,
      id_11,
      id_9,
      id_9,
      id_12,
      id_10,
      id_8,
      id_10,
      id_1,
      id_6
  );
  assign modCall_1.id_11 = 0;
endmodule
