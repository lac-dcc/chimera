// Seed: 104088629
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
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_21;
  assign id_20 = 1 ? id_2 : $realtime;
  wire id_22;
  assign id_6[-1 : 1] = $realtime;
  assign id_12 = -1;
  wire id_23;
  wire id_24;
  id_25(
      .id_0(!$realtime), .id_1($realtime), .id_2($realtime), .id_3(), .id_4()
  ); id_26(
      .id_0((1'b0 & id_9)), .id_1(id_21), .id_2()
  ); id_27(
      .id_0(id_28), .id_1(id_6), .id_2(id_17), .id_3(id_25), .id_4(-1'b0), .id_5(1)
  );
  wire id_29;
  wire id_30;
  wire id_31;
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
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_21;
  wire id_22;
  wire id_23, id_24;
  assign id_8 = $realtime ? -1'b0 : -1;
  wire id_25;
  id_26(
      .id_0(-1'd0)
  );
  assign id_5  = id_3;
  assign id_13 = $realtime;
  wire id_27;
  wire id_28 = id_4;
  module_0 modCall_1 (
      id_8,
      id_23,
      id_4,
      id_19,
      id_6,
      id_17,
      id_3,
      id_21,
      id_5,
      id_27,
      id_25,
      id_24,
      id_3,
      id_22,
      id_23,
      id_18,
      id_28,
      id_21,
      id_5,
      id_5
  );
  wire id_29, id_30;
  wire id_31;
  assign id_17[$realtime : $realtime] = id_1;
  wire id_32;
  wire id_33;
  wire id_34;
  wire id_35;
  wire id_36;
endmodule
