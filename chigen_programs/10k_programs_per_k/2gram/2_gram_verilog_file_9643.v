// Seed: 2356850129
module module_0 (
    output tri id_0
    , id_32,
    input supply1 id_1
    , id_33,
    output tri1 id_2,
    output supply1 id_3,
    input wire id_4,
    output tri1 id_5,
    input uwire id_6,
    input wire id_7,
    output wor id_8,
    input wor id_9,
    output tri1 id_10
    , id_34,
    output wand id_11,
    input tri id_12,
    input supply0 id_13
    , id_35,
    input tri0 id_14,
    input tri1 id_15,
    input uwire id_16,
    input wire id_17,
    output wand id_18,
    output uwire id_19
    , id_36,
    input wire id_20,
    input tri1 id_21,
    input wor id_22,
    output wor id_23,
    output wand id_24,
    input wire id_25,
    input supply1 id_26
    , id_37,
    input wor id_27,
    output tri0 id_28,
    output tri1 id_29,
    output tri id_30
);
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    input wand id_2
    , id_7,
    input tri id_3,
    input tri1 id_4,
    inout wor id_5
);
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_0,
      id_5,
      id_5,
      id_5,
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_5,
      id_4,
      id_3,
      id_5,
      id_2,
      id_4,
      id_1,
      id_5,
      id_2,
      id_2,
      id_2,
      id_5,
      id_0,
      id_2,
      id_3,
      id_3,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_16 = 0;
  wire id_10;
  nand primCall (id_5, id_2, id_3, id_8, id_4, id_7);
endmodule
