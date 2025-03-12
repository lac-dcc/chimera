// Seed: 1566035933
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input uwire id_2,
    output tri id_3,
    input uwire id_4,
    input tri id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri id_8,
    input supply0 id_9,
    input tri0 id_10,
    output tri id_11,
    input tri0 id_12,
    input wire id_13,
    output supply1 id_14,
    input supply0 id_15,
    input supply0 id_16,
    input wire id_17,
    input wor id_18,
    input tri1 id_19,
    input uwire id_20,
    input wand id_21,
    output tri1 id_22,
    input tri0 id_23,
    input wand id_24#(
        .id_31(1 - 1),
        .id_32(1),
        .id_33(1),
        .id_34(1)
    ),
    output tri id_25,
    input wand id_26,
    input supply0 id_27,
    input uwire id_28,
    input supply1 id_29
);
  assign id_33 = 1;
endmodule
module module_1 #(
    parameter id_18 = 32'd49,
    parameter id_19 = 32'd29
) (
    input wand id_0,
    input tri id_1,
    input wor id_2,
    output supply1 id_3,
    output tri1 id_4,
    output tri1 id_5,
    input uwire id_6,
    input wand id_7,
    output wand id_8,
    input supply0 id_9,
    input wor id_10,
    output wand id_11#(.id_27(-1)),
    input tri1 id_12,
    output uwire id_13,
    output tri1 id_14,
    input tri1 id_15,
    input supply1 id_16,
    output supply1 id_17,
    input wire _id_18,
    input wand _id_19,
    input supply1 id_20,
    input tri id_21,
    output supply1 id_22,
    input uwire id_23,
    output uwire id_24,
    output supply0 id_25
);
  module_0 modCall_1 (
      id_0,
      id_9,
      id_2,
      id_8,
      id_10,
      id_2,
      id_21,
      id_0,
      id_4,
      id_9,
      id_6,
      id_5,
      id_16,
      id_7,
      id_24,
      id_23,
      id_10,
      id_1,
      id_20,
      id_20,
      id_10,
      id_10,
      id_14,
      id_2,
      id_21,
      id_22,
      id_23,
      id_7,
      id_10,
      id_9
  );
  assign modCall_1.id_18 = 0;
  wire [id_19  |  1 : -1] id_28;
  wire id_29;
  logic [1 'b0 : id_18] id_30 = id_9 & 1, id_31;
  nand primCall (
      id_14, id_12, id_1, id_10, id_21, id_15, id_27, id_7, id_6, id_2, id_16, id_20, id_23, id_0
  );
endmodule
