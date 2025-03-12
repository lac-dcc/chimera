// Seed: 2199877428
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    output wire id_2,
    input uwire id_3,
    output supply0 id_4,
    input supply0 id_5,
    input tri id_6,
    input tri1 id_7,
    output tri1 id_8,
    output tri0 id_9,
    output tri0 id_10
);
  assign id_9 = -1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    inout  tri0  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    output wor   id_3,
    input  tri1  id_4,
    output uwire id_5,
    output wand  id_6
);
  assign id_5 = (id_4);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_0,
      id_5,
      id_3
  );
endmodule
