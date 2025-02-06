// Seed: 3215159274
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
    id_23
);
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply1 id_24;
  id_25(
      .id_0(id_6)
  );
  wire id_26, id_27;
  assign id_17 = id_18.id_20;
  wire id_28;
  wire id_29;
  wire id_30;
  wire id_31;
  assign id_1  = id_19;
  assign id_22 = 1 ? id_20 : id_1 ? id_6 : id_12;
  parameter id_32 = $realtime;
  wire id_33 = id_5;
  id_34(
      .id_0()
  );
  wire id_35;
  wire id_36;
  wire id_37;
  assign id_4 = 1;
  id_38(
      .id_0(id_29), .id_1(-1), .id_2(id_31), .id_3()
  );
  parameter id_39 = id_24;
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
    id_18
);
  output wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_19;
  int id_20 (
      .id_0(1'b0),
      .id_1(id_4),
      .id_2(id_6[1]),
      .id_3($realtime),
      .id_4((id_9)),
      .id_5()
  );
  wire id_21;
  wire id_22;
  assign id_14 = id_15 ? 1 : id_7;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_10,
      id_2,
      id_15,
      id_2,
      id_22,
      id_12,
      id_19,
      id_14,
      id_4,
      id_8,
      id_22,
      id_5,
      id_8,
      id_16,
      id_22,
      id_11,
      id_17,
      id_19,
      id_4,
      id_5,
      id_14
  );
  assign modCall_1.id_1 = 0;
  wire id_23;
  wire id_24;
  wire id_25;
endmodule
