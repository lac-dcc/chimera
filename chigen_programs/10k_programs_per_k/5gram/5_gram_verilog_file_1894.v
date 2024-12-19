// Seed: 3318084479
module module_0 (
    output supply1 id_0,
    inout tri0 id_1,
    input wand id_2,
    output tri1 id_3,
    output tri id_4,
    output uwire id_5
);
  assign id_5 = id_2 - (1);
  assign id_4 = id_2;
endmodule
module module_1 (
    input  wire  id_0,
    output wor   id_1,
    input  wor   id_2,
    input  tri0  id_3,
    output tri   id_4,
    input  wand  id_5,
    inout  wand  id_6,
    output uwire id_7
);
  wire id_9;
  and primCall (id_1, id_6, id_0, id_2);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_0,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_6 = 1;
endmodule
