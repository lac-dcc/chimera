// Seed: 2200173738
module module_0 (
    input tri id_0,
    output wand id_1,
    output wire id_2,
    input wor id_3,
    output wor id_4,
    output uwire id_5,
    input uwire id_6,
    input uwire id_7,
    output wor id_8,
    output supply0 id_9,
    output supply1 id_10,
    input wand id_11,
    output supply1 id_12,
    input supply0 id_13,
    output supply1 id_14,
    output uwire id_15
);
  parameter id_17 = 1;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    output wor   id_2
);
  assign id_0 = id_1;
  logic id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
