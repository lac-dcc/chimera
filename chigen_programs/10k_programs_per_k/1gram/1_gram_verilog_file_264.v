// Seed: 256773955
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input wire id_3,
    input wand id_4
);
  id_6(
      .id_0(1),
      .id_1(1),
      .id_2(id_4),
      .id_3(id_1),
      .id_4(id_3),
      .id_5(id_3),
      .id_6(id_3),
      .id_7(1),
      .id_8(1),
      .id_9(~1),
      .id_10(id_4),
      .id_11(id_1),
      .id_12(1'b0),
      .id_13(),
      .id_14(id_0),
      .id_15(1),
      .id_16(1'b0),
      .id_17(1)
  );
  assign id_6 = ~id_4;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    output tri0 id_5
    , id_12,
    input uwire id_6,
    output tri1 id_7,
    output tri0 id_8,
    input wand id_9,
    input wand id_10
);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_9,
      id_1,
      id_6
  );
  assign modCall_1.type_0 = 0;
endmodule
