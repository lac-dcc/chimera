// Seed: 1659484780
module module_0 (
    input  tri   id_0,
    input  tri   id_1,
    output wire  id_2,
    input  uwire id_3
);
  assign id_2 = id_1;
  wor id_5, id_6, id_7;
  wor id_8;
  assign {id_5, 1, 1, id_1 * id_8 != 1} = id_0 / 1 & id_0;
  id_9(
      .id_0(1),
      .id_1(1'b0),
      .id_2(1),
      .id_3((id_1)),
      .id_4(1),
      .id_5(id_7),
      .id_6(1),
      .id_7(id_3),
      .id_8(id_8)
  );
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  tri1  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  tri1  id_6,
    output tri0  id_7
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_7,
      id_0
  );
  assign modCall_1.type_5 = 0;
  assign id_7 = id_2;
  bufif1 primCall (id_7, id_6, id_4);
endmodule
