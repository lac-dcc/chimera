// Seed: 3719349854
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply1 id_8
);
  wire  id_10;
  logic id_11;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    output supply0 id_2,
    input wand id_3,
    input wand id_4,
    input supply1 id_5,
    input tri0 id_6,
    output wor id_7,
    output wire id_8,
    input tri0 id_9,
    input wire id_10,
    input tri0 id_11,
    output tri1 id_12,
    input wor id_13,
    output tri0 id_14,
    output uwire id_15
);
  parameter id_17 = !1;
  assign id_0  = id_13 == 1;
  assign id_15 = -1;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_3,
      id_12,
      id_1,
      id_5,
      id_13,
      id_1,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
