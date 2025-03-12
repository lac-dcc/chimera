// Seed: 1139058919
module module_0 (
    input wand id_0,
    input uwire id_1,
    output tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    output uwire id_5,
    input supply1 id_6,
    output tri id_7,
    output supply1 id_8,
    output wand id_9,
    output wor id_10,
    output supply0 id_11,
    output wand id_12,
    output wor id_13,
    input tri id_14,
    output uwire id_15
);
  assign id_10 = -1;
  wire id_17;
endmodule
module module_1 (
    output supply1 id_0,
    input  supply0 id_1,
    input  supply0 id_2
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_15 = 0;
endmodule
