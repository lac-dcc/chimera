// Seed: 239825960
module module_0 (
    output uwire id_0,
    output supply0 id_1,
    output tri0 id_2,
    output wand id_3,
    input wire id_4,
    input wire id_5
);
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input tri id_2,
    input uwire id_3,
    output tri0 id_4,
    output tri id_5,
    input tri id_6,
    output tri0 id_7,
    input wor id_8,
    input wor id_9,
    output supply1 id_10,
    output supply0 id_11,
    input wor id_12,
    output tri0 id_13,
    output wand id_14,
    output wire id_15,
    input supply0 id_16,
    output tri0 id_17,
    output tri id_18,
    input uwire id_19,
    output wor id_20,
    output tri1 id_21,
    output supply0 id_22,
    input uwire id_23,
    output supply0 id_24
);
  wire id_26;
  nand primCall (
      id_18, id_2, id_3, id_1, id_23, id_16, id_6, id_19, id_8, id_26, id_12, id_9, id_0
  );
  module_0 modCall_1 (
      id_5,
      id_10,
      id_5,
      id_5,
      id_8,
      id_2
  );
  assign modCall_1.type_9 = 0;
endmodule
