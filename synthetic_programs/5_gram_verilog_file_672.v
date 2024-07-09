module module_0 (
    output logic id_1
);
  id_2 id_3 (
      .id_2(id_2[id_2]),
      .id_1(1),
      .id_2(id_2),
      .id_4(id_2)
  );
  id_5 id_6 (
      .id_5(id_4),
      .id_5(1'b0 * id_1),
      .id_2(id_7),
      .id_5(id_5),
      .id_4(id_7),
      .id_2(id_5)
  );
  logic id_8;
  id_9 id_10 (
      .id_8(id_8),
      .id_7(id_3),
      .id_5(id_1)
  );
  id_11 id_12 (
      .id_6(id_6),
      .id_6(1)
  );
  id_13 id_14 (
      .id_11(id_5),
      .id_13(id_5),
      .id_12(id_13),
      .id_3 (id_9),
      .id_7 (~id_8),
      .id_11(id_8),
      .id_12(id_5),
      id_6 * id_11,
      .id_2 (id_7)
  );
  logic id_15;
  id_16 id_17 (
      .id_13(id_11[id_1]),
      .id_7 (id_12),
      .id_7 (id_7)
  );
  id_18 id_19 (
      .id_17(id_16[1]),
      .id_6 (id_16),
      .id_14(1'b0)
  );
  input id_20;
  id_21 id_22 (
      1'd0,
      .id_9 (id_7[id_21 : id_1]),
      .id_2 (id_7),
      .id_1 (1),
      .id_10(1'b0)
  );
  id_23 id_24 (
      .id_4 (id_21),
      .id_10(id_17)
  );
  id_25 id_26 (
      id_16[id_14],
      .id_24(id_12)
  );
  logic id_27;
  logic id_28;
  logic [~  id_24 : 1] id_29;
  assign id_8 = id_5;
  logic [id_8 : id_17] id_30 (
      .id_18(id_4),
      .id_12(1),
      .id_11(id_8)
  );
  logic id_31;
  logic id_32;
  assign id_30 = 1;
  always @(posedge 1) begin
    id_6 = id_2;
  end
  logic id_33;
  assign id_33[1] = 1;
  id_34 id_35;
  id_36 id_37 ();
  id_38 id_39, id_40, id_41;
  logic id_42 (
      .id_37(id_38),
      id_34
  );
  logic id_43;
  assign id_38 = id_36[1&id_39];
  assign id_36[id_36] = (1);
  id_44 id_45 (
      .id_40(id_36),
      .id_33(id_42[1]),
      .id_35(id_42)
  );
  id_46 id_47 (
      .id_46(~id_33),
      .id_43(id_33 == 1)
  );
  logic id_48;
  logic id_49 (
      .id_42(id_40),
      1
  );
  assign id_40 = 1;
  assign id_43 = id_38;
  id_50 id_51 (
      .id_49(id_41),
      1,
      .id_41(1),
      .id_47(id_40)
  );
  id_52 id_53 (
      id_35[id_43],
      .id_48(id_41),
      .id_38(1 == id_39)
  );
  assign id_52 = 1;
  always @(~id_45[id_42[id_48]] or posedge (id_46[id_50[id_42[id_42]]])) begin
    if ((1)) begin
      if (id_50) begin
        id_42 <= ~id_50[id_50];
      end
    end else if (id_54) begin
      id_54[id_54] <= id_54 * {id_54, id_54} + 1;
    end else begin
      id_55 <= #id_56 id_55;
    end
  end
  id_57 id_58 (
      .id_57(id_57[id_57[id_57[id_57[1]]]]),
      .id_59(id_57),
      .id_57(id_60),
      .id_60(1),
      .id_60(id_57),
      .id_60(id_57)
  );
  logic id_61;
  id_62 id_63;
  id_64 id_65 (
      .id_57(id_61[(1)]),
      .id_58(id_61),
      .id_63(id_57[1]),
      .id_64(id_60)
  );
  assign id_63 = id_62;
  id_66 id_67 (
      .id_59(1),
      .id_58(1'b0),
      .id_63(id_59),
      .id_59(id_59)
  );
  assign id_63 = id_61;
  assign id_63[id_60] = 1'b0 ? id_63 & id_65[id_58] : id_60[1] ? id_57 : 1;
  logic id_68 (
      .id_61(1'b0),
      .id_63(1'b0),
      id_66
  );
  logic id_69 (
      .id_61((id_67)),
      .id_66(id_67 == id_68)
  );
  id_70 id_71 (
      .id_68(id_62),
      id_59,
      .id_69(1)
  );
endmodule
