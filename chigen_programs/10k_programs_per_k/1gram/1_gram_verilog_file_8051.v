// Seed: 4143723217
module module_0 (
    input wand id_0,
    output tri id_1,
    input tri0 id_2,
    output wire id_3,
    input tri1 id_4,
    output tri1 id_5,
    input tri1 id_6,
    output tri0 id_7#(
        .id_14(1),
        .id_15(1),
        .id_16(1),
        .id_17(1),
        .id_18((!1 == ~1)),
        .id_19(1),
        .id_20(1),
        .id_21(1),
        .id_22(1)
    ),
    input supply0 id_8,
    output tri1 id_9,
    output wand id_10,
    output wand id_11,
    input wire id_12
);
  assign id_17 = -1'b0;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd24,
    parameter id_19 = 32'd90,
    parameter id_25 = 32'd9,
    parameter id_29 = 32'd81
) (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    output tri id_3#(
        .id_24 (1),
        ._id_25(1),
        .id_26 (-1),
        .id_27 (-1),
        .id_28 (1'b0),
        ._id_29(-1)
    ) ["" : id_25  ==  id_14],
    input supply0 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output supply0 id_7,
    output tri0 id_8,
    output tri id_9,
    input supply0 id_10,
    input tri0 id_11,
    input wand id_12,
    output wor id_13,
    output uwire _id_14,
    input wor id_15,
    input uwire id_16,
    input uwire id_17,
    output tri id_18,
    input supply1 _id_19,
    input tri id_20,
    output tri1 id_21,
    input tri id_22
);
  assign id_6 = id_10;
  module_0 modCall_1 (
      id_22,
      id_9,
      id_2,
      id_8,
      id_10,
      id_18,
      id_0,
      id_18,
      id_4,
      id_9,
      id_3,
      id_5,
      id_4
  );
  wire [id_29 : !  (  id_19  )] id_30;
  wire id_31, id_32 = 1;
endmodule
