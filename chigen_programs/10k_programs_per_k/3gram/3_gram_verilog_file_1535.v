// Seed: 2649803726
module module_0 (
    output tri1 id_0
    , id_26,
    output tri1 id_1,
    input tri0 id_2,
    output supply0 id_3,
    output wand id_4,
    input tri1 id_5,
    input supply1 id_6,
    input wand id_7,
    output supply1 id_8,
    input tri id_9
    , id_27, id_28,
    output supply0 id_10,
    input tri0 id_11,
    output wire id_12,
    input wor id_13,
    input wire id_14,
    output wand id_15,
    input tri0 id_16,
    input supply1 id_17,
    input uwire id_18,
    output supply0 id_19,
    input uwire id_20,
    output tri1 id_21,
    output wire id_22,
    input tri0 id_23,
    input uwire id_24
);
  wire id_29;
endmodule
module module_1 #(
    parameter id_19 = 32'd36
) (
    input supply1 id_0,
    input supply0 id_1,
    input uwire id_2,
    output uwire id_3
    , id_21,
    input tri id_4,
    output uwire id_5,
    input wire id_6,
    output wire id_7,
    output tri1 id_8,
    output supply1 id_9,
    input tri1 id_10,
    input tri id_11,
    input wand id_12,
    input supply0 id_13,
    output tri id_14,
    input wand id_15,
    input wor id_16,
    output wor id_17,
    input uwire id_18,
    output uwire _id_19
);
  logic [id_19 : 1] id_22 = id_4;
  logic [-1 : 1] id_23, id_24;
  assign id_19 = ~1;
  wire id_25;
  initial cover (-1);
  nand primCall (
      id_9,
      id_16,
      id_13,
      id_15,
      id_0,
      id_18,
      id_21,
      id_25,
      id_12,
      id_10,
      id_24,
      id_1,
      id_23,
      id_22,
      id_11,
      id_6,
      id_4
  );
  module_0 modCall_1 (
      id_3,
      id_9,
      id_18,
      id_8,
      id_17,
      id_18,
      id_2,
      id_0,
      id_9,
      id_15,
      id_3,
      id_13,
      id_17,
      id_4,
      id_16,
      id_17,
      id_13,
      id_4,
      id_4,
      id_5,
      id_10,
      id_5,
      id_14,
      id_18,
      id_2
  );
  assign modCall_1.id_20 = 0;
  parameter id_26 = 1;
endmodule
