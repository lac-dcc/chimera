// Seed: 1831660557
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input wor id_2,
    output uwire id_3,
    input tri0 id_4,
    input wand id_5,
    output tri0 id_6,
    input wire id_7,
    output supply1 id_8,
    input tri0 id_9,
    input tri id_10
    , id_26,
    output tri id_11,
    input supply0 id_12,
    input uwire id_13,
    input tri id_14,
    input tri1 id_15,
    input uwire id_16,
    output tri1 id_17,
    output uwire id_18,
    input tri0 id_19,
    input wand id_20,
    output uwire id_21,
    output supply1 id_22,
    input tri1 id_23,
    output wor id_24
);
  assign module_1.id_2 = 0;
  wand id_27 = 1'd0, id_28, id_29, id_30, id_31, id_32, id_33, id_34, id_35, id_36, id_37;
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    input tri id_2,
    output tri id_3,
    input wand id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri1 id_7,
    output wor id_8
);
  nand primCall (id_1, id_5, id_7);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_8,
      id_5,
      id_5,
      id_3,
      id_6,
      id_3,
      id_2,
      id_4,
      id_8,
      id_5,
      id_6,
      id_7,
      id_0,
      id_2,
      id_8,
      id_8,
      id_5,
      id_2,
      id_1,
      id_3,
      id_5,
      id_1
  );
endmodule
