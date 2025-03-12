// Seed: 1297300120
module module_0 (
    input  tri0  id_0,
    output wor   id_1,
    output wand  id_2,
    output uwire id_3,
    output uwire id_4,
    output wor   id_5
);
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    input supply1 id_8,
    output tri1 id_9,
    input tri id_10,
    output uwire id_11
);
  assign id_11 = id_2#(.id_6(1));
  nor primCall (id_9, id_8, id_4, id_2, id_5, id_10, id_0, id_3, id_6);
  supply1 id_13;
  ;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_1,
      id_7,
      id_11,
      id_9
  );
  assign id_13 = -1;
endmodule
