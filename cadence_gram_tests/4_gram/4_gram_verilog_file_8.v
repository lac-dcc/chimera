// Seed: 1715131043
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
    id_20
);
  input wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_21;
  supply0 id_22, id_23, id_24, id_25, \id_26 , id_27;
  assign id_8  = 1;
  assign id_14 = $realtime ? id_16 : 1 != id_23;
  wire id_28;
  id_29(
      .id_0(id_18), .id_1($realtime), .id_2($realtime), .id_3(-1)
  );
  assign id_9 = id_20 ? id_17 : 1;
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
    id_29
);
  inout wire id_29;
  input wire id_28;
  inout wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_27,
      id_21,
      id_15,
      id_20,
      id_5,
      id_18,
      id_7,
      id_3,
      id_25,
      id_21,
      id_5,
      id_5,
      id_12,
      id_4,
      id_18,
      id_21,
      id_21,
      id_2
  );
  id_30(
      .id_0(id_17),
      .id_1($realtime),
      .id_2($realtime),
      .id_3($realtime),
      .id_4($realtime),
      .id_5(!id_7),
      .id_6(id_20)
  );
  wire id_31;
  wire id_32;
  wire id_33;
  id_34(
      .id_0(id_24), .id_1(-1), .id_2(id_13), .id_3(-1'b0), .id_4(id_19), .id_5(id_20)
  );
endmodule
