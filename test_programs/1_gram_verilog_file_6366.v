// Seed: 2956273896
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri id_2,
    input uwire id_3,
    output wand id_4,
    input tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri1 id_8,
    id_19,
    input wand id_9,
    id_20,
    input supply1 id_10,
    output tri0 id_11,
    input tri1 id_12,
    id_21,
    output wor id_13,
    input wor id_14,
    input wire id_15,
    output tri0 id_16,
    input tri id_17
);
  assign id_13 = -1;
  wire id_22;
  assign id_16 = id_6;
  logic [7:0][1] id_23;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    output uwire id_2,
    input  wire  id_3
);
  parameter id_5 = (1 | 1);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_0,
      id_3,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
