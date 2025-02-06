// Seed: 481732588
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
    id_14
);
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_15(
      id_14, id_7, id_6
  );
  assign id_1 = id_12;
  wire id_16;
  id_17(
      .id_0($realtime),
      .id_1((-1) & 1'h0),
      .id_2((id_3)),
      .id_3(1'b0),
      .id_4($realtime),
      .id_5(id_13)
  );
  wire id_18 = id_6;
  wire id_19;
  wire id_20;
  id_21(
      .id_0($realtime),
      .id_1($realtime == $realtime),
      .id_2($realtime),
      .id_3(id_16),
      .id_4(1'd0),
      .id_5(id_19)
  );
  assign id_11 = id_4;
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
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_20(
      .id_0($realtime), .id_1($realtime), .id_2()
  );
  module_0 modCall_1 (
      id_16,
      id_10,
      id_12,
      id_4,
      id_6,
      id_18,
      id_18,
      id_9,
      id_12,
      id_17,
      id_6,
      id_12,
      id_3,
      id_13
  );
  id_21(
      .id_0(id_19), .id_1()
  ); id_22(
      .id_0($realtime), .id_1(-1)
  );
endmodule
