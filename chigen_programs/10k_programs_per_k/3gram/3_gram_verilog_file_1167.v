// Seed: 4062348072
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output supply1 id_4,
    input tri0 id_5,
    output wor id_6,
    input wor id_7,
    output wire id_8,
    input tri1 id_9
    , id_11, id_12
);
  id_13(
      .id_0(),
      .id_1(id_11),
      .id_2(1),
      .id_3(id_5),
      .id_4(1),
      .id_5(1),
      .id_6(id_12),
      .id_7(1'b0),
      .id_8(id_3),
      .id_9(1),
      .id_10(1 != id_1),
      .id_11(),
      .id_12(1),
      .id_13(id_5 & 1),
      .id_14(1'b0),
      .id_15(1),
      .id_16(id_0),
      .id_17(id_0),
      .id_18(id_5),
      .id_19(id_4),
      .id_20(1),
      .id_21(1),
      .id_22()
  );
endmodule
module module_1 (
    output tri0  id_0,
    output uwire id_1,
    input  wire  id_2
);
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
