// Seed: 2766554091
module module_0 (
    output wor   id_0,
    output wor   id_1,
    input  uwire id_2,
    input  uwire id_3,
    input  uwire id_4,
    input  tri   id_5
);
  wire id_7;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    input supply1 id_2,
    input wor id_3,
    input supply1 id_4,
    output wire id_5,
    output wand id_6,
    input tri0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    input tri id_10,
    output wor id_11,
    input wire id_12,
    input wor id_13
);
  wire id_15;
  wand id_16;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_2,
      id_10,
      id_1,
      id_3
  );
  assign id_16 = id_10 & -1;
  parameter id_17 = 1;
endmodule
