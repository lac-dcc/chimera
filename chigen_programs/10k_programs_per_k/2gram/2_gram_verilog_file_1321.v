// Seed: 2568931138
module module_0 (
    input uwire id_0,
    output wire id_1,
    input wand id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wor id_5,
    input uwire id_6,
    output tri0 id_7,
    input uwire id_8,
    input supply1 id_9,
    output tri1 id_10,
    input supply1 id_11,
    output tri1 id_12
);
  wire id_14;
  parameter integer id_15 = 1'b0;
  assign id_14 = 1;
endmodule
module module_1 (
    output wand id_0,
    input  tri0 id_1,
    input  wand id_2,
    output wire id_3
);
  logic id_5;
  wire  id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
