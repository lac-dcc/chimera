// Seed: 1153797064
module module_0 (
    input wor id_0,
    input tri id_1,
    output wire id_2,
    input tri1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    output tri0 id_6,
    output wand id_7,
    input uwire id_8,
    input wand id_9,
    output tri0 id_10,
    output tri0 id_11,
    output tri0 id_12,
    output wor id_13,
    output wand id_14,
    output tri0 id_15,
    input wire id_16,
    output wor id_17,
    output tri1 id_18,
    output wand id_19,
    input tri0 id_20
);
  assign id_10 = 1'b0 == -1;
  wire id_22;
endmodule
module module_1 (
    output wire  id_0,
    input  tri   id_1,
    output uwire id_2,
    output wor   id_3,
    input  uwire id_4,
    output tri0  id_5
);
  module_0 modCall_1 (
      id_1,
      id_4,
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_5,
      id_1,
      id_1,
      id_5,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_4,
      id_3,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
