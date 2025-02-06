// Seed: 2939737667
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_16;
  wire id_17;
  id_18(
      1, $realtime
  );
  wire id_19 = id_9 ? id_17 : id_16;
  wire id_20;
  tri  id_21 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  id_4(
      .id_0((-1)),
      .id_1(id_2),
      .id_2((id_3 - $realtime)),
      .id_3(id_1 & $realtime & -1),
      .id_4($realtime),
      .id_5(1'b0),
      .id_6(id_2),
      .id_7(),
      .id_8((id_1)),
      .id_9(id_2),
      .id_10($realtime),
      .id_11(1),
      .id_12(),
      .id_13($realtime),
      .id_14(1'b0),
      .id_15(id_2),
      .id_16(id_5),
      .id_17(id_3),
      .id_18(id_6),
      .id_19(1),
      .id_20($realtime),
      .id_21(),
      .id_22($realtime),
      .id_23()
  );
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1
  );
  assign modCall_1.id_21 = 0;
endmodule
