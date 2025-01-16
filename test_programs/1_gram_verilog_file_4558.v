// Seed: 4257549404
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri id_4,
    output wor id_5,
    input wand id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wand id_9,
    input tri1 id_10,
    output uwire id_11,
    output tri0 id_12,
    input tri1 id_13,
    input wor id_14,
    id_17,
    output tri id_15
);
  wire id_18;
  bit  id_19;
  wire id_20;
  wire id_21;
  initial id_19 <= 1;
  tri0 id_22 = id_7;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input wire id_2,
    input uwire id_3,
    output wire id_4
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_4,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.type_30 = 0;
endmodule
