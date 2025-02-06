// Seed: 61490173
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
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire \id_12 ;
  assign id_7 = id_11 ? ($realtime) : id_11;
  id_13(
      .id_0($realtime), .id_1()
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
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic [7:0] id_13;
  wire id_14;
  assign id_13 = id_10[$realtime];
  assign id_11 = 1'b0;
  wand id_15, id_16, id_17;
  wire id_18;
  id_19(
      .id_0(id_2[-1]), .id_1(id_6[1]), .id_2(id_6), .id_3()
  );
  wire id_20;
  id_21(
      .id_0(id_4)
  );
  assign id_5 = $realtime;
  assign id_4 = id_20;
  id_22(
      .id_0($realtime),
      .id_1(id_20),
      .id_2((id_17)),
      .id_3(-1),
      .id_4(1),
      .id_5(id_1[-1]),
      .id_6(id_13[1]),
      .id_7(-1),
      .id_8(id_19),
      .id_9(),
      .id_10(1),
      .id_11(!id_16),
      .id_12(id_2)
  );
  assign id_13[$realtime :-1'b0] = $realtime;
  wire id_23;
  wire id_24;
  wire id_25;
  tri1  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ;
  module_0 modCall_1 (
      id_41,
      id_15,
      id_45,
      id_32,
      id_31,
      id_4,
      id_24,
      id_28,
      id_16,
      id_42,
      id_14
  );
  id_48 :
  assume property (@(negedge $realtime) $realtime |-> id_21);
  wire id_49;
  wire id_50;
  wire id_51;
  specify
    (id_52 + => id_53) = (id_28, 1'b0 : id_47  : -1);
  endspecify
endmodule
