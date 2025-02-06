// Seed: 819955097
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
    id_46
);
  inout wire id_46;
  input wire id_45;
  output wire id_44;
  input wire id_43;
  output wire id_42;
  inout wire id_41;
  output wire id_40;
  output wire id_39;
  input wire id_38;
  output wire id_37;
  input wire id_36;
  input wire id_35;
  output wire id_34;
  input wire id_33;
  inout wire id_32;
  inout wire id_31;
  inout wire id_30;
  input wire id_29;
  output wire id_28;
  inout wire id_27;
  output wire id_26;
  inout wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_47;
  wire id_48;
  assign id_16 = id_36;
  id_49(
      .id_0(id_32), .id_1(id_36), .id_2(id_23), .id_3(-1), .id_4($realtime), .id_5($realtime)
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
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri id_9 = $realtime & $realtime;
  assign id_8 = 1;
  wire id_10;
  assign id_3 = id_2;
  assign id_7[-1'b0] = $realtime ? -1 : -1;
  assign id_9 = $realtime;
  id_11(
      .id_0(id_4), .id_1(id_1)
  );
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_9,
      id_9,
      id_10,
      id_8,
      id_8,
      id_3,
      id_8,
      id_3,
      id_8,
      id_9,
      id_9,
      id_8,
      id_9,
      id_9,
      id_8,
      id_4,
      id_10,
      id_8,
      id_9,
      id_9,
      id_8,
      id_9,
      id_6,
      id_10,
      id_9,
      id_2,
      id_10,
      id_9,
      id_9,
      id_2,
      id_10,
      id_8,
      id_2,
      id_6,
      id_9,
      id_6,
      id_6,
      id_8,
      id_10,
      id_9,
      id_10,
      id_9,
      id_8
  );
endmodule
