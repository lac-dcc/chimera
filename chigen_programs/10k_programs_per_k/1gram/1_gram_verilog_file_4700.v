// Seed: 2152274309
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output tri0 id_2#(
        .id_15(-1'h0),
        .id_16({1{1'b0}}),
        .id_17(-1),
        .id_18(1'h0),
        .id_19(1),
        .id_20(1 ? -1 : 1),
        .id_21(-1),
        .id_22(1)
    ),
    input wor id_3,
    output wand id_4,
    input uwire id_5
    , id_23,
    output uwire id_6,
    input wand id_7[-1 : 1],
    input wand id_8,
    input wire id_9,
    input tri id_10,
    output uwire id_11,
    output uwire id_12,
    output supply1 id_13
);
  wire id_24;
  assign id_6 = -1;
  wire [1 : 1] id_25;
  assign id_19 = id_17;
endmodule
module module_1 #(
    parameter id_20 = 32'd99,
    parameter id_27 = 32'd32,
    parameter id_4  = 32'd60
) (
    input tri0 id_0,
    input supply1 id_1,
    output tri1 id_2,
    output wand id_3,
    input wor _id_4,
    input tri0 id_5,
    input wand id_6,
    output tri0 id_7,
    input uwire id_8,
    input tri id_9,
    output wor id_10,
    output supply1 id_11,
    input tri id_12,
    input supply1 id_13,
    output wire id_14,
    input uwire id_15[id_27 : 1],
    output tri id_16,
    output tri0 id_17,
    input tri id_18,
    output wire id_19,
    output tri0 _id_20,
    output tri1 id_21[~  -1 'b0 : id_4  ||  id_20]
    , id_29 = 1,
    input wire id_22,
    output wand id_23,
    input tri id_24,
    input tri id_25,
    output wire id_26,
    input uwire _id_27
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_3,
      id_9,
      id_21,
      id_18,
      id_21,
      id_8,
      id_15,
      id_0,
      id_18,
      id_14,
      id_26,
      id_16
  );
  assign modCall_1.id_13 = 0;
  assign id_7 = (id_0) != -1;
  wire id_30;
  assign id_16 = id_9;
endmodule
