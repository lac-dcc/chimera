// Seed: 3953740174
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output tri1 id_2,
    input wand id_3,
    input uwire id_4,
    output wire id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input wor module_0,
    input wor id_11,
    output tri id_12,
    output tri0 id_13
);
  wire id_15;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    input wand id_2,
    output wor id_3,
    output wand id_4,
    input supply1 id_5,
    input supply1 id_6,
    output wire id_7,
    output tri id_8,
    input tri id_9,
    input tri0 id_10,
    input tri1 id_11,
    output wor id_12
);
  assign id_12 = id_11;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_11,
      id_12,
      id_9,
      id_10,
      id_10,
      id_5,
      id_1,
      id_10,
      id_0,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
