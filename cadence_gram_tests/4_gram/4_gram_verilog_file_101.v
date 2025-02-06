// Seed: 550407104
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
    id_16
);
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_17 = -1'b0 - $realtime;
  assign module_1.id_16 = 0;
  wire id_18;
  id_19(
      id_2, -1'b0 && $realtime
  ); id_20(
      .id_0(id_5 - 1'b0), .id_1(id_6)
  );
  wire id_21;
  wire id_22;
  assign id_4 = $realtime;
  assign id_5 = 1;
  specify
  endspecify
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  inout wire id_27;
  inout wire id_26;
  input wire id_25;
  output wire id_24;
  inout wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_10[$realtime] = id_27;
  assign id_1 = id_8;
  id_28(
      .id_0(-1),
      .id_1(id_6[1'b0]),
      .id_2(-1),
      .id_3(-1),
      .id_4(-1'd0),
      .id_5(id_27),
      .id_6(-1),
      .id_7(id_17),
      .id_8(id_7),
      .id_9(id_10)
  );
  module_0 modCall_1 (
      id_3,
      id_26,
      id_26,
      id_20,
      id_5,
      id_23,
      id_3,
      id_23,
      id_19,
      id_27,
      id_17,
      id_24,
      id_3,
      id_9,
      id_20,
      id_18
  );
  wire id_29 = $realtime;
  id_30(
      .id_0(id_27),
      .id_1(-1'b0),
      .id_2(id_9),
      .id_3(id_5),
      .id_4(1),
      .id_5(id_24),
      .id_6($realtime | id_16),
      .id_7(1),
      .id_8(id_15),
      .id_9(-1),
      .id_10()
  );
  assign id_18 = (1'b0 || -1'b0 || $realtime || id_29) & 1;
  id_31(
      .id_0(id_28), .id_1(), .id_2(id_16), .id_3(), .id_4($realtime), .id_5(id_16), .id_6(id_9)
  );
  assign id_3 = id_9;
  assign id_1 = $realtime ? $realtime : id_6[$realtime];
endmodule
