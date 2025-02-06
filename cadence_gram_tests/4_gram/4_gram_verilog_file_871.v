// Seed: 3379520707
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
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
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
    id_21
);
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_22(
      .id_0(1'b0),
      .id_1($realtime),
      .id_2(id_16[$realtime]),
      .id_3(),
      .id_4(id_21[-1]),
      .id_5(-1'b0),
      .id_6(-1'b0),
      .id_7($realtime),
      .id_8(-1),
      .id_9($realtime),
      .id_10(id_5),
      .id_11(),
      .id_12(1'b0),
      .id_13(id_11),
      .id_14(id_9),
      .id_15(-1),
      .id_16(-1),
      .id_17($realtime),
      .id_18(-1),
      .id_19(-1'b0),
      .id_20(id_19),
      .id_21($realtime),
      .id_22(1'h0),
      .id_23($realtime)
  ); id_23(
      .id_0(id_8),
      .id_1(-1),
      .id_2(id_17),
      .id_3($realtime & id_15),
      .id_4(id_13),
      .id_5(1'b0),
      .id_6(id_3),
      .id_7(-1'b0)
  );
  assign id_22 = id_22;
  assign id_17 = $realtime;
  wire id_24;
  wire id_25;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_19,
      id_2,
      id_11,
      id_19,
      id_20,
      id_25,
      id_4,
      id_24,
      id_6,
      id_14,
      id_17
  );
  assign id_14 = $realtime;
  wire id_26;
  wire id_27;
  assign id_10 = -1;
  wire id_28;
  assign id_2 = id_7 ? id_5 : -1'h0;
  or primCall (
      id_4,
      id_17,
      id_21,
      id_3,
      id_20,
      id_1,
      id_19,
      id_24,
      id_22,
      id_23,
      id_15,
      id_5,
      id_11,
      id_2,
      id_6,
      id_7,
      id_12,
      id_9,
      id_25
  );
  wire id_29;
endmodule
