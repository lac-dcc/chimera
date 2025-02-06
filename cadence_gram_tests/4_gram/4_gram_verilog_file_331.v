// Seed: 3572476734
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
    id_25
);
  output wire id_25;
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_26;
  wire id_27;
  assign id_10[$realtime : 1] = id_18;
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
    id_34
);
  output wire id_34;
  input wire id_33;
  output wire id_32;
  output wire id_31;
  input wire id_30;
  inout wire id_29;
  input wire id_28;
  inout wire id_27;
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  inout wire id_23;
  input wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_27,
      id_15,
      id_23,
      id_3,
      id_30,
      id_24,
      id_15,
      id_18,
      id_12,
      id_24,
      id_24,
      id_3,
      id_11,
      id_15,
      id_3,
      id_15,
      id_14,
      id_13,
      id_7,
      id_26,
      id_26,
      id_23,
      id_11
  );
  assign id_11 = id_15;
  wire id_35, id_36;
  assign id_4 = id_1[1];
  wire id_37;
  assign id_5 = id_22;
  wire id_38;
  assign id_26 = $realtime;
  id_39(
      .id_0(id_3),
      .id_1($realtime),
      .id_2(-1'b0),
      .id_3($realtime),
      .id_4(id_38),
      .id_5(id_18[-1 :-1'b0]),
      .id_6(id_14),
      .id_7(1'd0),
      .id_8(id_34),
      .id_9(1)
  );
  wire id_40;
  assign id_31 = id_24 ? id_22 : $realtime;
  assign id_24 = -1;
  wire id_41;
  specify
    (negedge id_42 => (id_43 -: $realtime)) = (1  : id_28  : $realtime, id_11  : -1  : $realtime);
    (posedge id_44 => (id_45  : id_13)) = (id_30  : -1  : -1, 1 && -1  : -1  : id_7);
  endspecify
endmodule
