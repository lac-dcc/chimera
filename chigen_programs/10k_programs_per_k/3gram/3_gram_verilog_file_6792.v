// Seed: 955165022
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    output uwire id_2,
    input wand id_3,
    input uwire id_4,
    output supply1 id_5,
    input uwire id_6,
    input tri id_7,
    output tri1 id_8,
    output wand id_9,
    output tri1 id_10,
    input tri1 id_11,
    output wor id_12,
    output wor id_13,
    output uwire id_14,
    output tri0 id_15
    , id_32,
    output supply0 id_16,
    output tri1 id_17,
    output wand id_18,
    input supply1 id_19,
    output wand id_20,
    output wire id_21,
    input uwire id_22,
    output tri1 id_23,
    input supply0 id_24,
    output supply1 id_25,
    output wire id_26,
    input supply1 id_27,
    input supply0 id_28,
    input wor id_29,
    input tri1 id_30
);
  wire id_33;
  assign id_26 = id_28;
endmodule
module module_1 (
    input tri id_0,
    output tri id_1,
    input supply0 id_2,
    input uwire id_3,
    output tri id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri0 id_7,
    input supply1 id_8,
    input wor id_9
);
  nand primCall (id_1, id_0, id_8, id_7, id_2, id_3, id_5);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9,
      id_5,
      id_6,
      id_7,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3,
      id_6,
      id_1,
      id_6,
      id_4,
      id_6,
      id_6,
      id_4,
      id_7,
      id_4,
      id_6,
      id_3,
      id_4,
      id_9,
      id_4,
      id_4,
      id_8,
      id_3,
      id_8,
      id_9
  );
  assign id_6 = id_0 == id_3;
  wire id_11;
endmodule
