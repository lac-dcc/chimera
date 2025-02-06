// Seed: 2741546384
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
    id_24
);
  input wire id_24;
  inout wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_25(
      .id_0(),
      .id_1(id_10),
      .id_2(id_10),
      .id_3($realtime),
      .id_4($realtime),
      .id_5(1'd0),
      .id_6(id_22)
  );
  wire id_26;
  assign id_5 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6,
      id_7,
      id_5,
      id_6,
      id_7,
      id_7,
      id_1,
      id_5,
      id_8,
      id_6,
      id_8,
      id_5,
      id_6,
      id_6,
      id_8,
      id_8,
      id_7,
      id_5,
      id_7,
      id_5,
      id_5
  );
  supply0 id_9;
  wire id_10;
  id_11(
      .id_0($realtime && id_5),
      .id_1(id_2[1]),
      .id_2($realtime),
      .id_3(id_1),
      .id_4(),
      .id_5(id_3),
      .id_6($realtime),
      .id_7(-1'b0),
      .id_8(1'b0),
      .id_9(id_7),
      .id_10(id_8),
      .id_11(!id_7),
      .id_12($realtime),
      .id_13(id_7),
      .id_14(id_4),
      .id_15(id_7),
      .id_16($realtime),
      .id_17(id_8),
      .id_18(id_4[1]),
      .id_19(1'b0),
      .id_20(id_6),
      .id_21($realtime),
      .id_22(1),
      .id_23(),
      .id_24(-1),
      .id_25(-1),
      .id_26(($realtime)),
      .id_27(id_4[$realtime]),
      .id_28(id_5)
  );
  logic [7:0] id_12;
  id_13(
      .id_0(id_4),
      .id_1(1),
      .id_2(id_6),
      .id_3(id_12[1'd0]),
      .id_4(id_6),
      .id_5(-1),
      .id_6(id_10),
      .id_7(id_12),
      .id_8(1),
      .id_9($realtime),
      .id_10(-1'h0 == id_9),
      .id_11(1)
  );
  wire id_14;
  wire id_15;
endmodule
