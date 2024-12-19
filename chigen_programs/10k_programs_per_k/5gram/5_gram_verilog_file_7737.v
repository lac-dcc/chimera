// Seed: 679546526
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    output wand id_2,
    output supply1 id_3,
    input wand id_4,
    output wand id_5,
    output wand id_6,
    output tri id_7
);
  id_9(
      .id_0(id_7),
      .id_1(id_0 == {1, 1}),
      .id_2(id_2),
      .id_3(1 + id_6),
      .id_4(1 <= id_4 + 1'b0),
      .id_5(1 == id_1),
      .id_6(id_2 - 1),
      .id_7(!id_5),
      .id_8(id_5),
      .id_9(1),
      .id_10(id_1)
  );
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    output supply1 id_3,
    output tri0 id_4,
    output tri1 id_5,
    output wand id_6,
    output supply0 id_7
);
  id_9(
      .id_0(1), .id_1(id_6)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_3,
      id_0,
      id_3,
      id_6,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
