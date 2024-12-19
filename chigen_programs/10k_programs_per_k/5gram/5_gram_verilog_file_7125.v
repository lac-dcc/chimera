// Seed: 211693781
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wand id_4,
    input wand id_5,
    input supply0 id_6,
    input wor id_7,
    input tri1 id_8,
    input wor id_9,
    output wand id_10,
    output supply0 id_11,
    input wor id_12,
    output wor id_13
    , id_23,
    output wire id_14,
    input tri1 id_15,
    input tri1 id_16,
    output tri id_17,
    input wor id_18,
    input tri0 id_19,
    input supply0 id_20,
    output tri id_21
);
  generate
    assign id_21 = id_5;
  endgenerate
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input supply1 id_2
);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_3 = 0;
  assign id_1 = 1;
endmodule
