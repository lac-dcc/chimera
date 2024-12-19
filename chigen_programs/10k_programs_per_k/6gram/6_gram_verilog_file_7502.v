// Seed: 1523838871
module module_0 (
    input wand id_0,
    output wand id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wand id_5,
    output tri1 id_6,
    output tri1 id_7
);
  wor id_9;
  integer id_10;
  assign id_9 = 1;
  wire id_11;
  wire id_12;
  assign id_4 = id_5;
  wire id_13, id_14;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    input  uwire id_2
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_15 = 0;
endmodule
