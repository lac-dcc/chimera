// Seed: 814349946
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input wire id_2,
    output wand id_3,
    input tri id_4,
    input tri1 id_5,
    input wor id_6,
    input tri id_7,
    input wand id_8
);
  assign id_1 = 1;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wor   id_1,
    output tri0  id_2,
    output uwire id_3,
    input  uwire id_4,
    input  tri   id_5,
    input  wand  id_6
);
  xor primCall (id_2, id_0, id_5, id_6, id_1, id_4);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
