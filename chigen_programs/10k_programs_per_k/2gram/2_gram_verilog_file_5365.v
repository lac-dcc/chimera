// Seed: 3025936525
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input supply1 id_3
);
endmodule
module module_1 (
    input  wand  id_0,
    input  uwire id_1,
    output wand  id_2,
    output tri1  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    output tri1  id_6
);
  assign id_2 = id_4;
  module_0(
      id_0, id_2, id_6, id_0
  );
  supply0 id_8;
  id_9(
      .id_0(1),
      .id_1(id_2),
      .id_2(id_8 ? 1 : 1'b0),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_10 * 1'd0),
      .id_7(id_3 - id_0),
      .id_8(id_4),
      .id_9({1, id_8, id_4, 1 * 1}),
      .id_10(id_0 - id_0),
      .id_11(1 == id_6++),
      .id_12(id_8)
  );
endmodule
