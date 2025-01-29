// Seed: 1112025906
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output tri void id_2,
    input tri id_3,
    output uwire id_4,
    id_12,
    output wor id_5,
    output tri1 id_6,
    input tri id_7,
    input wand id_8,
    output tri id_9,
    input wor id_10
);
  wire id_13, id_14;
  id_15(
      id_14, id_7
  );
  tri0 id_16 = id_7;
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input  tri  id_0,
    output tri0 id_1,
    input  tri  id_2,
    input  tri0 id_3,
    input  tri  id_4,
    output wand id_5,
    input  wor  id_6,
    input  wand id_7
);
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_0,
      id_1,
      id_1,
      id_5,
      id_6,
      id_3,
      id_5,
      id_0
  );
  parameter id_9 = 1;
endmodule
