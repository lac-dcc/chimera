// Seed: 2732270881
module module_0 (
    input  wand  id_0,
    output wand  id_1,
    input  uwire id_2,
    output tri   id_3,
    input  tri0  id_4,
    input  wire  id_5,
    input  wor   id_6
);
  assign id_1 = -1 & id_5;
  assign id_3 = id_2;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output logic id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wand id_5,
    output wire id_6,
    output supply0 id_7,
    input supply1 id_8,
    output tri0 id_9,
    input tri1 id_10,
    output wand id_11,
    input uwire id_12,
    input wand id_13,
    input uwire id_14,
    input tri id_15,
    input tri1 id_16,
    output wand id_17,
    input uwire id_18
);
  int id_20 = 1;
  and primCall (id_6, id_13, id_18, id_3, id_12, id_16, id_8, id_20, id_10, id_15, id_14, id_1);
  always id_2 <= id_13 & -1;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_15,
      id_4,
      id_18,
      id_15,
      id_13
  );
  assign modCall_1.type_10 = 0;
endmodule
