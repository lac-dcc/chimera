// Seed: 3000011153
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    input uwire id_5,
    input wire id_6,
    input tri id_7,
    output wand id_8,
    input tri0 id_9,
    input wire id_10,
    output wor id_11,
    output wor id_12,
    output supply0 id_13,
    output wor id_14,
    output wor id_15,
    output supply0 id_16,
    id_19,
    output tri1 id_17
);
  assign id_15 = -1;
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    output tri   id_2
);
  assign #1 id_2 = id_1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_17 = 0;
  assign id_2 = id_1;
endmodule
