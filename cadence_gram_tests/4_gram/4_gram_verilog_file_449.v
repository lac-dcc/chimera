// Seed: 2421828854
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
    id_19
);
  input wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
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
    id_32
);
  input wire id_32;
  input wire id_31;
  input wire id_30;
  input wire id_29;
  output wire id_28;
  inout wire id_27;
  inout wire id_26;
  output wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_33(
      .id_0(id_11),
      .id_1(1'b0),
      .id_2($realtime),
      .id_3((1) | id_23),
      .id_4($realtime),
      .id_5(id_13),
      .id_6($realtime),
      .id_7(-1),
      .id_8(!id_4),
      .id_9(id_29),
      .id_10($realtime),
      .id_11($realtime),
      .id_12($realtime),
      .id_13($realtime),
      .id_14(1),
      .id_15(id_11),
      .id_16(id_7),
      .id_17(),
      .id_18(id_26),
      .id_19(id_9),
      .id_20(1),
      .id_21(!id_13[$realtime]),
      .id_22(id_29),
      .id_23({id_34, id_3}),
      .id_24(1),
      .id_25(),
      .id_26(-1),
      .id_27(id_16)
  );
  wire id_35;
  wire id_36 = id_15;
  module_0 modCall_1 (
      id_35,
      id_26,
      id_20,
      id_4,
      id_19,
      id_14,
      id_18,
      id_16,
      id_14,
      id_35,
      id_27,
      id_15,
      id_23,
      id_3,
      id_6,
      id_36,
      id_35,
      id_36,
      id_4
  );
  wire id_37;
  supply1 id_38 = $realtime;
  always @(posedge 1 or negedge $realtime) begin : LABEL_0
    if (1) begin : LABEL_0
      id_9 <= $realtime;
      id_39.id_40(1);
    end else begin : LABEL_0
      id_5 = id_37;
      id_9 <= id_12;
    end
  end
  id_41(
      .id_0(-1'b0)
  );
  assign id_3 = 1'b0;
  tri0 id_42 = (-1'b0);
endmodule
