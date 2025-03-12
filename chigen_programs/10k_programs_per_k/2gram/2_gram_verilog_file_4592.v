// Seed: 3563301006
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input supply0 id_2,
    input uwire id_3,
    output uwire id_4,
    input tri id_5,
    output uwire id_6,
    output wire id_7,
    input tri1 id_8,
    output supply1 id_9,
    output tri1 id_10,
    input tri id_11,
    output wand id_12,
    input supply0 id_13#(
        .id_17(1),
        .id_18(1 * 1),
        .id_19(1),
        .id_20(1 ? -1 : -1),
        .id_21(1)
    ),
    input tri id_14,
    input wand id_15
);
  assign id_7 = id_0;
  wire id_22;
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd61
) (
    input wand id_0,
    input supply0 id_1,
    input wand id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wand _id_5,
    output tri1 id_6,
    output tri1 id_7,
    input wor id_8,
    input wor id_9,
    output tri0 id_10
);
  wire [id_5 : -1] id_12;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_9,
      id_7,
      id_1,
      id_10,
      id_6,
      id_2,
      id_10,
      id_10,
      id_8,
      id_6,
      id_2,
      id_3,
      id_9
  );
  assign modCall_1.id_8 = 0;
endmodule
