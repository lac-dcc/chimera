// Seed: 2928998336
module module_0 (
    input  wor   id_0,
    output wor   id_1,
    input  uwire id_2,
    output tri   id_3
);
endmodule
module module_1 (
    input  uwire id_0,
    output tri   id_1
);
  wire id_3;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
  wire id_4 = id_3, id_5;
  id_6(
      .id_0(id_1 / 1'b0),
      .id_1(id_3),
      .id_2(id_1),
      .id_3(id_4),
      .id_4(id_3),
      .id_5(id_0),
      .id_6(1),
      .id_7(1),
      .id_8(),
      .id_9(id_4),
      .id_10(id_5),
      .id_11(id_4),
      .id_12(1)
  );
endmodule
