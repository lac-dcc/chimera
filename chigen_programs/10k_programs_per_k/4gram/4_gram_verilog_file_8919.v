// Seed: 932604258
module module_0 (
    output tri0 id_0,
    input wire id_1,
    output uwire id_2,
    input tri1 id_3,
    input uwire id_4
    , id_11,
    input supply0 id_5,
    input uwire id_6,
    input wand id_7,
    input supply1 id_8,
    input tri1 id_9
    , id_12
);
  assign id_2 = 1;
  id_13(
      .id_0(""),
      .id_1(1),
      .id_2(id_12),
      .id_3(1),
      .id_4((id_2)),
      .sum(id_6),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(""),
      .id_9(id_8),
      .id_10(id_11),
      .id_11(id_5 - 1'b0),
      .id_12(1),
      .id_13(1 - !1),
      .id_14(1),
      .id_15(1)
  );
  wire id_14;
  wire id_15;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wand  id_1,
    input  tri   id_2,
    input  tri0  id_3
);
  assign id_1 = id_2;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3
  );
endmodule
