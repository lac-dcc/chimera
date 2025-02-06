// Seed: 3002619330
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
    id_47,
    id_48,
    id_49,
    id_50,
    id_51,
    id_52
);
  inout wire id_52;
  inout wire id_51;
  inout wire id_50;
  output wire id_49;
  output wire id_48;
  output wire id_47;
  inout wire id_46;
  inout wire id_45;
  output wire id_44;
  inout wire id_43;
  output wire id_42;
  input wire id_41;
  output wire id_40;
  inout wire id_39;
  input wire id_38;
  inout wire id_37;
  inout wire id_36;
  input wire id_35;
  inout wire id_34;
  inout wire id_33;
  inout wire id_32;
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  inout wire id_28;
  inout wire id_27;
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = !$realtime;
  wire id_53;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  id_6 :
  assume property (-1);
  always @(posedge 1 or posedge !id_6) begin : LABEL_0
    id_1 <= id_1;
  end
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_4,
      id_3,
      id_3,
      id_5,
      id_6,
      id_3,
      id_6,
      id_6,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_6,
      id_3,
      id_3,
      id_4,
      id_3,
      id_5,
      id_6,
      id_6,
      id_6,
      id_3,
      id_3,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6,
      id_3,
      id_3,
      id_3,
      id_3,
      id_6,
      id_3,
      id_6,
      id_5,
      id_6,
      id_4,
      id_6,
      id_4,
      id_3,
      id_6,
      id_6,
      id_4,
      id_3,
      id_6,
      id_3,
      id_3
  );
  id_7(
      .id_0($realtime),
      .id_1(1),
      .id_2($realtime),
      .id_3($realtime),
      .id_4(1'b0),
      .id_5(id_1),
      .id_6(id_5),
      .id_7(),
      .id_8($realtime),
      .id_9(1 == $realtime),
      .id_10($realtime),
      .id_11($realtime & id_3),
      .id_12(id_6),
      .id_13(id_2[$realtime]),
      .id_14(id_2),
      .id_15($realtime),
      .id_16(id_2),
      .id_17(id_1),
      .id_18($realtime == id_4),
      .id_19($realtime),
      .id_20($realtime),
      .id_21($realtime),
      .id_22(!$realtime || 1 || -1),
      .id_23(1 & $realtime),
      .id_24($realtime),
      .id_25()
  );
  wire id_8;
endmodule
