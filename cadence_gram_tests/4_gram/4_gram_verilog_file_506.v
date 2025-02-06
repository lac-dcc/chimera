// Seed: 2605107642
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
    id_23,
    id_24,
    id_25,
    id_26
);
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_24 = id_21;
  assign id_9  = ($realtime);
  assign id_7  = id_17;
  id_27(
      id_19, id_3
  );
  wire id_28;
  assign id_6 = $realtime;
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
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  uwire id_20;
  wire  id_21;
  assign id_20 = id_18;
  assign id_10 = 1;
  id_22(
      .id_0($realtime || id_20),
      .id_1(1 - id_2),
      .id_2($realtime),
      .id_3(~id_17),
      .id_4($realtime),
      .id_5(-1),
      .id_6(id_9),
      .id_7(id_6),
      .id_8($realtime),
      .id_9(-1),
      .id_10(id_1),
      .id_11(1),
      .id_12($realtime)
  ); id_23(
      .id_0(id_7)
  );
  module_0 modCall_1 (
      id_21,
      id_3,
      id_21,
      id_21,
      id_12,
      id_1,
      id_21,
      id_2,
      id_2,
      id_9,
      id_20,
      id_8,
      id_19,
      id_15,
      id_4,
      id_17,
      id_18,
      id_19,
      id_4,
      id_10,
      id_20,
      id_18,
      id_10,
      id_10,
      id_6,
      id_9
  );
  assign id_11[$realtime] = -1'b0;
endmodule
