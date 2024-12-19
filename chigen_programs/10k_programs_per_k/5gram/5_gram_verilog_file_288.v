// Seed: 2492914942
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output uwire id_2,
    input supply1 id_3,
    input tri id_4
);
  id_6(
      .id_0(1'b0 != id_3),
      .id_1(id_2),
      .id_2(id_4 - id_1),
      .id_3(id_0),
      .id_4(""),
      .id_5(1 == id_1),
      .id_6(),
      .id_7(!id_2),
      .id_8(id_0),
      .id_9(id_4 == 1)
  );
endmodule
module module_1 (
    output tri0 id_0,
    input  tri1 id_1
);
  assign id_0 = id_1;
  id_3(
      .id_0(id_1),
      .id_1(1),
      .id_2((1)),
      .id_3(id_0),
      .id_4(1),
      .id_5(id_1 == 1'b0),
      .id_6(1),
      .id_7(id_1)
  );
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
