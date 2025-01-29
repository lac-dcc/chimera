// Seed: 1112799702
module module_0 (
    input  tri0 id_0,
    output wire id_1,
    output wand id_2,
    input  wand id_3,
    output tri0 id_4,
    input  tri0 id_5
);
  wire id_7;
  assign id_4 = 1;
  pulldown (
      .id_0(-1),
      .id_1((1 < id_2)),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(id_5),
      .id_6(1),
      .id_7(-1'b0)
  );
  wire id_8;
endmodule
module module_1 (
    input  wire  id_0,
    output tri1  id_1,
    output uwire id_2,
    output tri1  id_3
);
  assign id_1 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.type_2 = 0;
  wire id_5, id_6, id_7, id_8 = id_7;
endmodule
