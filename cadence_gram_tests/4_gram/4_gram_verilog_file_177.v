// Seed: 3601462306
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
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38,
    id_39,
    id_40,
    id_41,
    id_42,
    id_43,
    id_44,
    id_45,
    id_46,
    id_47
);
  input wire id_47;
  input wire id_46;
  input wire id_45;
  input wire id_44;
  input wire id_43;
  input wire id_42;
  input wire id_41;
  input wire id_40;
  inout wire id_39;
  inout wire id_38;
  output wire id_37;
  inout wire id_36;
  input wire id_35;
  inout wire id_34;
  input wire id_33;
  output wire id_32;
  output wire id_31;
  inout wire id_30;
  input wire id_29;
  inout wire id_28;
  inout wire id_27;
  input wire id_26;
  inout wire id_25;
  inout wire id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  tri1 id_48;
  id_49(
      id_24, id_30, -1, -1, id_7, id_48
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
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_14(
      .id_0($realtime),
      .id_1(($realtime)),
      .id_2($realtime),
      .id_3($realtime),
      .id_4(1),
      .id_5(id_1),
      .id_6($realtime),
      .id_7($realtime),
      .id_8(id_12[$realtime]),
      .id_9()
  );
  module_0 modCall_1 (
      id_3,
      id_11,
      id_6,
      id_3,
      id_3,
      id_8,
      id_3,
      id_13,
      id_6,
      id_3,
      id_11,
      id_3,
      id_4,
      id_3,
      id_1,
      id_3,
      id_6,
      id_3,
      id_3,
      id_3,
      id_13,
      id_8,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_13,
      id_8,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_8,
      id_3,
      id_8,
      id_6,
      id_1,
      id_1,
      id_6,
      id_1
  );
  logic [7:0] id_15;
  wire id_16;
  assign id_10[-1] = id_3;
  always @(posedge -1 or $realtime) begin : LABEL_0
    id_9 <= id_7;
  end
  assign id_12 = $realtime ? id_15 : id_2;
  wire id_17;
  id_18(
      .id_0($realtime)
  ); id_19(
      .id_0(id_12),
      .id_1(id_17),
      .id_2($realtime),
      .id_3(1'h0 & id_7),
      .id_4($realtime),
      .id_5(id_5[-1]),
      .id_6(id_10),
      .id_7(id_14),
      .id_8($realtime),
      .id_9(1),
      .id_10(1),
      .id_11(id_4)
  ); id_20(
      .id_0(id_1)
  );
endmodule
