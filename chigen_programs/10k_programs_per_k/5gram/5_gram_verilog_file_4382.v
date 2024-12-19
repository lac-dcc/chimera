// Seed: 1765585048
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    output tri0 id_4,
    input supply1 id_5,
    output tri id_6,
    input supply0 id_7,
    output wand id_8,
    input tri1 id_9,
    input supply1 id_10,
    input wand id_11,
    output uwire id_12,
    input supply0 id_13,
    input uwire id_14
);
  assign id_1 = id_10;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    output tri0  id_2,
    output uwire id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.type_22 = 0;
endmodule
