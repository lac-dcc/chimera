// Seed: 322680000
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
    id_13
);
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_14(
      .id_0(id_12),
      .id_1(id_7),
      .id_2(id_9),
      .id_3(1),
      .id_4($realtime),
      .id_5(1),
      .id_6(id_9),
      .id_7(1'b0),
      .id_8(1),
      .id_9($realtime),
      .id_10()
  );
  assign id_11 = -1 ? id_14 : id_14;
  assign id_8  = $realtime ? 1 : id_7;
  wand id_15 = -1;
  wire id_16, id_17, id_18, id_19, id_20, id_21, id_22;
endmodule
module module_1 (
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
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_16;
  id_17(
      .id_0(id_11),
      .id_1($realtime),
      .id_2($realtime),
      .id_3(id_4),
      .id_4(id_1),
      .id_5(1),
      .id_6((id_5[1])),
      .id_7(id_12),
      .id_8(1),
      .id_9(),
      .id_10($realtime),
      .id_11($realtime),
      .id_12(id_11[$realtime]),
      .id_13($realtime),
      .id_14($realtime),
      .id_15(id_5),
      .id_16($realtime)
  );
  assign id_14 = id_4;
  id_18(
      .id_0(id_10[1]), .id_1($realtime)
  );
  assign id_17 = id_4;
  module_0 modCall_1 (
      id_16,
      id_2,
      id_15,
      id_15,
      id_2,
      id_13,
      id_6,
      id_7,
      id_12,
      id_7,
      id_17,
      id_16,
      id_16
  );
endmodule
