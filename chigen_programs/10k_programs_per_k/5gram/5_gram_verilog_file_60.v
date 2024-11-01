// Seed: 3296769728
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    output tri0  id_2,
    output tri   id_3,
    input  uwire id_4,
    input  uwire id_5
);
  wire id_7;
  assign id_2 = 1;
  wire id_8;
  assign id_7 = id_1;
endmodule
module module_1 (
    inout  wand id_0,
    input  wor  id_1,
    output tri0 id_2,
    input  wand id_3
);
  id_5(
      .id_0(""),
      .id_1(id_3),
      .id_2(id_1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(id_3 == module_1),
      .id_8(id_0)
  );
  and (id_2, id_5, id_0);
  module_0(
      id_3, id_3, id_2, id_0, id_3, id_1
  );
endmodule
