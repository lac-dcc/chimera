// Seed: 1660451081
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input supply0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input uwire id_5,
    input wand id_6,
    output tri id_7,
    input supply0 id_8,
    input tri0 id_9,
    output wor id_10,
    input wor id_11,
    output supply0 id_12,
    input wand id_13,
    output wand id_14,
    output tri0 id_15,
    input tri0 id_16,
    input supply0 id_17,
    input tri id_18
);
  assign id_14 = 1'b0;
  wire id_20;
  tri  id_21;
  assign id_10 = 1 || 1;
  wor id_22 = id_21;
  assign id_3 = id_22;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input wand id_2,
    input supply0 id_3,
    input uwire id_4,
    output wand id_5,
    input tri1 id_6,
    output tri1 id_7,
    input uwire id_8,
    output supply1 id_9,
    input uwire id_10,
    output tri id_11
);
  assign id_11 = 1;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_6,
      id_4,
      id_4,
      id_7,
      id_1,
      id_0,
      id_9,
      id_1,
      id_5,
      id_0,
      id_11,
      id_5,
      id_6,
      id_8,
      id_8
  );
  assign modCall_1.type_2 = 0;
endmodule
