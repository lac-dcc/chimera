// Seed: 1223918718
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
    id_34
);
  input wire id_34;
  output wire id_33;
  output wire id_32;
  input wire id_31;
  input wire id_30;
  output wire id_29;
  input wire id_28;
  output wire id_27;
  input wire id_26;
  input wire id_25;
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ;
  assign id_33 = 1;
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
    id_20
);
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_20,
      id_20,
      id_20,
      id_4,
      id_19,
      id_20,
      id_6,
      id_9,
      id_20,
      id_16,
      id_6,
      id_19,
      id_3,
      id_19,
      id_17,
      id_1,
      id_20,
      id_6,
      id_5,
      id_15,
      id_6,
      id_5,
      id_13,
      id_20,
      id_20,
      id_20,
      id_1,
      id_19,
      id_20,
      id_18,
      id_16,
      id_14,
      id_20,
      id_9
  );
  assign id_6 = $realtime ? -1 : $realtime;
  wire id_21;
  assign id_20 = $realtime;
  assign id_7  = -1'b0;
  id_22(
      .id_0(id_9),
      .id_1(id_13),
      .id_2(id_11[$realtime]),
      .id_3(-1'b0),
      .id_4($realtime),
      .id_5(!id_15 == $realtime),
      .id_6($realtime),
      .id_7($realtime)
  );
endmodule
