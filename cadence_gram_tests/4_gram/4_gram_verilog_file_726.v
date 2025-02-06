// Seed: 3958012851
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  id_6(
      .id_0(),
      .id_1(-1'b0),
      .id_2($realtime),
      .id_3(id_2),
      .id_4(id_3[1]),
      .id_5($realtime),
      .id_6(-1)
  );
  assign id_1[$realtime] = $realtime;
  wire id_7;
  wire id_8;
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
  inout wire id_32;
  output wire id_31;
  output wire id_30;
  output wire id_29;
  input wire id_28;
  inout wire id_27;
  output wire id_26;
  inout wire id_25;
  output wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_33(
      .id_0(-1'b0),
      .id_1(id_5),
      .id_2(id_16),
      .id_3($realtime),
      .id_4(id_17),
      .id_5(id_7),
      .id_6(id_5),
      .id_7($realtime),
      .id_8(id_24),
      .id_9(id_26),
      .id_10(id_26),
      .id_11(~id_4),
      .id_12(id_12),
      .id_13(),
      .id_14(1),
      .id_15(),
      .id_16(-1),
      .id_17(-1),
      .id_18(id_31),
      .id_19(),
      .id_20(1),
      .id_21(id_27),
      .id_22(-1),
      .id_23(id_28),
      .id_24(1),
      .id_25(1),
      .id_26(id_2),
      .id_27(-1'b0)
  );
  wor id_34;
  module_0 modCall_1 (
      id_18,
      id_2,
      id_18,
      id_22,
      id_23
  );
  always @(negedge -1) begin : LABEL_0
    id_31 <= 1;
    if (id_34) begin : LABEL_0
      if (id_22) id_27 <= 1 & id_18[-1'b0];
    end else if (id_18[$realtime]) begin : LABEL_0
      if (1) id_10 <= $realtime;
    end
    id_17 <= $realtime;
  end
  assign id_11 = id_5 ? !id_19 : id_16;
endmodule
