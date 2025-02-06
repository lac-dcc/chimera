// Seed: 1265304421
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
    id_37
);
  inout wire id_37;
  inout wire id_36;
  inout wire id_35;
  inout wire id_34;
  inout wire id_33;
  output wire id_32;
  inout wire id_31;
  input wire id_30;
  input wire id_29;
  inout wire id_28;
  inout wire id_27;
  inout wire id_26;
  output wire id_25;
  input wire id_24;
  inout wire id_23;
  input wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
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
    id_16
);
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
  tri0 id_18;
  id_19(
      .id_0(id_10),
      .id_1($realtime + -1),
      .id_2(id_18),
      .id_3(-1),
      .id_4($realtime),
      .id_5(1),
      .id_6($realtime),
      .id_7(!id_18),
      .id_8()
  ); id_20(
      .id_0(id_12),
      .id_1(-1),
      .id_2($realtime),
      .id_3(1),
      .id_4(-1),
      .id_5($realtime),
      .id_6(-1'b0),
      .id_7(id_12),
      .id_8()
  );
  logic [7:0] id_21;
  always @($realtime or 1 or posedge -1'b0 or posedge id_3) begin : LABEL_0
    id_15 <= $realtime;
  end
  wire id_22;
  module_0 modCall_1 (
      id_9,
      id_17,
      id_8,
      id_8,
      id_9,
      id_8,
      id_1,
      id_13,
      id_18,
      id_11,
      id_9,
      id_8,
      id_22,
      id_22,
      id_8,
      id_22,
      id_22,
      id_8,
      id_17,
      id_9,
      id_8,
      id_17,
      id_18,
      id_3,
      id_17,
      id_13,
      id_17,
      id_17,
      id_3,
      id_12,
      id_13,
      id_7,
      id_22,
      id_9,
      id_22,
      id_18,
      id_18
  );
  id_23(
      id_2[-1&&-1&&-1], 1
  );
  wire id_24;
  id_25(
      1, $realtime
  );
  assign id_21[1] = id_12;
endmodule
