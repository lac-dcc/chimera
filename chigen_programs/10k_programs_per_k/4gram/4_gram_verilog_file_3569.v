// Seed: 2314300692
module module_0 (
    output tri1 id_0,
    input wand id_1,
    output uwire id_2,
    output wand id_3,
    input wor id_4,
    input tri1 id_5,
    output supply1 id_6
);
  supply0 id_8;
  assign id_6 = id_8;
  tri1 id_9 = 1;
endmodule
module module_0 (
    input wire id_0,
    input wand id_1,
    output wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wand id_5,
    input supply1 id_6,
    input supply0 id_7,
    input tri module_1,
    input uwire id_9,
    input uwire id_10,
    input wor id_11,
    input wor id_12,
    input uwire id_13,
    output uwire id_14,
    input uwire id_15,
    output supply0 id_16,
    output tri id_17,
    input supply1 id_18,
    input tri id_19
);
  wire id_21, id_22;
  module_0 modCall_1 (
      id_17,
      id_15,
      id_14,
      id_16,
      id_19,
      id_18,
      id_14
  );
  assign modCall_1.id_0 = 0;
  assign id_2 = id_1 & 1'b0 & id_18 & 1 & 1;
endmodule
