// Seed: 3962745585
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
    id_22
);
  inout wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_14 = 0;
  id_23(
      .id_0(1),
      .id_1(-1),
      .id_2(id_24 == $realtime),
      .id_3(id_15),
      .id_4(id_14),
      .id_5(id_19),
      .id_6($realtime),
      .id_7(1),
      .id_8(),
      .id_9(id_10),
      .id_10(id_15),
      .id_11(id_10),
      .id_12(-1),
      .id_13(1),
      .id_14($realtime),
      .id_15(id_19),
      .id_16(id_11),
      .id_17($realtime)
  );
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_13(
      $realtime, $realtime, $realtime, $realtime
  );
  tri id_14, id_15, id_16, id_17;
  id_18(
      id_6, $realtime, !id_17, id_1[1], (id_9)
  );
  module_0 modCall_1 (
      id_16,
      id_17,
      id_11,
      id_4,
      id_2,
      id_14,
      id_4,
      id_11,
      id_10,
      id_11,
      id_11,
      id_16,
      id_16,
      id_10,
      id_11,
      id_8,
      id_10,
      id_11,
      id_8,
      id_9,
      id_6,
      id_8
  );
  wire id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29, id_30;
endmodule
