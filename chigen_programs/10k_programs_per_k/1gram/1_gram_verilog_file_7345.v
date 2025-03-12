// Seed: 2573755300
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri0 id_3#(
        .id_15(1),
        .id_16(-1),
        .id_17(1),
        .id_18(1),
        .id_19(-1 & 1 | 1),
        .id_20(1),
        .id_21(1),
        .id_22(1),
        .id_23(-1),
        .id_24('b0),
        .id_25(1),
        .id_26(~1)
    ),
    input supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    output tri1 id_7,
    input wand id_8,
    input tri0 id_9,
    output tri0 id_10,
    input tri0 id_11,
    input wire id_12,
    input uwire id_13
);
  wire id_27;
endmodule
module module_1 #(
    parameter id_7 = 32'd36
) (
    output tri id_0,
    input supply1 id_1,
    output wor id_2,
    output tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    input wor id_6,
    output uwire _id_7,
    input wor id_8[id_7 : (  -1  )  <  1],
    input tri1 id_9
);
  wire id_11;
  wand id_12 = 1, id_13 = -1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_8,
      id_5,
      id_1,
      id_4,
      id_4,
      id_2,
      id_1,
      id_8,
      id_0,
      id_1,
      id_4,
      id_6
  );
  assign modCall_1.id_0 = 0;
  assign id_12 = id_13;
endmodule
