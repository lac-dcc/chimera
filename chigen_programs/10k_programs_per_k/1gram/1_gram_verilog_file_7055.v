// Seed: 2269146754
module module_0 (
    output tri0  id_0,
    input  wire  id_1,
    input  tri   id_2,
    output uwire id_3,
    input  wor   id_4,
    output tri0  id_5
    , id_10,
    output tri   id_6,
    output tri0  id_7,
    output wand  id_8
);
  wire id_11, id_12;
  id_13(
      .id_0(1),
      .id_1(1),
      .id_2(),
      .id_3(1),
      .id_4(1),
      .id_5(id_12),
      .id_6(1),
      .id_7(id_2),
      .id_8(id_5),
      .id_9(id_2),
      .id_10(1'b0),
      .id_11(id_12),
      .id_12(1),
      .id_13(1),
      .id_14(id_1),
      .id_15(id_0),
      .id_16(id_0),
      .id_17(1),
      .id_18('b0)
  ); id_14(
      id_4 & id_2
  );
  assign module_1.id_1 = 0;
  assign id_10 = 1;
endmodule
module module_1 (
    input  wand  id_0,
    input  wand  id_1,
    output wor   id_2,
    input  tri0  id_3,
    output uwire id_4,
    output wor   id_5
);
  id_7(
      id_1, 1, (id_1.id_3), 1, id_0, 1
  );
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_2,
      id_3,
      id_2,
      id_5,
      id_4,
      id_2
  );
endmodule
