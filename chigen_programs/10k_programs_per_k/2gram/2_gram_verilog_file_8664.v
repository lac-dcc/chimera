// Seed: 4079657343
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input wor id_2,
    input wand id_3,
    input wor id_4,
    input tri0 id_5,
    input tri0 id_6,
    output tri0 id_7,
    output wor id_8,
    input supply0 id_9,
    output wor id_10,
    input wor id_11,
    output supply0 id_12,
    input tri1 id_13,
    input supply1 id_14,
    input tri0 id_15,
    output supply0 id_16,
    input tri id_17,
    input wand id_18
);
  assign id_1 = id_0;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    input  tri   id_3,
    input  tri   id_4,
    output tri0  id_5,
    output tri1  id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_2,
      id_4,
      id_0,
      id_4,
      id_6,
      id_4,
      id_1,
      id_1,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.type_23 = 0;
endmodule
