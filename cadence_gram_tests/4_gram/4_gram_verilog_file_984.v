// Seed: 2256306035
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
    id_35
);
  inout wire id_35;
  inout wire id_34;
  input wire id_33;
  input wire id_32;
  output wire id_31;
  input wire id_30;
  output wire id_29;
  inout wire id_28;
  output wire id_27;
  inout wire id_26;
  output wire id_25;
  input wire id_24;
  input wire id_23;
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_36;
  id_37(
      id_1, -1'b0
  );
  assign id_20 = id_23;
  id_38(
      .id_0(($realtime)),
      .id_1(id_30),
      .id_2($realtime),
      .id_3(id_35),
      .id_4(id_28),
      .id_5(1),
      .id_6()
  );
  wire  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ;
  wire id_55;
  wire id_56;
  id_57(
      .id_0(id_31),
      .id_1((-1'b0)),
      .id_2(id_51),
      .id_3(id_49),
      .id_4(id_38),
      .id_5(1 | ~id_14),
      .id_6($realtime),
      .id_7(id_49),
      .id_8($realtime),
      .id_9(id_27),
      .id_10(id_5),
      .id_11(id_19),
      .id_12(1'b0),
      .id_13(id_36)
  );
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
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_7,
      id_2,
      id_7,
      id_7,
      id_6,
      id_7,
      id_4,
      id_4,
      id_1,
      id_8,
      id_7,
      id_4,
      id_3,
      id_3,
      id_4,
      id_8,
      id_4,
      id_7,
      id_7,
      id_4,
      id_2,
      id_5,
      id_8,
      id_8,
      id_4,
      id_2,
      id_2,
      id_5,
      id_4,
      id_7,
      id_4,
      id_3,
      id_2
  );
  tri1 id_9;
  id_10(
      .id_0(),
      .id_1(),
      .id_2(id_6),
      .id_3(),
      .id_4((id_8)),
      .id_5(1),
      .id_6(1 == $realtime),
      .id_7(),
      .id_8(-1'b0),
      .id_9(id_9 && id_6),
      .id_10(-1),
      .id_11(id_8),
      .id_12((id_2)),
      .id_13(1'd0)
  );
endmodule
