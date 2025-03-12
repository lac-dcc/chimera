// Seed: 1816448472
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri1 id_2,
    output wand id_3,
    input wor id_4,
    input wire id_5,
    input wire id_6,
    output tri0 id_7,
    input supply0 id_8,
    output supply1 id_9,
    output tri1 id_10
);
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    input  uwire id_2,
    output wor   id_3,
    output uwire id_4,
    input  uwire id_5,
    output tri   id_6
);
  assign id_0 = -1;
  xnor primCall (id_3, id_2, id_1, id_5);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_0,
      id_5,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
