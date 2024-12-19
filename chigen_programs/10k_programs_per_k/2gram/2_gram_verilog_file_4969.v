// Seed: 1454536269
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    input uwire id_3,
    input wand id_4,
    input wand id_5,
    input wand id_6,
    input wire id_7,
    input tri0 id_8,
    input wand id_9,
    input uwire id_10,
    input uwire id_11,
    output wor id_12,
    input tri id_13,
    output wor id_14
);
  always_comb assume (1 && id_10);
  wire id_16;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri  id_0,
    input tri1 id_1
);
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3
  );
endmodule
