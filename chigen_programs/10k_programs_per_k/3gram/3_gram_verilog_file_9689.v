// Seed: 3095119508
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_5(
      .id_0(id_3), .id_1(id_4), .id_2(1)
  ); id_6(
      .id_0(1),
      .id_1(1),
      .id_2(),
      .id_3(id_2),
      .id_4(1'b0),
      .id_5(1),
      .id_6(1'b0 > 1),
      .id_7(1),
      .id_8(1),
      .id_9(id_1),
      .id_10(1),
      .id_11(1),
      .id_12(id_7),
      .id_13(),
      .id_14(1),
      .id_15(1),
      .id_16(id_2),
      .id_17(id_3),
      .id_18(1),
      .id_19(id_1),
      .id_20(1),
      .id_21(1'd0),
      .id_22((1 && 1)),
      .id_23(id_1),
      .id_24(1'b0),
      .id_25(1)
  );
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_5;
  final begin : LABEL_0
    if (id_5 | 1'b0) id_5 <= id_4 ? 1 : 1;
  end
  module_0 modCall_1 (
      id_1,
      id_4,
      id_3,
      id_1
  );
endmodule
