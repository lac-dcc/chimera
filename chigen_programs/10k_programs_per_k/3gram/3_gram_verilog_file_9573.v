// Seed: 232531050
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output wand id_2,
    input tri id_3,
    output tri1 id_4,
    output wor id_5,
    output tri id_6,
    input supply1 id_7,
    output wire id_8
    , id_11,
    input wand id_9
);
  assign id_1 = 1;
endmodule
module module_1 (
    output wor   id_0,
    output tri0  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    output uwire id_4,
    input  tri   id_5
);
  rnmos id_7 ((1), 1, id_2);
  xor (id_4, id_2, id_3, id_7);
  module_0(
      id_3, id_1, id_4, id_2, id_1, id_0, id_1, id_5, id_0, id_5
  );
endmodule
