// Seed: 954762805
module module_0 (
    input  wand  id_0,
    input  wor   id_1,
    output tri0  id_2,
    input  tri0  id_3,
    input  tri   id_4,
    output uwire id_5,
    input  uwire id_6,
    output tri   id_7
);
  assign id_2 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    output tri id_3,
    input wor id_4,
    output wand id_5,
    output supply0 id_6,
    input wor id_7,
    input uwire id_8
);
  module_0 modCall_1 (
      id_0,
      id_8,
      id_1,
      id_8,
      id_4,
      id_3,
      id_7,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
