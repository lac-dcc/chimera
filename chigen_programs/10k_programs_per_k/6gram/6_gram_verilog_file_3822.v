// Seed: 2438104076
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input wand id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wor id_8,
    input supply1 id_9,
    output wand id_10,
    output wire id_11
);
  assign id_10 = id_8;
endmodule
module module_1 (
    output wor   id_0,
    output wor   id_1,
    output uwire id_2,
    input  uwire id_3,
    input  uwire id_4,
    output tri   id_5,
    input  wand  id_6
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_3,
      id_0,
      id_6,
      id_4,
      id_6,
      id_4,
      id_0,
      id_2
  );
  assign modCall_1.type_7 = 0;
endmodule
