module module_0 (
    output [id_1 : id_1] id_2,
    input id_3,
    input [id_2 : id_3] id_4,
    input logic id_5
);
  id_6 id_7 (
      .id_5(id_1),
      .id_5(id_2)
  );
  id_8 id_9 (
      .id_5(id_7),
      .id_4(id_5),
      .id_2(id_1)
  );
  id_10 id_11 (
      .id_5(id_5),
      .id_2(id_4),
      .id_7(id_4),
      .id_5(id_1),
      .id_3(id_2),
      .id_7(id_2[id_5])
  );
  logic id_12;
  logic [1 : id_11] id_13;
  id_14 id_15 (
      .id_1 (id_1),
      .id_4 (id_1),
      .id_11(id_4)
  );
  id_16 id_17 (
      .id_12(id_15),
      .id_11(id_5),
      .id_2 (id_3)
  );
  id_18 id_19 (
      .id_2 (id_13),
      .id_17(id_12),
      .id_11(id_11),
      .id_12(id_15),
      .id_17(id_2),
      .id_12(id_15),
      .id_13(id_2)
  );
  logic id_20;
  id_21 id_22 (
      .id_13(id_20),
      .id_20(id_23)
  );
  id_24 id_25 (
      .id_19(id_20),
      .id_22(id_23),
      .id_9 (id_17)
  );
  id_26 id_27 (
      .id_5 (id_9),
      .id_12(id_12)
  );
  assign id_23 = id_3;
  id_28 id_29 (
      .id_20(id_27),
      .id_23(~(id_7)),
      .id_7 (id_12),
      .id_25(id_1),
      .id_15(1),
      .id_5 (id_5)
  );
  id_30 id_31 (
      .id_7 (id_1),
      .id_11(id_4),
      .id_17(id_1),
      .id_11(1'b0),
      .id_20(id_20),
      .id_7 (id_1)
  );
  id_32 id_33 (
      .id_3 (id_20),
      .id_4 (id_20),
      .id_19(id_12),
      .id_9 (id_1)
  );
  id_34 id_35 (
      .id_22(id_20),
      .id_7 (id_13)
  );
  id_36 id_37 (
      .id_33(id_15),
      .id_13(id_4),
      .id_3 (id_22)
  );
  always @(posedge id_23) begin
    id_23 <= id_11;
  end
  id_38 id_39 (
      .id_40(id_41),
      .id_41(id_41),
      .id_40(id_41),
      .id_40(id_41),
      .id_41(id_40),
      .id_42(1'd0),
      .id_42(1),
      .id_42(1'b0),
      .id_42(1),
      .id_41(id_43),
      .id_43(!id_40)
  );
  id_44 id_45 (
      .id_40(1),
      .id_39(id_40),
      .id_41(id_39)
  );
  id_46 id_47 (
      .id_41(id_40),
      .id_39(id_40),
      .id_41(id_41),
      .id_45(id_43),
      .id_39(id_42),
      .id_39(id_40),
      .id_43(1),
      .id_41((id_42[id_42])),
      .id_45(id_48),
      .id_43(id_41),
      .id_43(id_48)
  );
  id_49 id_50 (
      .id_43(id_47),
      .id_39(id_48)
  );
  id_51 id_52 (
      .id_43(id_41),
      .id_45(id_50),
      .id_40(id_43)
  );
  id_53 id_54 (
      .id_41(id_41),
      .id_41(id_47),
      .id_43(id_47),
      .id_42(id_47),
      .id_50(id_40),
      .id_42(id_39[id_50]),
      .id_43(id_48),
      .id_47(id_41)
  );
  logic id_55;
  assign id_48 = id_40 ? id_55 : id_55;
  id_56 id_57 (
      .id_52(id_47),
      .id_55(id_39)
  );
  id_58 id_59 (
      .id_47(id_48),
      .id_57(id_39[id_42]),
      .id_57(1'b0),
      .id_48(id_48),
      .id_41(id_43),
      .id_45(id_41)
  );
  id_60 id_61 (
      .id_57(id_41),
      .id_39(id_48),
      .id_41(id_54)
  );
  id_62 id_63 (
      .id_42(id_57),
      .id_52(id_55 ** id_57),
      .id_39(id_59)
  );
  assign id_63 = id_55;
  id_64 id_65 (
      .id_45(id_40),
      .id_52(id_48),
      .id_57(id_55),
      .id_61(id_54),
      .id_52(id_63)
  );
  id_66 id_67 (
      .id_52(1),
      .id_40(1'h0)
  );
  id_68 id_69 (
      .id_41(id_57),
      .id_61(id_67),
      .id_61(id_59)
  );
endmodule
