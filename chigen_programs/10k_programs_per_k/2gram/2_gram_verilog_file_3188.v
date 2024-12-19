// Seed: 3325577479
module module_0 (
    input tri id_0,
    output uwire id_1,
    input wand id_2,
    output wand id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output wor id_7,
    input tri1 id_8,
    input uwire id_9,
    input wand id_10,
    output tri1 id_11,
    output tri0 id_12,
    input supply1 id_13,
    input tri id_14
);
  wire id_16;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output wor id_2,
    input supply1 id_3,
    input wand id_4,
    output wor id_5,
    input wor id_6,
    input uwire id_7
);
  assign id_2 = 1;
  assign id_5 = 1'b0;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_5,
      id_6,
      id_4,
      id_1,
      id_5,
      id_3,
      id_3,
      id_0,
      id_5,
      id_5,
      id_3,
      id_3
  );
  assign modCall_1.type_5 = 0;
endmodule
