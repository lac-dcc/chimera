// Seed: 2721720654
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    input tri1 id_4,
    input tri id_5,
    input uwire id_6,
    output wand id_7,
    input wor id_8,
    input wor id_9,
    input wire id_10,
    output tri0 id_11,
    output tri id_12,
    input wand id_13,
    input wand id_14,
    input uwire id_15,
    output tri0 id_16,
    output supply1 id_17,
    input uwire id_18
);
  wire id_20;
  assign id_11 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri1  id_1,
    input  wor   id_2,
    output tri   id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_1,
      id_2,
      id_2,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.type_3 = 0;
endmodule
