// Seed: 2378877625
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output supply1 id_2
);
  assign id_2 = (id_0 == 1);
  wire id_4;
  logic [7:0] id_5;
  wire id_6;
  id_7(
      .id_0(id_1),
      .id_1(id_6),
      .id_2(1),
      .id_3(1'b0 + 1),
      .id_4(id_4),
      .id_5(1),
      .id_6(1 - 1),
      .id_7(1),
      .id_8(id_4),
      .id_9(id_5),
      .id_10(id_6),
      .id_11(),
      .id_12(id_4),
      .id_13(id_5[1 : 1]),
      .id_14(1'b0),
      .id_15(id_1),
      .id_16(1),
      .id_17(id_2)
  );
  wire id_8;
  wire id_9, id_10, id_11, id_12;
  wire id_13;
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    output uwire id_2
    , id_5,
    input  wand  id_3
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.type_14 = 0;
  nand primCall (id_2, id_3, id_0, id_1);
endmodule
