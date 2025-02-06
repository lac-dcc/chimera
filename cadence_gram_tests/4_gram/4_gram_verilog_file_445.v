// Seed: 1014599846
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_12;
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
    id_51,
    id_52,
    id_53,
    id_54,
    id_55,
    id_56,
    id_57,
    id_58,
    id_59,
    id_60,
    id_61,
    id_62
);
  output wire id_62;
  input wire id_61;
  output wire id_60;
  output wire id_59;
  inout wire id_58;
  output wire id_57;
  output wire id_56;
  input wire id_55;
  inout wire id_54;
  input wire id_53;
  output wire id_52;
  input wire id_51;
  input wire id_50;
  inout wire id_49;
  input wire id_48;
  output wire id_47;
  output wire id_46;
  output wire id_45;
  input wire id_44;
  output wire id_43;
  inout wire id_42;
  inout wire id_41;
  output wire id_40;
  output wire id_39;
  inout wire id_38;
  inout wire id_37;
  input wire id_36;
  output wire id_35;
  input wire id_34;
  output wire id_33;
  input wire id_32;
  input wire id_31;
  output wire id_30;
  input wire id_29;
  input wire id_28;
  input wire id_27;
  input wire id_26;
  output wire id_25;
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_63(
      .id_0(id_6),
      .id_1(1),
      .id_2(id_38),
      .id_3(id_39),
      .id_4($realtime),
      .id_5($realtime),
      .id_6(id_27[-1]),
      .id_7(id_44),
      .id_8(),
      .id_9(1 & $realtime),
      .id_10(-1'b0),
      .id_11(1)
  );
  assign id_58 = id_32;
  logic [7:0] id_64;
  module_0 modCall_1 (
      id_9,
      id_43,
      id_22,
      id_24,
      id_41,
      id_60,
      id_45,
      id_1,
      id_33,
      id_8,
      id_42
  );
  nmos id_65 (id_28, $realtime);
  assign id_16 = id_19;
  assign id_64[-1] = -1;
  and primCall (
      id_42,
      id_28,
      id_15,
      id_51,
      id_32,
      id_9,
      id_27,
      id_19,
      id_36,
      id_61,
      id_11,
      id_3,
      id_48,
      id_4,
      id_10,
      id_37,
      id_1,
      id_24,
      id_58,
      id_17,
      id_26,
      id_34,
      id_41,
      id_55,
      id_21,
      id_49,
      id_7,
      id_44,
      id_54,
      id_50,
      id_53,
      id_38,
      id_31,
      id_6,
      id_64,
      id_2,
      id_14,
      id_29,
      id_63,
      id_8,
      id_12
  );
  specify
    $setup(posedge id_66, negedge id_67, id_14);
    (negedge id_68 => (id_69  : id_58)) = (id_36 != id_1  : (-1): $realtime, -1  : ($realtime): 1);
    (id_70 + => id_71) = ($realtime : $realtime : {1, -1}, id_6  : -1  : id_71);
  endspecify
endmodule
