// Seed: 980793823
module module_0 (
    output wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output supply1 id_7,
    input wand id_8,
    output tri1 id_9,
    input supply0 id_10,
    output wire id_11
);
  id_13(
      .id_0({id_5{1 * id_3}}),
      .id_1({1, 1}),
      .id_2(id_3),
      .id_3(id_0),
      .id_4(id_10),
      .id_5(),
      .id_6(1 & (id_7))
  );
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    output wire  id_2,
    output wire  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    output tri   id_6,
    output uwire id_7,
    input  wand  id_8,
    output tri   id_9
);
  assign id_7 = id_8;
  nand (id_3, id_0, id_5, id_4, id_8, id_1);
  module_0(
      id_2, id_6, id_5, id_1, id_5, id_0, id_1, id_2, id_1, id_9, id_1, id_3
  );
endmodule
