// Seed: 3319942075
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
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = $realtime;
  wire id_16;
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
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5 = id_10;
  uwire id_17 = 1'h0;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_5,
      id_16,
      id_5,
      id_8,
      id_13,
      id_17,
      id_7,
      id_9,
      id_2,
      id_3,
      id_6,
      id_8
  );
  id_18(
      .id_0(id_7), .id_1($realtime - ~id_14)
  );
  wire id_19;
  id_20(
      .id_0(id_10),
      .id_1(id_12[$realtime]),
      .id_2(id_16),
      .id_3($realtime),
      .id_4(),
      .id_5($realtime),
      .id_6(id_1),
      .id_7(-1 + $realtime),
      .id_8(),
      .id_9(-1)
  );
  wire id_21;
  id_22(
      .id_0(), .id_1($realtime)
  );
  wire id_23, id_24 = id_21;
  wire id_25;
  assign id_6 = -1;
  wire id_26;
  id_27(
      $realtime, id_15
  );
endmodule
