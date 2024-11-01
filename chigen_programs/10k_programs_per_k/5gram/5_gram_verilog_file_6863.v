// Seed: 3197196858
module module_0 (
    output wand id_0,
    output wire id_1,
    input  wand id_2,
    input  wand id_3,
    output tri  id_4,
    input  tri1 id_5,
    output wor  id_6,
    input  tri  id_7
);
  supply1 id_9 = id_5;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  tri1  id_2
);
  id_4(
      .id_0(id_2),
      .id_1(id_0),
      .id_2(1),
      .id_3({1 - 1'h0, id_1, 1} - 1),
      .id_4(id_2),
      .id_5(""),
      .id_6(~id_0)
  );
  not (id_0, id_2);
  module_0(
      id_0, id_0, id_1, id_2, id_0, id_1, id_0, id_1
  );
endmodule
