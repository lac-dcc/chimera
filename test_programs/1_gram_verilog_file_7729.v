// Seed: 3502245152
module module_0 (
    output wor id_0,
    input tri0 id_1,
    output uwire id_2,
    output tri1 id_3,
    input wand id_4,
    input tri1 id_5,
    input tri1 id_6,
    input supply1 id_7
);
  assign id_0 = 1;
  tri  id_9;
  wire id_10;
  always_latch if (id_4) id_0 = -1 == id_9 | 1'b0;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input tri0 id_2
);
  parameter id_4 = -1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_2 = 0;
endmodule
