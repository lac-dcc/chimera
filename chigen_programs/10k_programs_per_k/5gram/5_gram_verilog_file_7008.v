// Seed: 2976545413
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri id_3,
    input wor id_4,
    output supply1 id_5,
    output tri0 id_6,
    output tri id_7
);
  wand id_9 = 1;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1,
    input  uwire id_2,
    input  wire  id_3,
    output uwire id_4,
    output tri0  id_5
);
  tri0 id_7 = id_0;
  supply0 id_8;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_0,
      id_0,
      id_3,
      id_5,
      id_7,
      id_1
  );
  always_comb @(*) id_8 = id_2;
endmodule
