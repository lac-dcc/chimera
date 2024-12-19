// Seed: 2773712752
module module_0 (
    input  tri  id_0,
    output tri1 id_1
);
  id_3(
      .id_0(1'b0), .id_1(1), .id_2(1'd0 & id_0), .id_3(1)
  ); id_4(
      .id_0(1),
      .id_1(id_0),
      .id_2(id_3),
      .id_3(id_1),
      .id_4(id_3),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(id_1)
  );
endmodule
module module_1 (
    output tri   id_0,
    output wire  id_1,
    output uwire id_2,
    input  wand  id_3,
    input  tri0  id_4,
    input  wand  id_5,
    output tri1  id_6,
    input  wand  id_7,
    input  wor   id_8
);
  assign id_6 = id_3;
  uwire id_10, id_11 = id_4;
  module_0 modCall_1 (
      id_11,
      id_6
  );
endmodule
