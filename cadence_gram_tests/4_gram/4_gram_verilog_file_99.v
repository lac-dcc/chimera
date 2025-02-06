// Seed: 3385458329
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
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_14(
      1, 1, ($realtime)
  ); id_15(
      .id_0(-1'b0), .id_1(id_12), .id_2(-1)
  );
  wire id_16;
  id_17(
      .id_0($realtime == $realtime),
      .id_1(id_8),
      .id_2($realtime),
      .id_3(id_11[$realtime]),
      .id_4(-1'd0)
  );
  assign id_11 = id_9;
  id_18(
      .id_0(1), .id_1(-1), .id_2($realtime), .id_3($realtime)
  );
  wire id_19;
  id_20(
      .id_0(id_17),
      .id_1($realtime),
      .id_2(id_16),
      .id_3(id_5[$realtime]),
      .id_4(1'b0),
      .id_5(-1),
      .id_6(id_10),
      .id_7(1),
      .id_8(id_19),
      .id_9(id_8),
      .id_10((-1)),
      .id_11($realtime),
      .id_12()
  );
  wire id_21;
  assign id_4 = $realtime;
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
    id_51
);
  inout wire id_51;
  inout wire id_50;
  input wire id_49;
  inout wire id_48;
  input wire id_47;
  input wire id_46;
  output wire id_45;
  input wire id_44;
  output wire id_43;
  output wire id_42;
  inout wire id_41;
  inout wire id_40;
  inout wire id_39;
  output wire id_38;
  output wire id_37;
  inout wire id_36;
  inout wire id_35;
  output wire id_34;
  input wire id_33;
  inout wire id_32;
  output wire id_31;
  output wire id_30;
  inout wire id_29;
  output wire id_28;
  input wire id_27;
  output wire id_26;
  output wire id_25;
  input wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  specify
    (id_52 + => id_53) = (id_40[-1] : !id_20  : $realtime, !id_44  : id_52  : $realtime);
  endspecify
  module_0 modCall_1 (
      id_41,
      id_7,
      id_45,
      id_32,
      id_40,
      id_31,
      id_2,
      id_2,
      id_40,
      id_44,
      id_40,
      id_43,
      id_51
  );
endmodule
