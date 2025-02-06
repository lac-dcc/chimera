// Seed: 796674649
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
    id_30
);
  input wire id_30;
  output wire id_29;
  inout wire id_28;
  input wire id_27;
  input wire id_26;
  inout wire id_25;
  input wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [7:0] id_31;
  assign id_1[$realtime] = $realtime ? id_31[$realtime] : 1;
  wire id_32;
  id_33(
      .id_0(id_2),
      .id_1(1'b0 | -1),
      .id_2(id_24),
      .id_3(id_12),
      .id_4(id_6),
      .id_5(id_24),
      .id_6($realtime)
  );
  wire id_34;
  wire id_35;
  assign id_16 = id_19[-1];
  wire id_36;
  wire id_37;
  id_38(
      .id_0(1),
      .id_1(id_32),
      .id_2($realtime),
      .id_3(id_37),
      .id_4(),
      .id_5(id_14),
      .id_6(id_20),
      .id_7(id_23[$realtime]),
      .id_8(1 != (-1 ? !id_28[$realtime] : -1))
  ); id_39(
      $realtime, 1, id_30[$realtime] == $realtime
  );
  assign id_18 = id_11;
  id_40(
      .id_0(id_9),
      .id_1(1),
      .id_2(),
      .id_3(id_36),
      .id_4(id_28),
      .id_5($realtime && $realtime && -1'd0),
      .id_6(1),
      .id_7(1),
      .id_8(id_22),
      .id_9(1),
      .id_10(1'b0),
      .id_11(-1),
      .id_12(id_35)
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
    id_37,
    id_38,
    id_39,
    id_40,
    id_41,
    id_42,
    id_43,
    id_44,
    id_45,
    id_46
);
  inout wire id_46;
  input wire id_45;
  inout wire id_44;
  inout wire id_43;
  input wire id_42;
  input wire id_41;
  inout wire id_40;
  output wire id_39;
  inout wire id_38;
  output wire id_37;
  input wire id_36;
  inout wire id_35;
  inout wire id_34;
  inout wire id_33;
  output wire id_32;
  output wire id_31;
  output wire id_30;
  output wire id_29;
  inout wire id_28;
  input wire id_27;
  inout wire id_26;
  inout wire id_25;
  inout wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_47(
      .id_0($realtime),
      .id_1(id_46),
      .id_2($realtime),
      .id_3($realtime),
      .id_4(id_44),
      .id_5(1),
      .id_6()
  );
  parameter id_48 = 1;
  wire id_49 = id_22;
  wire id_50;
  supply1 id_51;
  module_0 modCall_1 (
      id_25,
      id_51,
      id_9,
      id_12,
      id_37,
      id_28,
      id_40,
      id_1,
      id_9,
      id_22,
      id_34,
      id_23,
      id_48,
      id_12,
      id_50,
      id_28,
      id_44,
      id_8,
      id_25,
      id_22,
      id_11,
      id_15,
      id_25,
      id_20,
      id_51,
      id_36,
      id_33,
      id_25,
      id_37,
      id_25
  );
  wire id_52;
  assign id_31 = id_46;
  wire id_53;
  reg  id_54;
  wire id_55;
  always @(id_25[1 : 1] or negedge id_53) begin : LABEL_0
    id_51 = $realtime;
    id_10 = -1;
  end
  nand primCall (
      id_35,
      id_13,
      id_4,
      id_43,
      id_7,
      id_50,
      id_27,
      id_14,
      id_45,
      id_46,
      id_47,
      id_26,
      id_36,
      id_25,
      id_24,
      id_41,
      id_48,
      id_12,
      id_34,
      id_20,
      id_44,
      id_2,
      id_1,
      id_21,
      id_40,
      id_38,
      id_11,
      id_28,
      id_49,
      id_42,
      id_22,
      id_6,
      id_51,
      id_33
  );
  assign id_23 = $realtime;
  always_comb @(id_11 or negedge id_12) begin : LABEL_0
    if (id_28) begin : LABEL_0
      if (-1) begin : LABEL_0
        if (id_45) id_54 <= id_26;
        else begin : LABEL_0
          if (id_24) begin : LABEL_0
            id_39 <= id_35;
          end
        end
      end
    end
  end
  wire id_56;
  wire id_57;
  wire id_58;
endmodule
