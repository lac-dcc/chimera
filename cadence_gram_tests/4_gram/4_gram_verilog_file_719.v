// Seed: 1713033055
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_24(
      .id_0(-1),
      .id_1((id_6)),
      .id_2(-1'd0),
      .id_3(id_3),
      .id_4($realtime),
      .id_5($realtime),
      .id_6(-1),
      .id_7(),
      .id_8(id_22),
      .id_9($realtime)
  );
  wire id_25;
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
    id_15,
    id_16
);
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_16,
      id_2,
      id_2,
      id_5,
      id_10,
      id_10,
      id_12,
      id_5,
      id_1,
      id_12,
      id_2,
      id_8,
      id_14,
      id_12,
      id_2,
      id_12,
      id_1,
      id_6,
      id_8,
      id_7,
      id_8,
      id_14,
      id_8
  );
  id_17(
      .id_0(id_12),
      .id_1(1),
      .id_2(1),
      .id_3(id_11),
      .id_4(1'b0),
      .id_5($realtime),
      .id_6(id_7),
      .id_7(id_10 & $realtime),
      .id_8(id_7)
  ); id_18(
      .id_0(id_7)
  );
endmodule
