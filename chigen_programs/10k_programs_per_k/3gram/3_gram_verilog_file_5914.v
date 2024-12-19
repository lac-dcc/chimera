// Seed: 3845912186
module module_0 (
    output uwire id_0,
    output supply0 id_1,
    input tri id_2,
    input wor id_3,
    input wand id_4,
    input supply1 id_5,
    input uwire id_6,
    input wor id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri id_10,
    input supply1 id_11,
    output uwire id_12,
    output wand id_13
);
  assign module_1.type_6 = 0;
  wire id_15;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri   id_1,
    input  uwire id_2,
    output wor   id_3
);
  nor primCall (id_3, id_2, id_1, id_0);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3
  );
  assign id_3 = id_2;
endmodule
