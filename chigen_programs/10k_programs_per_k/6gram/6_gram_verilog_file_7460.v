// Seed: 2178111045
module module_0 (
    input  tri1  id_0,
    output wand  id_1,
    input  tri1  id_2,
    input  wor   id_3,
    input  wor   id_4,
    input  uwire id_5,
    input  tri0  id_6,
    input  uwire id_7
);
  assign module_1.id_6 = 0;
  wire id_9;
  ;
  assign id_1 = -1 | 1;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    input wire id_2,
    output wor id_3,
    output supply0 id_4,
    output supply0 id_5,
    input wor id_6,
    input supply0 id_7
);
  wire id_9;
  ;
  nor primCall (id_1, id_6, id_0, id_9, id_2, id_7);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
