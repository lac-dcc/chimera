// Seed: 2105726328
module module_0 (
    output tri1 id_0,
    input wand id_1,
    output tri0 id_2,
    output tri id_3,
    output wire id_4,
    output wor id_5,
    output tri id_6,
    output supply1 id_7,
    output supply0 id_8,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    output wire id_12,
    output tri id_13,
    output uwire id_14,
    input wor id_15,
    input tri1 id_16,
    input wor id_17,
    input tri id_18,
    output tri id_19,
    input supply1 id_20,
    input wand id_21,
    output tri0 id_22,
    output wand id_23
);
  pulldown (id_11, 1, 1, -1);
endmodule
module module_1 (
    output wor  id_0,
    input  wire id_1,
    output wand id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_13 = 0;
endmodule
