// Seed: 598442856
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  assign id_2 = $realtime ? id_2 : id_2;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  wire id_6;
  id_7(
      .id_0(),
      .id_1(id_1),
      .id_2($realtime),
      .id_3(),
      .id_4($realtime),
      .id_5(-1),
      .id_6((1)),
      .id_7(id_6)
  ); id_8(
      .id_0($realtime),
      .id_1(),
      .id_2(),
      .id_3(1'b0),
      .id_4($realtime),
      .id_5(),
      .id_6(-1),
      .id_7(id_5),
      .id_8(1'b0),
      .id_9(id_4),
      .id_10(id_6),
      .id_11(id_3[$realtime : $realtime]),
      .id_12($realtime),
      .id_13(-1),
      .id_14(),
      .id_15(id_5),
      .id_16(id_3),
      .id_17(id_2),
      .id_18(1),
      .id_19($realtime),
      .id_20($realtime),
      .id_21()
  );
endmodule
