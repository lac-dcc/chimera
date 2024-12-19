// Seed: 2156128772
module module_0 (
    output tri1 id_0,
    output wand id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output tri0 id_5,
    input wor id_6,
    output supply0 id_7,
    input wire id_8,
    input tri1 id_9,
    output wor id_10,
    input supply1 id_11,
    output supply0 id_12,
    input tri0 id_13,
    output supply1 id_14,
    output tri0 id_15,
    input tri id_16,
    output tri1 id_17,
    input supply0 id_18,
    output wire id_19,
    output wor id_20,
    input supply0 id_21,
    output supply1 id_22,
    output tri id_23,
    output supply1 id_24,
    output wor id_25,
    output tri id_26,
    input uwire id_27,
    input tri0 id_28,
    input wand id_29,
    output tri0 id_30,
    input wand id_31
    , id_37,
    output wire id_32,
    output wor id_33,
    input tri0 id_34,
    input supply1 id_35
);
endmodule
module module_1 (
    output wire id_0,
    input wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wand id_4,
    input wand id_5,
    input tri id_6,
    input uwire id_7,
    output uwire id_8,
    input wor id_9,
    input wor id_10,
    output uwire id_11
);
  uwire id_13 = 1;
  wire  id_14;
  always_comb @(id_10 or posedge 1'b0);
  uwire id_15 = 1, id_16;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_5,
      id_1,
      id_0,
      id_5,
      id_0,
      id_5,
      id_3,
      id_8,
      id_6,
      id_11,
      id_10,
      id_11,
      id_11,
      id_3,
      id_11,
      id_1,
      id_8,
      id_8,
      id_7,
      id_8,
      id_11,
      id_11,
      id_8,
      id_0,
      id_5,
      id_6,
      id_5,
      id_0,
      id_9,
      id_8,
      id_8,
      id_4,
      id_10
  );
  assign modCall_1.type_46 = 0;
  assign id_8 = 1;
  supply1 id_17, id_18, id_19, id_20;
  assign id_17 = 1;
  nand primCall (
      id_11, id_10, id_3, id_6, id_14, id_16, id_2, id_4, id_5, id_1, id_13, id_15, id_7, id_9
  );
  assign #(1 ^ 1) id_19 = !id_15;
  wire id_21;
endmodule
