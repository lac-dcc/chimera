// Seed: 3865032287
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
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_13;
  assign id_4 = -1'h0 ? id_1 : id_5;
  wire id_14;
  assign id_2 = $realtime;
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
    id_27,
    id_28,
    id_29,
    id_30
);
  input wire id_30;
  output wire id_29;
  inout wire id_28;
  input wire id_27;
  input wire id_26;
  input wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  supply0 id_31;
  id_32(
      1, id_13, $realtime && id_19, id_17[(-1)]
  );
  assign id_19 = id_30;
  wire id_33;
  module_0 modCall_1 (
      id_6,
      id_23,
      id_7,
      id_16,
      id_31,
      id_11,
      id_2,
      id_15,
      id_27,
      id_16,
      id_27,
      id_19
  );
  assign id_4 = id_23 ? $realtime : id_5[$realtime];
  wire id_34;
  id_35(
      .id_0(id_28),
      .id_1(id_24[$realtime]),
      .id_2(-1),
      .id_3(!1),
      .id_4((id_9)),
      .id_5(1 << -1'b0),
      .id_6(id_16),
      .id_7($realtime)
  ); id_36(
      .id_0($realtime),
      .id_1(1),
      .id_2(id_5),
      .id_3(-1),
      .id_4($realtime),
      .id_5(-1),
      .id_6(),
      .id_7($realtime),
      .id_8(id_1)
  );
  assign id_31 = $realtime;
  id_37(
      .id_0(1), .id_1(1 - $realtime)
  );
  wire id_38;
  assign id_1[!$realtime :-1'b0] = $realtime && id_11;
  id_39(
      .id_0(id_8)
  );
  wire id_40;
endmodule
