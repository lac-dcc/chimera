// Seed: 1122950298
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    input  wand  id_2,
    output uwire id_3,
    output wand  id_4,
    output wor   id_5
);
endmodule
module module_1 (
    input  tri0 id_0,
    input  wand id_1,
    output wor  id_2,
    input  tri  id_3,
    input  tri1 id_4,
    input  wor  id_5,
    output tri0 id_6,
    input  wor  id_7
);
  assign id_6 = id_3 << id_4 + -1'd0;
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_2,
      id_6,
      id_6
  );
endmodule
