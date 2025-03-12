// Seed: 942819012
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    output tri id_7,
    input tri1 id_8,
    input uwire id_9,
    input supply1 id_10,
    input wand id_11,
    output tri id_12,
    input wor id_13
);
  assign id_7 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    inout  tri1 id_0,
    output wor  id_1,
    input  tri  id_2,
    input  tri  id_3
);
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_3
  );
  assign id_1 = id_2;
endmodule
